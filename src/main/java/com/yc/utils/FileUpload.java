package com.yc.utils;

import java.io.File;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * 文件上传帮助类
 * 组件：jspsmartupload
 * 功能：可以进行多文件上传，可以配置多文件     
 * 
 * 
 * @author Administrator
 * 
 *
 */
public class FileUpload {

	private long singleSize = 10 * 1024 * 1024;
	private String allowedFilesList = "gif,jpg,jpeg,png";
	private String deniedFilesList = "jsp,asp,php,aspx,html,exe,bat,sh";
	private long totalFilesSize = 5 * singleSize;
	
	private String saveDir="pic";
	
	public String getSaveDir() {
		return saveDir;
	}

	public void setSaveDir(String saveDir) {
		this.saveDir = saveDir;
	}
	
   //PageContext pageContext 整个页面 
	public Map<String, String> uploadSingleFile(PageContext pageContext, HttpServletRequest request) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		SmartUpload su = new SmartUpload();
		su.initialize(pageContext);
		su.setCharset("utf-8");
		su.setAllowedFilesList(allowedFilesList);
		// 不准
		su.setDeniedFilesList(deniedFilesList);
		su.setMaxFileSize(singleSize);
		// 所有文件的总容量限制
		su.setTotalMaxFileSize(totalFilesSize);
		su.upload();
		// 取参数
		// TODO: 抽象
		Request re = su.getRequest();  // 获取客户端的请求  
		
		// 相当于遍历
		Enumeration<String> enu = re.getParameterNames();
		while (enu.hasMoreElements()) {
			String pn = enu.nextElement();
			map.put(pn, re.getParameter(pn));
		}

		// 取出上传文件列表 几个file 几次count 所以需要判断以防出现空值包;
		Files files = su.getFiles();
		int count = files.getCount();
		if (files != null && count > 0) {
			for (int i = 0; i < count; i++) {
				// TODO: 多图片
				// 只取列表中的第一个文件 , 写全路径，防止系统以为是 java.io.File类
				com.jspsmart.upload.File file = files.getFile(i);
				// 取tomcat路径
				Calendar c = Calendar.getInstance();
				String tomcatdir = request.getRealPath("/"); // xxx/xxx/webapps/yc3637web1
				File tomcatFile = new File(tomcatdir);
				File webapppath = tomcatFile.getParentFile(); // xxx/xxx/webapps

				// xxx/xxx/webapps/pic/2017/7
				File picpath = new File(webapppath, saveDir + File.separator
						+ c.get(Calendar.YEAR) + File.separator
						+ (c.get(Calendar.MONTH) + 1) + File.separator);
				// 访问路径名
				String weburl = "../"+saveDir+"/" + c.get(Calendar.YEAR) + "/"
						+ (c.get(Calendar.MONTH) + 1) + "/";
				// 判断目录是否存在，不在则创建
				if (picpath.exists() == false) {
					picpath.mkdirs();
				}
				String filePrefixName = genNewFilePrefixName();
				// 取出原文件的后缀名
				String extName = file.getFileExt();
				// 拼接新的文件名
				String fileName = filePrefixName + "." + extName;

				weburl += fileName;
				// 物理路径: xxx/xxx/webapps/pic/2017/7/20170720222222.png
				String destFilePathName = picpath + "/" + fileName;
				// 存
				file.saveAs(destFilePathName, SmartUpload.SAVE_PHYSICAL);

				String fieldName = file.getFieldName();
				String oldfileName = file.getFileName();
				map.put(fieldName + "_weburl", weburl);
				map.put(fieldName + "_destFilePathName", destFilePathName);
				map.put(fieldName + "_fileName", oldfileName);
			}
		}

		return map;
	}
		// weburl D:\11111\apache-tomcat-8.0-2.30\webapps\pic\2017\7

	public long getSingleSize() {
		return singleSize;
	}

	public void setSingleSize(long singleSize) {
		this.singleSize = singleSize;
	}

	public String getAllowedFilesList() {
		return allowedFilesList;
	}

	public void setAllowedFilesList(String allowedFilesList) {
		this.allowedFilesList = allowedFilesList;
	}

	public String getDeniedFilesList() {
		return deniedFilesList;
	}

	public void setDeniedFilesList(String deniedFilesList) {
		this.deniedFilesList = deniedFilesList;
	}

	public long getTotalFilesSize() {
		return totalFilesSize;
	}

	public void setTotalFilesSize(long totalFilesSize) {
		this.totalFilesSize = totalFilesSize;
	}

	private String genNewFilePrefixName() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHmmssSS");
		String filePrefixName = sdf.format(d);
		return filePrefixName;

	}

}
