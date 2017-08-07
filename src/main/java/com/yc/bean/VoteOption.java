package com.yc.bean;

import java.io.Serializable;

public class VoteOption implements Serializable{

	private static final long serialVersionUID = 6843302466567311934L;
	
	private Integer voteid;
	private String voteoption;
	private Integer vsid;
	private Integer voteorder;
	public Integer getVoteid() {
		return voteid;
	}
	public void setVoteid(Integer voteid) {
		this.voteid = voteid;
	}
	public String getVoteoption() {
		return voteoption;
	}
	public void setVoteoption(String voteoption) {
		this.voteoption = voteoption;
	}
	public Integer getVsid() {
		return vsid;
	}
	public void setVsid(Integer vsid) {
		this.vsid = vsid;
	}
	public Integer getVoteorder() {
		return voteorder;
	}
	public void setVoteorder(Integer voteorder) {
		this.voteorder = voteorder;
	}
	@Override
	public String toString() {
		return "Voteoption [voteid=" + voteid + ", voteoption=" + voteoption + ", vsid=" + vsid + ", voteorder="
				+ voteorder + "]";
	}
	
	

}
