package test;

import java.sql.Date;

public class Emp {
	private int eno;
	private String ename;
	private java.sql.Date hiredate;

	public Emp() {
	}

	public Emp(int eno, String ename, Date hiredate) {
		super();
		this.eno = eno;
		this.ename = ename;
		this.hiredate = hiredate;
	}

	public int getEno() {
		return eno;
	}

	public void setEno(int eno) {
		this.eno = eno;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public java.sql.Date getHiredate() {
		return hiredate;
	}

	public void setHiredate(java.sql.Date hiredate) {
		this.hiredate = hiredate;
	}
}