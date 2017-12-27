<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>header</title>
<style type="text/css">
.blank{
	float:left;
	width:15%;
	height:100%;
	visibility:visible;
}
.info{
	float:left;
	width:85%;
	height:100%;
	/*margin-left:15%;*/
}
.info .name{
	float:left;
	width:30%;
	height:100%;
}
.info .name{
	float:left;
	width:30%;
	height:100%;
}
.info .number{
	float:left;
	width:30%;
	height:100%;
}
.info .limit{
	float:left;
	width:40%;
	height:100%;
}
</style>
</head>
<body>
<div class="blank">&nbsp;

</div>
<div class="info">
	<div class="name">姓名:${userName }</div>
	<div class="number">卡号:${number }</div>
	<div class="limit">总额度:${allLimit }<br>已用额度:${limited }</div>
</div>
</body>
</html>