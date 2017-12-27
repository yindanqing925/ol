<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>userMain</title>
 <script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
</head>
<body>
<frameset rows="15%,85%" border="1px" bordercolor="black">
	<frame id="header" scrolling="no" name="header">
	<frame id="mainbody" scrolling="auto" name="body">
</frameset>
<script  type="text/javascript">
$(document).ready(function(){ 
//$("#header").attr('src', "${pageContext.request.contextPath }/user/headshow");
//$("#mainbody").attr('src', "${pageContext.request.contextPath }/user/bodyshow");
	TreeHandler.frameInit();
});
var TreeHandler = {
		frameInit:function(){
			$("#header").attr('src', "${pageContext.request.contextPath }/user/headshow");
			$("#mainbody").attr('src', "${pageContext.request.contextPath }/user/bodyshow");
		}
};
</script>
</body>
</html>