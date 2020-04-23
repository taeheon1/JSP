package exam.jdbc;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String birth;
	private String addr;
	
	
	public MemberVO() {
		
	}
	public MemberVO(String id, String pwd, String name, int age, String birth, String addr) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.birth = birth;
		this.addr = addr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
	
	
	
	

}
