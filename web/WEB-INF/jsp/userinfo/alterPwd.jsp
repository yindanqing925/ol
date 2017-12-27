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
	width:180px;
}
</style>
  <script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
 <script type="text/javascript" src="../static/js/md5.js"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/base/updatepassword">
<table>

	<tr>
		<td>原始密码:</td>
		<td><input type="password" id="oldpassword"/></td>
		<td><input name="oldpasswords" type="hidden" id="oldpasswords"/></td>
		<td></td>
	</tr>
	<tr>
		<td>新密码:</td>
		<td><input type="password" id="newpassword"/></td>
		<td><input name="newpasswords" type="hidden" id="newpasswords"/></td>
		<td></td>
	</tr>
	<tr>
		<td>再次确认新密码:</td>
		<td><input type="password" id="renewpassword"/></td>
		<td><input name="renewpasswords" type="hidden" id="renewpasswords"/></td>
		<td></td>
	</tr>
	<tr>
		<td>手机号:</td>
		<td><input name="phonenum"  id="phonenum" type="text"></td>
		<td></td>
	</tr>
	<tr>
		<td>动态密码:</td>
		<td><input name="phonecode" id="phonecode" type="text"></td>
		<td><input type="button" id="yzm" onclick="yanzhengma();" value="获取验证码" /></td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2"><input  type="submit" onclick="alterpwd();" value="确定"></td>
		<!-- <td></td> -->
		<td></td>
	</tr>
	
</table>
</form>
<script type="text/javascript">
    var ordertime=60   //设置再次发送验证码等待时间
    var timeleft=ordertime
    var btn=document.getElementById("yzm");
	var reg = /^1[0-9]{10}$/;  //电话号码的正则匹配式
//	var btn=document.getElementById("yzm");
//    var phone=document.getElementById("phonenum");
	//var path = ${pageContext.request.contextPath};
/* 	$(document).ready(function(){ 
		$("#formsubmit").click(function(){
			var oldpassword = document.getElementById("oldpassword").value;
			if(oldpassword!=""){
				var oldpasswd = hex_md5(oldpassword);
				document.getElementById("oldpasswords").value = oldpasswd;
			}else{
				alert("原始密码不能为空!");
				return false;
			}
			
			var newpassword = document.getElementById("newpassword").value;
			
			
			if(newpassword!=""){
				var newpasswd = hex_md5(newpassword);
				document.getElementById("newpasswords").value = newpasswd;
			}else{
				alert("新密码不能为空!");
				return false;
			}
			
			
			var renewpassword = document.getElementById("renewpassword").value;
			
			if(renewpassword!=""){
				var renewpasswd = hex_md5(renewpassword);
				document.getElementById("renewpasswords").value = renewpasswd;
				if(renewpassword!=newpassword){
					alert("两次输入的密码不一致!");
					return false;
				}
			}else{
				alert("重复新密码不能为空!");
				return false;
			}
			
			
			var phonenum = document.getElementById("phonenum").value;
			
			if(phonenum!=""){
				
				if (reg.test(phonenum)){
					
				}else{
					alert("请输入正确的手机号!");
				}
				
			}else{
				alert("手机号码不能为空!");
				return false;
			}
			
			var phonecode = document.getElementById("phonecode").value;
			
			if(phonecode!=""){
			}else{
				alert("验证码不能为空!");
				return false;
			}
			
			alterpwd();
	        }); 
			
			
}); */
		
		function alterpwd(){
			
 			
			
			var oldpassword = document.getElementById("oldpassword").value;
			if(oldpassword!=""){
				var oldpasswd = hex_md5(oldpassword);
				document.getElementById("oldpasswords").value = oldpasswd;
			}else{
				alert("原始密码不能为空!");
				return false;
			}
			
			var newpassword = document.getElementById("newpassword").value;
			
			
			if(newpassword!=""){
				var newpasswd = hex_md5(newpassword);
				document.getElementById("newpasswords").value = newpasswd;
			}else{
				alert("新密码不能为空!");
				return false;
			}
			
			
			var renewpassword = document.getElementById("renewpassword").value;
			
			if(renewpassword!=""){
				var renewpasswd = hex_md5(renewpassword);
				document.getElementById("renewpasswords").value = renewpasswd;
				if(renewpassword!=newpassword){
					alert("两次输入的密码不一致!");
					return false;
				}
			}else{
				alert("重复新密码不能为空!");
				return false;
			}
			
			
			var phonenum = document.getElementById("phonenum").value;
			
			if(phonenum!=""){
				
				if (reg.test(phonenum)){
					
				}else{
					alert("请输入正确的手机号!");
				}
				
			}else{
				alert("手机号码不能为空!");
				return false;
			}
			
			var phonecode = document.getElementById("phonecode").value;
			
			if(phonecode!=""){
			}else{
				alert("验证码不能为空!");
				return false;
			}
			 
			
		//	 setTimeout(function(){	
	/* 		$.ajax({
	            type:"POST",
	            url:"${pageContext.request.contextPath}/base/updatepassword",
	           // async:false,
	            dataType:"json",
	            data:{phonenum:phonenum,oldpasswords:oldpasswords,newpassword:newpassword,phonecode:phonecode},
	            success:function(data){
	                
	                 if(data== "1"){
	                	 windows.location.href="${pageContext.request.contextPath}/base/index";
	            	}else{
	            		alert("登录失败");
	            	} 
	            } ,
	            error:function(data){
	                alert("连接失败！");
	            } 
	        });  */
			//  },0)
		}

/*     	$.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/base/login",
            async:false,
            dataType:"json",
            data:{telephone:telephonenum,password:passwd},
            success:function(data){
                
                 if(data== "1"){
                	 windows.location.href="${pageContext.request.contextPath}/base/index";
            	}else{
            		alert("登录失败");
            	} 
            } ,
            error:function(data){
                alert("连接失败！");
            } 
        }); */
		
/* 		  $.post("${pageContext.request.contextPath}/base/login",{telephone:telephonenum,password:passwd},
				  function(data){
				    //$('#msg').html("please enter the email!");
				    //alert(data);
				    //$('#msg').html(data);
				  },
				  "html"); *///这里返回的类型有：json,html,xml,text
	/* 	alert(telephonenum);
		alert(passwd); */
	
 function yanzhengma(){
    
    //  var vipNum = document.getElementById("phonenum").value;
     var phoneNum = document.getElementById("phonenum").value;
    var reg = /^1[0-9]{10}$/;  //电话号码的正则匹配式

	  if (reg.test(phoneNum)){
       // btn.removeAttr("disabled")  //当号码符合规则后发送验证码按钮可点击
		$.ajax({
		    type:"post",
		    url:"${pageContext.request.contextPath}/base/sendPhoneCode",
		    data:{phoneNum:phoneNum},
		    async:false,
		    dataType:"json",
		    success:function(data){
		    	//data==success  发送成功
		    	if(data=="1"){
		    	alert("验证码已发送!");
		    	timeCount();
		    	}else{
		    		alert("发送失败!");
		    	}
		    },
		    error:function(data){
		        alert("发送失败!");
		    }
		});
          
        }
      else{
       // btn.attr("disabled",true)
	   alert("请输入正确的手机号码!");
      }
} 


    //计时函数
    function timeCount(){
       timeleft-=1
       if (timeleft>0){
		btn.disabled=true; 
       btn.value=timeleft+" 秒后重发";
       setTimeout(timeCount,1000)
       }
       else {
	    btn.disabled=false;
        btn.value="重新发送";
        timeleft=ordertime   //重置等待时间
       // btn.removeAttr("disabled");
       }
     } 

  
    //事件处理函数
//    btn.on("click",function(){
//        $(this).attr("disabled",true); //防止多次点击
        //此处可添加 ajax请求 向后台发送 获取验证码请求
 //       timeCount(this);
 //       })
 </script>
</body>
</html>