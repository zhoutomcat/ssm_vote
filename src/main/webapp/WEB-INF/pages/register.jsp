<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="logo.jsp"%>

<script type="text/javascript">
	function reg() {
		$.ajax({
			type : "POST",
			data : $("#myform").serialize(),
			/* url : "voteUser_register.action", */
			url : "voteUser_register.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 1) {
					alert("注册成功！");
					location.href = "index.action";
				} else {
					alert("注册失败！原因" + data.msg);
				}
			}
		});
	}

	function checkUsername(uname) {
		if (!uname) {
			alert("用户名不能为空");
			/* $("#submit").attr("disabled", true); */
			return;
		}
		$.ajax({
			type : "POST",
			data : "uname=" + encodeURIComponent(uname),
			url : "voteUser_isUsernameExist.action",
			dataType : "JSON",
			success : function(data) {
				if (data.code == 0) {
				/* 	$("#submit").attr("disabled", false); */
					$("#result").html("用户名可以使用");
				} else {
					/* $("#submit").attr("disabled", true); */
					$("#result").html("用户名已经存在，请更换用户名");
				}
			}
		});
	}
</script>

<div id="register" class="box">
	<h2>新用户注册</h2>
	<div class="content">
		<form method="post" id="myform">
			<dl>
				<dt>用户名：</dt>
				<dd>
					<input type="text" class="input-text" name="uname" value="" onblur="checkUsername(this.value)" />
					<div id="result"></div>
				</dd>
				<dt>密码：</dt>
				<dd>
					<input type="password" class="input-text" name="pwd" value="" />
				</dd>
				<dt>确认密码：</dt>
				<dd>
					<input type="password" class="input-text" name="repwd" value="" />
				</dd>
				<dt></dt>
				<tr>
					<td class="field">验 证 码：</td>
					<td><input type="text" id="zccode" name="zccode" style="font-size: 14px; width: 100px;" />
						&nbsp;&nbsp;&nbsp;&nbsp; <img src="image.jsp" onclick="changeVilidateCode(this)" border="0"
						title="点击图片刷新验证码" size="10" /></td>
				</tr>
				<dd>
					<input type="button" class="input-button" id="submit" onclick="reg()" />
				</dd>
			</dl>
		</form>
		<div class="error"></div>
	</div>
</div>

<%@ include file="bottom.jsp"%>

