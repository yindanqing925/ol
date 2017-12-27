<%@ page contentType="text/html;charset=utf-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>中国石油财务管理系统</title>
<style>
*{ margin:0px; padding:0px;}
ul,ol,dl,li{ list-style:none}
a{ text-decoration:none}
img{ border:none;}
.clear{ clear:both}
body{
	color:#444;
	line-height:24px;
	font-size:12px;
	font-family: "宋体";
	position:relative;
	z-index:999; 
}

.china{ width:1000px; height:auto; margin:auto; margin-top:50px}
.container{ padding-top:20px; background:url(static/img/bg.jpg) no-repeat left top; height:600px; margin-top:20px;}
.container-right{ width:460px; float:right; padding-top:20px}
.container-right ul li p{ font-size:14px; padding-bottom:10px; }
.container-right h1{ font-size:36px; color:#05a423; margin-bottom:30px; padding-left:120px;}
.input-1{width:350px; height:30px; font-size:12px; color:#999; padding-left:10px;}
.input-2{ width:200px;height:30px; font-size:12px; color:#999; padding-left:10px}
.input-3{ width:200px; background-color:#f00; padding-top:10px; padding-bottom:10px; border:none; color:#fff; margin:auto; margin-top:20px;}
.input-4{ width:100px; background-color:#75CC52; padding-top:10px; padding-bottom:10px; border:none; }
</style>

</head>
<body>

<div class="china">
 <div class="container">
   <div class="container-right">
   <h1>低碳生活</h1>
   <form id="loginform" action="">
      <ul>
      <li>&nbsp;</li>
      <li>&nbsp;</li>
      <li>&nbsp;</li>
<!--         <li>
        <p>卡号：</p>
        <p><input name="" id="vipNum" type="text" class="input-1" /></p></li> -->
        <li>
        <p>手机号：</p>
        <p><input name="" id="phonenum" type="text" class="input-1" /></p>
        </li>
        <li>
		<p>密码：</p>
        <p><input name="" id="password"  type="password" class="input-1"/></p>
        </li>
<!--         <li>
        <p>验证码：</p>
        <p><input name="" id="yanzhengma"  type="text" class="input-2"/>  <input name="" type="button" id="yzm"  onclick="yanzhengma();" class="input-4" value="获取短信验证码" /></p>
        </li> -->
        <li>
        <input name="" type="button" onclick="login();" class="input-3" value="登录" />  &nbsp;|&nbsp;  <a href="${pageContext.request.contextPath}/user/query">忘记密码？</a></li>
        <li></li>
      </ul>
      </form>
   </div>
 </div>
 </div>
 <script type="text/javascript" src="static/js/jquery-3.2.1.js"></script>
 <script type="text/javascript" src="static/js/md5.js"></script>
<script type="text/javascript">
    var ordertime=60   //设置再次发送验证码等待时间
    var timeleft=ordertime
	var btn=document.getElementById("yzm");
    var phone=document.getElementById("phonenum");
	//var path = ${pageContext.request.contextPath};
	function login(){
		var telephone = document.getElementById("phonenum").value;
		var password = document.getElementById("password").value;
		var telephonenum = hex_md5(telephone);
		var passwd = hex_md5(password);
		document.getElementById("loginform").action="${pageContext.request.contextPath}/base/login?telephone="+telephonenum+"&password="+passwd;
		  document.getElementById("loginform").submit();
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
	
/* function yanzhengma(){
    
     var vipNum = document.getElementById("phonenum").value;
     var phoneNum = document.getElementById("phonenum").value;
    var reg = /^1[0-9]{10}$/;  //电话号码的正则匹配式

	  if (reg.test(phone.value)){
       // btn.removeAttr("disabled")  //当号码符合规则后发送验证码按钮可点击
		$.ajax({
		    type:"post",
		    url:"${pageContext.request.contextPath}/user/sendPhoneCode",
		    data:{vipNum:vipNum,phoneNum:phoneNum},
		    async:false,
		    dataType:"json",
		    success:function(data){
		    	//data==success  发送成功
		    	timeCount();
		    },
		    error:function(data){
		        alert("连接失败");
		    }
		});
          
        }
      else{
       // btn.attr("disabled",true)
	   alert("请输入正确的手机号码!");
      }
} */


    //计时函数
/*     function timeCount(){
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
     } */

  
    //事件处理函数
//    btn.on("click",function(){
//        $(this).attr("disabled",true); //防止多次点击
        //此处可添加 ajax请求 向后台发送 获取验证码请求
 //       timeCount(this);
 //       })
 </script>
</body>
</html>
