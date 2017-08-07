package com.yc.bean;

import java.io.Serializable;

public class VoteItem implements Serializable{

	private static final long serialVersionUID = -3182978953125225053L;
	
	private Integer viid;
	private Integer voteid;
	private Integer vsid;
	private Integer uid;
	public Integer getViid() {
		return viid;
	}
	public void setViid(Integer viid) {
		this.viid = viid;
	}
	public Integer getVoteid() {
		return voteid;
	}
	public void setVoteid(Integer voteid) {
		this.voteid = voteid;
	}
	public Integer getVsid() {
		return vsid;
	}
	public void setVsid(Integer vsid) {
		this.vsid = vsid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Voteitem [viid=" + viid + ", voteid=" + voteid + ", vsid=" + vsid + ", uid=" + uid + "]";
	}
	
	
	

}
