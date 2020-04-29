package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//싱글톤 패턴 디자인
public class BoardDao {
	private static BoardDao dao = new BoardDao();
	// class안에서 미리 자신의 인스턴스 생성

	private BoardDao() {}

	public static BoardDao getInstance() {
		return dao;
	}

	public int count() throws SQLException {
		String sql = "SELECT count(*) FROM tb_board";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);

		rs.close();
		pstmt.close();
		con.close();

		return count;
	}

	public void insert(BoardVO board) throws SQLException {
		String sql1 = "SELECT board_seq.nextval FROM dual";
		String sql2 = "INSERT INTO tb_board VALUES(?,?,?,?,sysdate,?)";

		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql1);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int seq = rs.getInt(1);
		System.out.println("시퀀스 번호 : " + seq);
		rs.close();
		pstmt.close();

		if (board.getGroupNo() == 0) {
			// 새글
			board.setNo(seq);
			board.setGroupNo(seq);
		} else {
			// 답글 : 원글의 글번호를 그룹번호로 사용한다.
			board.setNo(seq);
		}

		pstmt = con.prepareStatement(sql2);
		pstmt.setInt(1, board.getNo());
		pstmt.setString(2, board.getTitle());
		pstmt.setString(3, board.getWriter());
		pstmt.setString(4, board.getContent());
		pstmt.setInt(5, board.getGroupNo());
		pstmt.executeUpdate();

		pstmt.close();
		con.close();
		System.out.println("저장완료");
	}

	public void delete(int no) throws SQLException {
		String sql = "DELETE FROM tb_board WHERE board_no = ?";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}

	public void modify(BoardVO board) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE tb_board ");
		sql.append(" SET");
		sql.append("	board_title = ?, ");
		sql.append("	board_write = ?, ");
		sql.append("	board_content = ? ");
		sql.append(" WHERE board_no = ? ");
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getNo());
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}

	public ArrayList<BoardVO> list(int begin, int end) throws SQLException {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT board_no, board_title, board_regdate, group_no ");
		sql.append("FROM( ");
		sql.append("	SELECT ROWNUM num, board_no, board_title, board_regdate, group_no");
		sql.append("	FROM ( ");
		sql.append("		SELECT board_no, board_title, board_regdate, group_no ");
		sql.append("		FROM tb_board ");
		sql.append("		ORDER BY group_no DESC, board_no ASC) ");
		sql.append("	) WHERE num between ? and ? ");

		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<BoardVO> list = new ArrayList<>();
		while (rs.next()) {
			BoardVO board = new BoardVO();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setRegdate(rs.getDate("board_regdate"));
			board.setGroupNo(rs.getInt("group_no"));

			list.add(board);
		}

		rs.close();
		pstmt.close();
		con.close();

		return list;
	}

	public BoardVO detail(int no) throws SQLException {
		String sql = "SELECT * FROM tb_board WHERE board_no=?";

		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		BoardVO board = null;
		while (rs.next()) {
			board = new BoardVO();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_write"));
			board.setContent(rs.getString("board_content"));
			board.setRegdate(rs.getDate("board_regdate"));
			board.setGroupNo(rs.getInt("group_no"));
		}
		rs.close();
		pstmt.close();
		con.close();

		return board;
	}

	public ArrayList<CommentVO> getCommentList(int boardNo) throws SQLException {
		String sql = "SELECT * FROM tb_comment WHERE board_no = ?";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();

		ArrayList<CommentVO> list = new ArrayList<>();
		CommentVO comment = null;
		while (rs.next()) {
			comment = new CommentVO();
			comment.setNo(rs.getInt("comment_no"));
			comment.setWriter(rs.getString("comment_wirter"));
			comment.setContent(rs.getString("comment_content"));
			comment.setRegdate(rs.getDate("comment_regdate"));
			list.add(comment);
		}
		rs.close();
		pstmt.close();
		con.close();

		return list;
	}

	public void addComment(CommentVO comment) throws SQLException {
		String sql = "INSERT INTO tb_comment VALUES(board_seq.nextval,?,?,sysdate,?)";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, comment.getWriter());
		pstmt.setString(2, comment.getContent());
		pstmt.setInt(3, comment.getBoardNo());
		pstmt.executeQuery();
		pstmt.close();
		con.close();
	}

	public void deleteComment(int commentNo) throws SQLException {
		String sql = "DELETE FROM tb_comment WHERE comment_no = ?";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, commentNo);
		pstmt.executeQuery();
		pstmt.close();
		con.close();
	}

	public boolean hasReply(int no) throws SQLException {
		String sql = "SELECT count(*) FROM tb_board WHERE group_no=?";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		rs.close();
		pstmt.close();
		con.close();
		return (count > 1 ? true : false);
	}

	public void deleteCommentByBoardNo(int boardNo) throws SQLException {
		String sql = "DELETE FROM tb_comment WHERE comment_no=?";
		Connection con = ConUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.close();
		con.close();
	}
}
