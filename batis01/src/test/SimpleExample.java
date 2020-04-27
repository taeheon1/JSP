package test;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class SimpleExample {
	private static SqlMapClient sqlMapper;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("SqlMapClient Instance." + e, e);
		}
	}

	public static List selectAllEmployee() throws SQLException {
		return sqlMapper.queryForList("selectAllEmployee");
	}

	public static Employee selectEmployeeById(int eno) throws SQLException {
		return (Employee) sqlMapper.queryForObject("selectEmployeeByEno", eno);
	}

	public static void insertEmployee(Employee emp) throws SQLException {
		sqlMapper.insert("insertEmployee", emp);
	}
	
	public static void updateEmployee(Employee emp) throws SQLException {
		sqlMapper.update("updateEmployee", emp);
	}
	
	public static void deleteEmployee(int eno) throws SQLException {
		sqlMapper.delete("deleteEmployeeByEno", eno);
	}
}
