package egovframework.example.board.service;

import java.sql.Timestamp;

public class BoardVO extends BoardDefaultVO{

	private static final long serialVersionUID = 1L;
	
	private String id;
	private String title;
	private String content;
	private String writer;
	private int viewCnt;
	private boolean noticeYn;
	private boolean deleteYn;
	private Timestamp createdDate;
	private Timestamp modifiedDate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public boolean isNoticeYn() {
		return noticeYn;
	}
	public void setNoticeYn(boolean noticeYn) {
		this.noticeYn = noticeYn;
	}
	public boolean isDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(boolean deleteYn) {
		this.deleteYn = deleteYn;
	}
	public Timestamp getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
	public Timestamp getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
