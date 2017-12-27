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
<script type="text/javascript">
	function load(adress){
		parent.reloadMain(adress);
	}
</script>
</head>
<body style="font-size: 18px;">
	<div>
         <p>修改成功,点此<a href="javascript:void(0);" onclick="load('${adress}')">重新登录</a></p>
	</div>
</body>
</html>