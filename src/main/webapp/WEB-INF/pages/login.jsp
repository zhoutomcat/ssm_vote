<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="logo.jsp"%>

<script type="text/javascript">
	window.onload = function() {
		var input = document.getElementById("loginBox").getElementsByTagName(
				"input");
		for (i = 0; i < input.length; i++) {
			var type = input[i].getAttribute("type");
			if (type == "text" || type == "password") {
				input[i].onfocus = function() {
					this.className += " input-text-over";
				}
				input[i].onblur = function() {
					this.className = this.className.replace(/input-text-over/,
							"");
				}
			} else if (type == "submit") {
				input[i].onmouseover = function() {
					this.className += " input-submit-over";
				}
				input[i].onmouseout = function() {
					this.className = this.className.replace(
							/input-button-over/, "");
				}
			}
		}
	}
	$(function() {
		$("#inputbutton").click(function() {
			$.ajax({
				type : "POST",
				data : $("#myform").serialize(),
				url : "voteUser_login.action",
				dataType : "JSON",
				success : function(data) {
					if (data.code == 1) {
						alert("登录成功！");
						location.href = "manage.html";
					} else {
						alert("登录失败！原因" + data.msg);
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<div id="header" class="wrap">
		<img src="images/logo.gif" />
	</div>
	<div id="login" class="wrap">
		<div class="main">
			<div class="corner"></div>
			<div class="introduce">
				<h2>源辰信息</h2>
				<p>网上调查系统...</p>
			</div>
			<div class="login">
				<h2>用户登录</h2>
				<form method="post" id="myform">
					<dl id="loginBox">
						<dt>用户名：</dt>
						<dd>
							<input type="text" class="input-text" name="uname" value="" />
						</dd>
						<dt>密 码：</dt>
						<dd>
							<input type="password" class="input-text" name="pwd" value="" />
						</dd>
						<dt></dt>
						<tr>
							<td class="field">验 证 码：</td>
							<td><input type="text" id="zccode" name="zccode" style="font-size: 14px; width: 100px;" />
								&nbsp;&nbsp;&nbsp;&nbsp; <img src="image.jsp" onclick="changeVilidateCode(this)" border="0"
								title="点击图片刷新验证码" size="10" /></td>
						</tr>
						<dd>
							<input type="button" id="inputbutton" class="input-button" value="登录" />
							<a href="toRegister.action">新用户注册</a>
						</dd>
					</dl>
				</form>
				<div class="error"></div>
			</div>
		</div>
	</div>


	<%@ include file="bottom.jsp"%>