package com.spring.cordova.dto;

public class BoardDTO {
	private int bno;
	private String title;
	private String content;
	private String userId;
	private String fileName;
	private Object regDate;
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Object getRegDate() {
		return regDate;
	}
	public void setRegDate(Object regDate) {
		this.regDate = regDate;
	}
}