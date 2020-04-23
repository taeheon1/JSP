package svc;

import static util.DbUtil.close;
import static util.DbUtil.getConnection;

import java.sql.Connection;

import vo.User;
import dao.LoginDao;

public class LoginBiz {
	
	public User getUserLogin(String id, String passwd) {
		Connection con = getConnection();
		LoginDao loginDao = new LoginDao(con);
		User user = loginDao.getUserLogin(id, passwd);
		close(con);
		return user;
	}
}