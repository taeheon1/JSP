package dao;

import static util.DbUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.User;

public class LoginDao {
	Connection con;

	public LoginDao(Connection con) {
		super();
		this.con = con;
	}

	public User getUserLogin(String id, String passwd) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User user = null;

		try {
			String sql = "SELECT * FROM users WHERE id = ? AND passwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setAddr(rs.getString("addr"));
				user.setId(rs.getString("id"));
				user.setJob(rs.getString("job"));
				user.setPasswd(rs.getString("passwd"));
				user.setSalary(rs.getString("salary"));
				user.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return user;
	}

}