<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉与建议</title>
<style type="text/css">

.userContent {
	float: left;
	margin-left: 20%;
	width: 60%;
	height: 80%;
	float: left;
	padding-top: 3%;
}

.pager {
	width: 100%;
	height:10%;
	/*margin-left: 20%;*/
	/*padding-left: 20%;*/
	margin-top: 3%;
	float: left;
}

input {
	float: left;
	height: 26px;
	width: 15%;
	margin-left: 1%;
}

span {
	float: left;
	margin-left: 1%;
}

td{
	border:1px solid #000000;
}
</style>
<script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	var allPage="${allPage}";
	var nowPage="${nowPage}";
	$(document).ready(function(){
		
	});
	function pager(page){
		var index = 0;
		if(page=="head"){
			index = 1;
		}else if(page=="next"){
			if(nowPage<allPage){
				index = nowPage + 1;
			}else{
				index = nowPage;
			}
		}else if(page=="prev"){
			if(nowPage>1){
				index = nowPage - 1;
			}else{
				index = nowPage;
			}
		}else if(page=="tail"){
			index  = allPage;
		}
		parent.pageSugg(index);
	}
</script>
</head>
<body style="width: 100%; height: 100%;">
	<div class="userContent">
		<table style="width:100%;height:100%;">
			<tr>
				<td>姓名</td>
				<td>手机号</td>
				<td>时间</td>
				<td>投诉与建议</td>
			</tr>
			<c:forEach items="${suggs}" var="sugg">
				<tr>
					<td>${sugg.username}</td>
					<td>${sugg.phonenum}</td>
					<td>${sugg.suggestiontime}</td>
					<td>${sugg.suggestion}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="pager" class="pager">
	<p style="margin-left:38%;">
		<a href="javascript:void(0);" onclick="pager('head')">首页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager('next')">上一页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager('prev')">下一页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager('tail')">末页</a>
	</p>
	</div>
</body>
</html>