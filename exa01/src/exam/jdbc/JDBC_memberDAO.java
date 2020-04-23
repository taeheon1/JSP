package exam.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class JDBC_memberDAO {
	Connection con; Statement st;
	PreparedStatement ps; ResultSet rs;
	String driverName="oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id ="lion"; String pwd="1234";
	public JDBC_memberDAO() {
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url,id,pwd);
			
		} catch (ClassNotFoundException e) {
			System.out.println(e + "=> 로드 실패");
		} catch (SQLException e) {
			System.out.println(e + "=> 연결 실패");
		}
	}
	
	public void db_close() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(st != null) st.close();
		} catch (SQLException e) {
			System.out.println(e + "=> 닫기 오류");
		}
	}
	public int memberInsert(MemberVO vo) {
		int result=0;
		try {
			String sql = "insert into member2 values (?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setInt(4, vo.getAge());
			ps.setString(5, vo.getAddr());
			ps.setString(6, vo.getBirth());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e + "=> memberInsert fail");
		} finally {
			db_close();
		}
		return result;
	}
	public ArrayList<MemberVO> getMemberlist(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from MEMBER2");
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
				vo.setBirth(rs.getString(6));
				list.add(vo);
			}
			
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally { db_close();}
		return list;
	}
	public ArrayList<MemberVO> getMemberlist(String keyField, String keyWord){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			String sql = "select * from MEMBER2";
			if(keyWord != null && !keyWord.equals("")) {
				sql += " WHERE " + keyField.trim()
				+ " LIKE '%"+keyWord.trim()
				+ "%' order by id";
			} else {
				sql += " order by id";
			}
			System.out.println("sql = " + sql);
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setId(rs.getString(1));
				vo.setPwd(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setAge(rs.getInt(4));
				vo.setAddr(rs.getString(5));
				vo.setBirth(rs.getString(6));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println(e + "=> getMemberlist fail");
		} finally { db_close();}
		return list;
	}
	
	public int delMemberlist(String id) {
		int result = 0;
		try {
			ps = con.prepareStatement("delete from MEMBER2 where id = ? ");
			ps.setString(1, id.trim());
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e + "=> delMemberlist fail");
		} finally { db_close();}
		return result;
	}
	
}
