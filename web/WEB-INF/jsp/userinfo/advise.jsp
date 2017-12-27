<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>advise</title>
<style type="text/css">
textarea{
	resize: none;
	width: 540px;
	height: 120px;
	margin-left:2%;
	margin-top:1%;
}
</style>
</head>
<body style="font-size: 18px;">
	<p style="margin-left: 2%;">尊敬的贵宾,请留下您宝贵的建议,我们将及时改进.祝您生活愉快.</p>
	<div>
		<br>
		<form action="${pageContext.request.contextPath}/base/advises">
		<textarea name="advises" rows="" cols=""></textarea>
		<br>
		<input style="margin-left:506px;font-size:14px;"  type="submit" value="提交建议">
		</form>
	</div>
</body>
</html>