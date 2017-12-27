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
		<td  style="text-align: left;width: 200px;">会员卡号:</td>
		<td style="text-align: left;">${user.vipnum}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 200px;">余额:</td>
		<td style="text-align: left;">${user.count}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 200px;">总额度:</td>
		<td style="text-align: left;">${user.allcount}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 200px;">已激活额度:</td>
		<td style="text-align: left;">${user.alreadycount}</td>
	</tr>
	<tr>
		<td  style="text-align: left;width: 200px;">已激活剩余可用额度:</td>
		<td style="text-align: left;">${user.canusecount}</td>
	</tr>
</table>
</body>
</html>