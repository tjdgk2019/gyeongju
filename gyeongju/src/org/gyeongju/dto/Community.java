package org.gyeongju.dto;

public class Community {
	private int bno;
	private String title;
	private String content;
	private String aid;
	private String filename;
	private String resdate;
	private int visited;
	
	public Community() {}
	public Community(int bno, String title, String content, String aid, String filename, String resdate, int visited) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.aid = aid;
		this.filename = filename;
		this.resdate = resdate;
		this.visited = visited;
	}
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}
	public int getVisited() {
		return visited;
	}
	public void setVisited(int visited) {
		this.visited = visited;
	}
	@Override
	public String toString() {
		return "Community [bno=" + bno + ", title=" + title + ", content=" + content + ", aid=" + aid
				+ ", filename=" + filename + ", resdate=" + resdate + ", visited=" + visited + "]";
	}
		
}
