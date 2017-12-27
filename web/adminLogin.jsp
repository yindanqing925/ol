<%@ page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>中国石油财务管理系统-管理员登陆页面</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

ul, ol, dl, li {
	list-style: none
}

a {
	text-decoration: none
}

img {
	border: none;
}

.clear {
	clear: both
}

body {
	color: #444;
	line-height: 24px;
	font-size: 12px;
	font-family: "宋体";
	position: relative;
	z-index: 999;
}

.china {
	width: 1000px;
	height: auto;
	margin: auto;
	margin-top: 50px
}

.container {
	padding-top: 20px;
	background: url(static/img/bg.jpg) no-repeat left top;
	height: 600px;
	margin-top: 20px;
}

.container-right {
	width: 460px;
	float: right;
	padding-top: 20px
}

.container-right ul li p {
	font-size: 14px;
	padding-bottom: 10px;
}

.container-right h1 {
	font-size: 36px;
	color: #05a423;
	margin-bottom: 30px;
	padding-left: 120px;
}

.container-right h2 {
	font-size: 20px;
	color: red;
	margin-bottom: 30px;
	padding-left: 200px;
}

.input-1 {
	width: 350px;
	height: 30px;
	font-size: 12px;
	color: #999;
	padding-left: 10px;
}

.input-3 {
	width: 200px;
	background-color: #f00;
	padding-top: 10px;
	padding-bottom: 10px;
	border: none;
	color: #fff;
	margin: auto;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="china">
	<div style="
    font-size: 56px;
    margin-left: 200px;
    color: red;
">中国石油财务管理系统</div>
		<div class="container">
			<div class="container-right">
				<form action="${pageContext.request.contextPath}/admin/auth" method="post">
					<h1>低碳生活</h1>
					<ul>
						<li>&nbsp;</li>
						<li>&nbsp;</li>
						<li>&nbsp;</li>
						<li>
							<p>授权码：</p>
							<p>
								<input name="authNo" id="authNo" type="text" class="input-1" />
							</p>
						</li>
						<li><input id="ciphertext" name="ciphertext" type="hidden"></input></li>
						<li><input id="confirm" name="confirm" type="button" class="input-3" value="登录" /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
	<script type="text/javascript" src="static/js/md5.js"></script>
	<script type="text/javascript">
		$("#confirm").click(function() {
			var authNo = $("#authNo").val();
			$("#ciphertext").val(hex_md5(authNo));
			$("#authNo").val("*********");
			$("form:first").submit();
			//$.post("${pageContext.request.contextPath}/admin/auth", {
			//	"authNo" : ciphertext
			//}
			//,
			//function(data){
			//	if(data=='success'){
			//		//location.href="${pageContext.request.contextPath}/admin/auth";
			//	}
			//}
			//);
		});
	</script>
</body>
</html>
