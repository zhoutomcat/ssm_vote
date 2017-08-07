<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.yc.utils.*,java.util.*"%>
<%
	FileUpload fu = new FileUpload();
	Map<String, String> map = fu.uploadSingleFile(pageContext, request);

	//取出回调函数名
	response.setContentType("text/html;charset=UTF-8");
	String callback = request.getParameter("CKEditorFuncNum");
	// 返回"图像"选项卡并显示图片  request.getContextPath()为web项目名   
	//将结果以客户端指定的函数的形式,以javascript
	out.println("<script type=\"text/javascript\">");
	out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + map.get("upload_weburl")
			+ "','')");
	out.println("</script>");
	out.flush();
%>

