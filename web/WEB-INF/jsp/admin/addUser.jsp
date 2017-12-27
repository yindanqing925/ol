<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加会员</title>
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
 <script language="javascript" src="http://127.0.0.1:8008/YOWOCloudRFIDReader.js"></script>
<script language="javascript" src="../static/js/YOWOReaderBase.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#confirm").click(function(){
			var cardNo = $("#CardNo5").val();
			var userName = $("#userName").val();
			var password = $("#password").val();
			var ciphertext = hex_md5(password);
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
			$.post("${pageContext.request.contextPath}/admin/addUser", 
					{
						"cardNo" : cardNo,
						"userName" : userName,
						"password" : ciphertext,
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
	});
	//读卡js
	rfidreader.onResult(function(resultdata)
			{
				var str;
				switch(resultdata.FunctionID)
			    {
			    	
					case 14:
						$("#CloudReaderVer").attr("value",resultdata.strData);
			       // document.getElementById("CloudReaderVer").value = resultdata.strData;
			        break;
					case 20:
					if(resultdata.Result>0)
					{
						str =resultdata.strData;
					}
					else
					{
						str= GetErrStr(resultdata.Result);
					}
					document.getElementById("CardNo").value = str;

					break;
					case 34:

					if(resultdata.Result>0)
					{
						str =resultdata.strData;
						//$("#CardNo5").attr("value",str.substring(20,40));
					    document.getElementById("CardNo2").value = str.substring(0,16);
						document.getElementById("CardNo3").value = str.substring(16,18);
						document.getElementById("CardNo4").value = str.substring(18,20); 
						document.getElementById("CardNo5").value = str.substring(24,40);
						document.getElementById("CardNo6").value = str.substring(40,48);
						document.getElementById("CardNo7").value = str.substring(48,56);
						document.getElementById("CardNo8").value = str.substring(56,58);
						document.getElementById("CardNo9").value = str.substring(58,60);	
					}
					else
					{
 		 				str= GetErrStr(resultdata.Result);
						document.getElementById("CardNo2").value = str;
						document.getElementById("CardNo3").value = "";
						document.getElementById("CardNo4").value = "";
						document.getElementById("CardNo5").value = "";
						document.getElementById("CardNo6").value = "";
						document.getElementById("CardNo7").value = "";
						document.getElementById("CardNo8").value = "";
						document.getElementById("CardNo9").value = "";  
					}
				
					break;		
			    }
			}
			);
 
			function CPUReset()
			{
				rfidreader.Repeat=0;
				rfidreader.HaltAfterSuccess=0;
				rfidreader.SAMReset(3);
				CPUCos();
				
				//getVipInfo(vipnum);
			}

			function CPUCos()
			{
				rfidreader.Repeat=0;
				rfidreader.HaltAfterSuccess=0;
				rfidreader.SinoPecCard_GetInfo();	
			}
            function getVipInfo(){
            	var vipnum = document.getElementById("CardNo5").value;
               	$.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath }/admin/queryVipInfo?vipNum="+vipnum,
                    async:false,
                    dataType:"json",

                    success:function(data){
                        
                        if(data != null || data != ""){
                        	
    						document.getElementById("userName").value = data.username;
    						document.getElementById("idNo").value = data.idcard;
    						document.getElementById("phoneNo").value = data.phonenum;
    						document.getElementById("balance").value = data.count;
    						document.getElementById("limited1").value = data.canusecount;
    						document.getElementById("limited2").value = data.alreadycount;
                        	
                    	}else{
                               alert("该卡不是我们的会员!");
                    	}
                    },
                    error:function(data){
                        alert("连接失败！");
                    }
                });
            }
            function confirmSpendInfo(){
            	var vipnum = document.getElementById("CardNo5").value;
            	var spendcount = document.getElementById("mount").value;
            	var spentype = document.getElementById("spentype").value;
            	var balance = document.getElementById("balance").value;
            	var limited1 = document.getElementById("limited1").value;
            	if(spentype=="1"){
            		if(parseInt(spendcount)>parseInt(balance)+parseInt(limited1)){
            			alert("消费金额大于账户余额和可用额度!");
            			return false;
            		}else{
            		 	$.ajax({
                            type:"get",
                            url:"${pageContext.request.contextPath }/admin/confirmSpendInfo?vipNum="+vipnum+"&count="+spendcount+"&spentype="+spentype,
                            async:false,
                            dataType:"json",

                            success:function(data){
                                
                                if(data!=""&&data!=null){
                                	alert("操作成功!");
            						document.getElementById("CardNo5").value ="";
            						document.getElementById("userName").value = "";
            						document.getElementById("idNo").value = "";
            						document.getElementById("phoneNo").value = "";
            						document.getElementById("balance").value = "";
            						document.getElementById("limited1").value = "";
            						document.getElementById("limited2").value = "";
            						document.getElementById("mount").value = "";
                                	
                            	}else{
                            		 alert("操作失败!");
                            	}
                            },
                            error:function(data){
                                alert("连接失败！");
                            }
                        });
            		}
            	}else{
               	$.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath }/admin/confirmSpendInfo?vipNum="+vipnum+"&count="+spendcount+"&spentype="+spentype,
                    async:false,
                    dataType:"json",

                    success:function(data){
                        
                    	if(data!=""&&data!=null){
                    		alert("操作成功!");
    						document.getElementById("CardNo5").value ="";
    						document.getElementById("userName").value = "";
    						document.getElementById("idNo").value = "";
    						document.getElementById("phoneNo").value = "";
    						document.getElementById("balance").value = "";
    						document.getElementById("limited1").value = "";
    						document.getElementById("limited2").value = "";
    						document.getElementById("mount").value = "";
                        	
                    	}else{
                               alert("操作失败!");
                    	}
                    },
                    error:function(data){
                        alert("连接失败！");
                    }
                });
            	}
            }
            
            function cancel(){
				document.getElementById("CardNo5").value ="";
				document.getElementById("userName").value = "";
				document.getElementById("idNo").value = "";
				document.getElementById("phoneNo").value = "";
				document.getElementById("balance").value = "";
				document.getElementById("limited1").value = "";
				document.getElementById("limited2").value = "";
				document.getElementById("mount").value = "";
            }
</script>
</head>
<body>
  <input name="CloudReaderVer" type="hidden" id="CloudReaderVer" maxlength="10" readonly="readonly" />
   <!-- <input type="submit" name="btnReset" id="btnReset" value="加油卡卡号"  onclick="CPUReset()" /> -->
  <!-- <input type="submit" name="btnCOS" id="btnCOS"  value="加油卡信息"  onclick="CPUCos()" />  -->
  <input name="CardNo2" type="hidden" id="CardNo" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo2" type="hidden" id="CardNo2" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo3" type="hidden" id="CardNo3" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo4" type="hidden" id="CardNo4" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo6" type="hidden" id="CardNo6" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo7" type="hidden" id="CardNo7" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo8" type="hidden" id="CardNo8" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo9" type="hidden" id="CardNo9" size="50" maxlength="50" readonly="readonly" />
  <!-- 
  <input name="CardNo5" type="text" id="CardNo5" size="50" maxlength="50" readonly="readonly" />
   -->
  
<table style="margin-left:30%;width:40%;height:80%;">
	<tr>
		<td class="td1">卡号:</td>
		<td><input type="text" id="CardNo5"></td>
		<td><input type="button" value="读取卡号" onclick="CPUReset()" style="margin-left:2px;"></td>
	</tr>
	<tr>
		<td class="td1">姓名:</td>
		<td><input type="text" id="userName"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">密码:</td>
		<td><input type="text" id="password"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">状态:</td>
		<td><input type="text" id="status"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">类型:</td>
		<td>
			<select id="type">
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
		<td><input type="text" id="phone"></td>
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
		<td><input type="text" id="idNo"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">生日:</td>
		<td><input type="text" id="birth"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">学历:</td>
		<td><input type="text" id="doctor"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">地址:</td>
		<td><input type="text" id="adress"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">职业:</td>
		<td><input type="text" id="job"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">总额度:</td>
		<td><input type="text" id="allcount"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">激活额度:</td>
		<td><input type="text" id="alreadycount"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">余额:</td>
		<td><input type="text" id="count"></td>
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