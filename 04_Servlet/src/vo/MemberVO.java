package vo;

public class MemberVO {
	/* Member Variable */
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String email;
	
	/* Constructor */
	public MemberVO(){}
	public MemberVO(String id, String pw, String name, String tel, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.email = email;
	}
		
	/* Get/Set Method*/
	public String getId(){return id;}
	public void setId(String id){this.id = id;}
	public String getPw(){return pw;}
	public void setPw(String pw){this.pw = pw;}
	public String getName(){return name;}
	public void setName(String name){this.name = name;}
	public String getTel(){return tel;}
	public void setTel(String tel){this.tel = tel;}
	public String getEmail(){return email;}
	public void setEmail(String email){this.email = email;}
}
