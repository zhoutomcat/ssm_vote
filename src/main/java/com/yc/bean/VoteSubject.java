package com.yc.bean;

import java.io.Serializable;

public class VoteSubject implements Serializable { // 投票主题表

	private static final long serialVersionUID = 7380361644644636321L;
	
	private Integer vsid;
	private String title;
	private Integer stype;
	public Integer getVsid() {
		return vsid;
	}
	public void setVsid(Integer vsid) {
		this.vsid = vsid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getStype() {
		return stype;
	}
	public void setStype(Integer stype) {
		this.stype = stype;
	}
	@Override
	public String toString() {
		return "Votesubject [vsid=" + vsid + ", title=" + title + ", stype=" + stype + "]";
	}
	
	

}
