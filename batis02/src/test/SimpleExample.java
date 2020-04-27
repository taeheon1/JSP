package test;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SimpleExample {
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("SqlSessionClient Instance." + e, e);
		}
	}

	public static List<Emp> list() throws SQLException {
		List<Emp> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("list");
		return list;
	}

	public static Emp info(int eno) throws SQLException {
		Emp emp = null;
		SqlSession session = sqlSessionFactory.openSession();
		emp = (Emp) session.selectOne("info", eno);
		return emp;
	}

	public static void insertEmployee(Emp emp) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("insert", emp);
		session.commit();
	}
	
	public static void updateEmployee(Emp emp) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		session.update("update", emp);
		session.commit();
	}
	
	public static void deleteEmployee(int eno) throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("delete", eno);
		session.commit();
	}
}
