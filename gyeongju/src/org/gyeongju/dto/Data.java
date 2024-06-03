package org.gyeongju.dto;

public class Data {
	private int bno;
	private String title;
	private String content;
	private String filename;
	private String resdate;
	private int visited;
	
	public Data() {}
	public Data(int bno, String title, String content, String filename, String resdate, int visited) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
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
		return "Data [bno=" + bno + ", title=" + title + ", content=" + content + ", filename=" + filename
				+ ", resdate=" + resdate + ", visited=" + visited + "]";
	}
}
