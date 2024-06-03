package org.gyeongju.dto;

public class Member {
	private String id;
	private String pw;
	private String email;
	private String tel;
	private String postcode;
	private String address;
	private String regdate;
	
	public Member(String id, String pw, String email, String tel, String postcode, String address, String regdate) {
		super();
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.tel = tel;
		this.postcode = postcode;
		this.address = address;
		this.regdate = regdate;
	}
	
	public Member() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getPostcode() {
		return tel;
	}

	public void setPostcode(String postcode) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", email=" + email + ", tel=" + tel + ", postcode=" + postcode + ", address=" + address
				+ ", regdate=" + regdate + "]";
	}
	
	
}
