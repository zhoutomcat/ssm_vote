package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.yc.bean.VoteUser;
import com.yc.biz.VoteBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.Encrypt;

@Service
@Transactional
public class VoteBizImpl implements VoteBiz{

	@Resource(name="baseDao")
	private BaseDao baseDao;
	
	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public VoteUser login(VoteUser voteUser) {
		Map<String,Object> map = new HashMap<>();
		map.put("uname", voteUser.getUname());
		map.put("pwd", voteUser.getPwd());
//		List<VoteUser> list = this.baseDao.findAll(VoteUser.class, "getUserByLogin" , map);
		List<VoteUser> list = this.baseDao.findAll(voteUser , "getUserByLogin"  );
		if(list.size()>0 && list!=null){
			return list.get(0);
		}
		return null;
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.SUPPORTS)
	public VoteUser isUsernameExist(VoteUser user) {
		List<VoteUser> list = baseDao.findAll(user, "isUsernameExist");
		if(list.size()>0 && list!=null){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void saveOrUpdate(VoteUser user) {
		if(user.getUid()!=null && user.getUid()!=0){
			//执行更新操作
			
		}else{
			//执行保存（插入）操作
			user.setPwd( Encrypt.md5AndSha(user.getPwd()));
			baseDao.save(user, "saveUser");
		}
	}
	
	
	
	
}
