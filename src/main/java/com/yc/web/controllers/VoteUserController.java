package com.yc.web.controllers;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.VoteUser;
import com.yc.biz.VoteBiz;
import com.yc.web.model.JsonModel;

@RestController
public class VoteUserController {

	@Resource(name = "voteBizImpl")
	private VoteBiz voteBiz;

	@RequestMapping("/voteUser_register.action")
	public JsonModel register(VoteUser user, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		String repwd = request.getParameter("repwd");
		String zccode = request.getParameter("zccode");
		String rand = (String) session.getAttribute("rand");
		if(!zccode.equals(rand)){
			jm.setCode(0);
			jm.setMsg("验证码错误");
			return jm;
		}
		if(!repwd.equals(user.getPwd())){
			jm.setCode(0);
			jm.setMsg("两次输入的密码不一致");
			return jm;
		}
		try {
			voteBiz.saveOrUpdate(user);
			jm.setCode(1);
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}

	@RequestMapping("/voteUser_isUsernameExist.action")
	public JsonModel isUsernameExist(VoteUser user){
		JsonModel jm = new JsonModel();
		
		try {
			VoteUser vu = voteBiz.isUsernameExist(user);
			if(vu!=null){
				jm.setCode(1);
			}else{
				jm.setCode(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jm.setCode(0);
			jm.setMsg(e.getMessage());
		}
		return jm;
	}
	
	@RequestMapping("/login.action")
	public JsonModel login(VoteUser user, HttpServletRequest request, HttpSession session) {
		JsonModel jm = new JsonModel();
		String zccode = request.getParameter("zccode");
		String rand = session.getAttribute("rand").toString();
		if (!rand.equals(zccode)) {
			jm.setCode(0);
			jm.setMsg("验证码错误");
		} else {
			try {
				user = voteBiz.login(user);
				if (user != null) {
					session.setAttribute("user", user);
					jm.setCode(1);
					user.setPwd(null);
					jm.setObj(user);
				} else {
					jm.setCode(0);
					jm.setMsg("用户名或密码错误");
				}
			} catch (Exception e) {
				e.printStackTrace();
				jm.setCode(0);
				jm.setMsg(e.getMessage());
			}
		}
		return jm;
	}

}
