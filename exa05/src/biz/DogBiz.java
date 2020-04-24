package biz;

import static util.DbUtil.close;
import static util.DbUtil.commit;
import static util.DbUtil.getConnection;
import static util.DbUtil.rollback;

import java.sql.Connection;
import java.util.List;

import dao.DogDao;
import vo.Dog;;

public class DogBiz {
	
	public List<Dog> getDogs() {
		Connection con = getConnection();
		DogDao dogDao = new DogDao(con);
		List<Dog> dogs = dogDao.getDogs();
		close(con);
		
		return dogs;
	}
	
	public Dog getDog(String id) {
		Connection con = getConnection();
		DogDao dogDao = new DogDao(con);
		Dog dog = dogDao.getDog(id);
		close(con);
		
		return dog;
	}
	
	public boolean updateReadcount(String id) {
		boolean result = false;
		Connection con = getConnection();
		DogDao dogDao = new DogDao(con);
		result = dogDao.updateReadcount(id);
		if (result) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
}
