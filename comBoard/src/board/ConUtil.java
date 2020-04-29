package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConUtil {
	// 클래스 초기화 블럭(객체를 아무리 많이 만들어도 한번만 실행됨)
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 인스턴스 초기화 블럭(객체만들때마다 실행)
	{
	}

	public static Connection getConnection() throws SQLException {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "lion";
		String password = "1234";
		return DriverManager.getConnection(url, username, password);
	}
}
