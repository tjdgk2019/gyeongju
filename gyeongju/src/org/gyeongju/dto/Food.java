package org.gyeongju.dto;

public class Food {
	private int fno;
	private String fname;
	private String ftype;
	private String ftel; 
	private String faddr; 
	private String fcomm; 
	private String filename; //파일이름
	
	public Food() {}

	public Food(int fno, String fname, String ftype, String ftel, String faddr, String fcomm, String filename) {
		super();
		this.fno = fno;
		this.fname = fname;
		this.ftype = ftype;
		this.ftel = ftel;
		this.faddr = faddr;
		this.fcomm = fcomm;
		this.filename = filename;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFtype() {
		return ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public String getFtel() {
		return ftel;
	}

	public void setFtel(String ftel) {
		this.ftel = ftel;
	}

	public String getFaddr() {
		return faddr;
	}

	public void setFaddr(String faddr) {
		this.faddr = faddr;
	}

	public String getFcomm() {
		return fcomm;
	}

	public void setFcomm(String fcomm) {
		this.fcomm = fcomm;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "Food [fno=" + fno + ", fname=" + fname + ", ftype=" + ftype + ", ftel=" + ftel + ", faddr=" + faddr
				+ ", fcomm=" + fcomm + "filename=" + filename + "]";
	}
	
	
	
	
	
}
