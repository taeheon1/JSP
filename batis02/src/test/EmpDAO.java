package test;

import java.util.List;

public interface EmpDAO {
	public List<Emp> list();
	public Emp info(int eno);
	public int insert(Emp emp);
	public int update(Emp emp);
	public int delete(int eno);
}