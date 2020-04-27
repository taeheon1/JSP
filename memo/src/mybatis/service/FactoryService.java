package mybatis.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.naming.resources.Resource;

import jdk.nashorn.internal.runtime.regexp.JoniRegExp.Factory;

public class FactoryService {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader r = Resources.getResourceAsReader("mybatis/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) {
		}

	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
