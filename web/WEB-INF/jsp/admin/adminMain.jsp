<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>管理员主页</title>
<style type="text/css">
.top {
	height: 10%;
	width: 100%;
	float: left;
	background-color: #eeeeee;
}

.menu {
	width: 13%;
	/*margin-top:1%;*/
	float: left;
	background-color: #ffffff;
}

.contenter {
	width: 86.7%;
	/*margin-top:1%;*/
	margin-left: 0.3%;
	margin-top: 2px;
	float: left;
	background-color: #dddddd;
}

hr {
	margin: 0;
	border: 0;
	height: 2px;
	width: 100%;
	background-color: #1AA7D2;
}

ul {
	padding: 0;
	margin: 0;
}

ul li {
	list-style: none;
	font-size: 26px;
	width: 100%;
	height: 45px;
	background-color: #168925;
	text-align: center;
	margin-top: 2px;
	vertical-align: middle;
}

iframe {
	border: 0;
	width: 100%;
	height: 100%;
}
</style>
<script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	$(function() {
		//适配两种分别率,1366*768,1440*900
		var hi = $(window).height();
		var height = hi * 0.87;
		if (height < 660) {
			height = hi * 0.845;
			$("li").css("font-size", "24px");
		}
		$("#menu").height(height + "px");
		$("#contenter").height(height + "px");
		
		//菜单点击函数
		$("#menu1").click(function() {
			$("#content").attr("src","${pageContext.request.contextPath}/admin/readyToReadCard");
		});
		$("#menu2").click(function() {
			$("#content").attr("src","${pageContext.request.contextPath}/admin/userManager?page=1");
		});
		$("#menu3").click(function() {
			$("#content").attr("src","${pageContext.request.contextPath}/admin/readyToAddUser");
		});
		$("#menu4").click(function() {
			$("#content").attr("src","${pageContext.request.contextPath}/admin/getAdvise?page=1");
		});
	});
	function userAdmin(name,phone){
		$("#content").attr("src","${pageContext.request.contextPath}/admin/userQuery?userName="+name+"&userPhone="+phone);
	}
	function page(page){
		$("#content").attr("src","${pageContext.request.contextPath}/admin/userManager?page="+page);
	}
	function addUserLoad(){
		$("#content").attr("src","${pageContext.request.contextPath}/admin/userManager?page=1");
	}
	function editUser(id){
		$("#content").attr("src","${pageContext.request.contextPath}/admin/readyToEditUser?id="+id);
	}
	function pageSugg(page){
		$("#content").attr("src","${pageContext.request.contextPath}/admin/getAdvise?page="+page);
	}
</script>
</head>
<body style="height: 100%; width: 100%; margin: 0;">
	<div class="top">
		<h2 style="color: green;">中国石油财务管理系统</h2>
		<span style="float: right; color: grey;">祥远组织</span>
	</div>
	<hr />
	<div id="menu" class="menu">
		<ul>
			<li id="menu1">读取会员卡</li>
			<li id="menu2">会员管理</li>
			<li id="menu3">添加会员</li>
			<li id="menu4">查看投诉与建议</li>
		</ul>
	</div>
	<div id="contenter" class="contenter">
		<iframe id="content"></iframe>
	</div>
</body>
</html>