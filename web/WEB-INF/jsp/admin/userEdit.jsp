<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>edit</title>
<style type="text/css">
.td1{
	text-align:right;
}
tr{
	padding-top:150%;
	height:35px;
}
tr td{
	text-align:left;
	
}
input{
	width:100%;
	height:100%;
}
select{
	width:40%;
	height:85%;
}
</style>
<script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="../static/js/md5.js"></script>
<script type="text/javascript">
	var type = "${users.usertype}";
	var sex = "${users.sex}";
	var marry = "${users.merrystaus}";
	$(document).ready(function() {
		$("#confirm").click(function(){
			var id = $("#userId").val();
			var cardNo = $("#cardNo").val();
			var userName = $("#userName").val();
			var password1 = $("#password1").val();
			var password2 = $("#password2").val();
			var password = "";
			if(password2!=password1){
				alert("两次输入密码不一致.");
				return false;
			}
			if(password1==""){
				password = "";
			}else{
				password = hex_md5(password1);
			}
			var status = $("#status").val();
			var type = $("#type").val();
			var phone = $("#phone").val();
			var sex = $("#sex").val();
			var marry = $("#marry").val();
			var idNo = $("#idNo").val();
			var birth = $("#birth").val();
			var doctor = $("#doctor").val();
			var adress = $("#adress").val();
			var job = $("#job").val();
			var allcount = $("#allcount").val();
			var alreadycount = $("#alreadycount").val();
			var count = $("#count").val();
			$.post("${pageContext.request.contextPath}/admin/editUser", 
					{
						"id" : id,
						"cardNo" : cardNo,
						"userName" : userName,
						"password" : password,
						"status" : status,
						"type" : type,
						"phone" : phone,
						"sex" : sex,
						"marry" : marry,
						"idNo" : idNo,
						"birth" : birth,
						"doctor" : doctor,
						"adress" : adress,
						"job" : job,
						"allcount" : allcount,
						"alreadycount" : alreadycount,
						"count" : count
					},
					function(data){
						parent.addUserLoad();
					}
			);
		});
		//控制下拉框默认选中
		//控制下拉框默认选中
		if(sex=="男"){
			sex=1;
		}else{
			sex=0;
		}
		if(marry=="已婚"){
			marry=1;
		}else{
			marry=0;
		}
		$("#type").find("option[value='" + type + "']").attr("selected",true);
		$("#sex").find("option[value='" + sex + "']").attr("selected",true);
		$("#marry").find("option[value='" + marry + "']").attr("selected",true);
	});
</script>
</head>
<body>
<table style="margin-left:30%;width:40%;height:80%;">
	<input type="hidden" id="userId" value="${users.id}" />
	<tr>
		<td class="td1">卡号:</td>
		<td><input type="text" id="cardNo" value="${users.vipnum}" readonly="readonly"></td>
		<td><!-- <input type="button" value="读取卡号" style="margin-left:2px;"> --></td>
	</tr>
	<tr>
		<td class="td1">姓名:</td>
		<td><input type="text" id="userName" value="${users.username}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">新密码:</td>
		<td><input type="text" id="password1"></td>
		<td><span>需要修改密码时填写.</span></td>
	</tr>
	<tr>
		<td class="td1">确认密码:</td>
		<td><input type="text" id="password2"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">状态:</td>
		<td><input type="text" id="status" value="${users.status}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">类型:</td>
		<td>
			<select id="type"" >
				<option value="1">A级</option>
				<option value="2">B级</option>
				<option value="3">C级</option>
				<option value="4">D级</option>
			</select>
		</td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">手机号:</td>
		<td><input type="text" id="phone" value="${users.phonenum}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">性别:</td>
		<td><select id="sex">
				<option value="0">女</option>
				<option value="1">男</option>
			</select></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">婚姻状态:</td>
		<td><select id="marry">
				<option value="0">未婚</option>
				<option value="1">已婚</option>
			</select></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">身份证号:</td>
		<td><input type="text" id="idNo" value="${users.idcard}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">生日:</td>
		<td><input type="text" id="birth" value="${users.birthday}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">学历:</td>
		<td><input type="text" id="doctor" value="${users.stduy}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">地址:</td>
		<td><input type="text" id="adress" value="${users.address}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">职业:</td>
		<td><input type="text" id="job" value="${users.duty}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">总额度:</td>
		<td><input type="text" id="allcount" value="${users.allcount}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">激活额度:</td>
		<td><input type="text" id="alreadycount" value="${users.alreadycount}"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">余额:</td>
		<td><input type="text" id="count" value="${users.count}"></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" style="text-align:center;">
			<input id="confirm" type="button" value="确定" style="width:20%">
		</td>
	</tr>
</table>
</body>
</html>