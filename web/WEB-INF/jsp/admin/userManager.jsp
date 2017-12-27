<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>
<style type="text/css">
.query {
	width: 73%;
	padding-left: 25%;
	padding-top: 2%;
	height: 10%;
	float: left;
	font-size: 20px;
}

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
		$("#query").click(function(){
			var name = $("#userName").val();
			var phone = $("#userPhone").val();
			parent.userAdmin(name,phone);
		});
	});
	function editUser(id){
		parent.editUser(id);
	}
	function deleteUser(id){
		$.post(
				"${pageContext.request.contextPath}/admin/deleteUser",
				{
					"id":id
				},
				function(data){
					parent.addUserLoad();
				}
		);
	}
	function pager(page){
		var index = 0;
		if(page=="head"){
			index = 1;
		}else if(page=="next"){
			if(nowPage<allPage){
				index  = nowPage + 1;
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
		parent.page(index);
	}
</script>
</head>
<body style="width: 100%; height: 100%;">
	<div id="userQuery" class="query">
		<span>姓名:</span><input id="userName" type="text"  value="${userName}">
		<span>手机号:</span><input id="userPhone" type="text" value="${userPhone}"> 
		<input type="button" id="query" value="查询" style="width: 10%; height: 32px;">
	</div>
	<div class="userContent">
		<table style="width:100%;height:100%;">
			<tr>
				<td>姓名</td>
				<td>身份证号</td>
				<td>手机号</td>
				<td>余额</td>
				<td>剩余可用额度</td>
				<td>已激活额度</td>
				<td>总额度</td>
				<td>会员等级</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.username }</td>
					<td>${user.idcard }</td>
					<td>${user.phonenum }</td>
					<td>${user.count}</td>
					<td>${user.canusecount}</td>
					<td>${user.alreadycount}</td>
					<td>${user.allcount}</td>
					<td>${user.usertype}</td>
					<td><a onclick="editUser(${user.id})">编辑</a></td>
					<td><a onclick="deleteUser(${user.id})">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="pager" class="pager">
	<p style="margin-left:38%;">
		<a href="javascript:void(0);" onclick="pager(head)">首页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager(next)">上一页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager(prev)">下一页</a>&nbsp;&nbsp;
		<a href="javascript:void(0);" onclick="pager(tail)">末页</a>
	</p>
	</div>
</body>
</html>