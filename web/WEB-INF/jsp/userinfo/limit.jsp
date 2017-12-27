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
</head>
<body>
<table>
	<tr>
		<td style="text-align: right;"><font style="margin-right: 20%;">修改密码</font></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr></tr>
	<tr>
		<td></td>
		<td>手机号:</td>
		<td>${phoneNum }</td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>原始密码:</td>
		<td><input type="text"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>新密码:</td>
		<td><input type="text"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>再次确认新密码:</td>
		<td><input type="text"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td>动态密码:</td>
		<td><input type="text"></td>
		<td></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input type="button" value="确定"></td>
		<!-- <td></td> -->
		<td></td>
	</tr>
	
</table>
</body>
</html>