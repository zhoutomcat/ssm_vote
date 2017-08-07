package com.yc.biz;

import com.yc.bean.VoteUser;

public interface VoteBiz {

	//登录
	public VoteUser login(VoteUser voteUser);
	
	//判断用户名是否存在
	public VoteUser isUsernameExist(VoteUser user);
	
	//保存更新
	public void saveOrUpdate(VoteUser user);
	
}
