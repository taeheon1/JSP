package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.MemoVO;

public class MemoDAO {
	public static boolean addMemo(String writer, String content, String ip) {
		SqlSession ss = FactoryService.getFactory().openSession(true);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("writer", writer);
		map.put("content", content);
		map.put("ip", ip);
		int cnt = ss.insert("memo.add", map);
		ss.close();
		return (cnt > 0) ? true : false;
	}

	public static List<MemoVO> searchAll() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<MemoVO> list = ss.selectList("memo.selectAll");
		ss.close();
		return list;
	}
}
