package org.gyeongju.dto;

public class Place {
	private int pno;
	private String pname;
	private String ptype;
	private String ptel;
	private String paddr;
	//private String pgps;
	private String pcomm;
	private String filename;
	private String item;
	
	public Place(int pno, String pname, String ptype, String ptel, String paddr, String pcomm, String filename, String item) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.ptype = ptype;
		this.ptel = ptel;
		this.paddr = paddr;
		this.pcomm = pcomm;
		this.filename = filename;
		this.item = item;
	}
	
	public Place() {}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	public String getPtel() {
		return ptel;
	}

	public void setPtel(String ptel) {
		this.ptel = ptel;
	}

	public String getPaddr() {
		return paddr;
	}

	public void setPaddr(String paddr) {
		this.paddr = paddr;
	}

	public String getPcomm() {
		return pcomm;
	}

	public void setPcomm(String pcomm) {
		this.pcomm = pcomm;
	}
	
	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Override
	public String toString() {
		return "Place [pno=" + pno + ", pname=" + pname + ", ptype=" + ptype + ", ptel=" + ptel + ", paddr=" + paddr
				+ ", pcomm=" + pcomm + ", filename=" + filename + ", item=" + item +"]";
	}
	
	
}
