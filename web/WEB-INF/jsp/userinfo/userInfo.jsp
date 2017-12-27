<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>alterPwd</title>
<style type="text/css">
table{
	width:50%;
	height:100%;
	font-size:18px;
	margin-left: 25%;
	cellpadding:20px;
}
table tr{
	padding-top:60%;
}
table tr td{
	text-align:left;
	padding-top:25px;
}
</style>
<script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
var level = ${user.usertype}
	$(function() {
		if(level=="1"){
		document.getElementById("level").value ="A";
		}else if(level=="2"){
		document.getElementById("level").value ="B";
		}else if(level=="3"){
		document.getElementById("level").value ="C";
		}else if(level=="4"){
		document.getElementById("level").value ="D";
		}else{
			
		}
	});
	 </script>
</head>
<body>
<table>
	<tr>
		<td  style="text-align: left;width: 100px;">姓名:</td>
		<td style="text-align: left;">${user.username}</td>
		<td style="text-align: left;width: 100px;">性别:</td>
		<td style="text-align: left;">${user.sex}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 100px;">身份证号:</td>
		<td style="text-align: left;">${user.idcard}</td>
		<td style="text-align: left;width: 100px;">生日:</td>
		<td style="text-align: left;">${user.birthday}</td>
	</tr>
	<tr>
		<td style="text-align: left;width: 100px;">婚姻状态:</td>
		<td style="text-align: left;">${user.merrystaus}</td>
		<td style="text-align: left;width: 100px;">手机号:</td>
		<td style="text-align: left;">${user.phonenum}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 100px;">学历:</td>
		<td style="text-align: left;">${user.stduy}</td>
		<td style="text-align: left;width: 100px;">职业:</td>
		<td style="text-align: left;">${user.duty}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 100px;">住址:</td>
		<td style="text-align: left;" colspan="3">${user.address}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 100px;">会员卡号:</td>
		<td style="text-align: left;" colspan="3">${user.vipnum}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 100px;">会员等级:</td>
		<td style="text-align: left;" colspan="3"><input style= "background-color:transparent;border:0px;font-size:18px;" type="text" id="level"/></td>
	</tr>
</table>
</body>
</html>