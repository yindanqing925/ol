<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>读取会员卡</title>
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
 <script language="javascript" src="http://127.0.0.1:8008/YOWOCloudRFIDReader.js"></script>
<script language="javascript" src="../static/js/YOWOReaderBase.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
	function preview(oper,buffer)       
	{
	if (oper < 10)
	{
	bdhtml=window.document.body.innerHTML;//获取当前页的html代码
	sprnstr='<!--startprint'+oper+'-->';//设置打印开始区域
	eprnstr='<!--endprint'+oper+'-->';//设置打印结束区域
	prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html

	prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
	window.document.body.innerHTML=buffer;
	window.print();
	window.document.body.innerHTML=bdhtml;
	} else {
	window.print();
	}
	}
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
            						document.getElementById("mount").value = "";
/*             						var buffer = new StringBuffer();
            						buffer.append("<!--startprint1-->").append("<p>欢迎您再次光临!</p>").append("<p>欢迎您再次光临!</p>").append("<p>中油公司(接待专用)</p>").append("<p>-------------------</p>")
            						.append("<p>会员姓名:"+data.username+"</p>").append("<p>时间:"+data.usertime+"</p>").append("<p>金额:"+"-"+spendcount+"</p>").append("<p>余额:"+data.count+"</p>").append("<p>剩余可用额度:"+data.canusecount+"</p>").append("<p>未激活额度:"+data.nousecount+"</p>")
            						.append("<p>总额度:"+data.allcount+"</p>");
            						var result = buffer.toString(); */
            						var buffer = "";
            						buffer+="<!--startprint1-->";
            						buffer+="<p>中国石油天然气股份</p>";
            						buffer+="<p>有限公司(财务专用)</p>";
            						buffer+="<p>-------------------</p>";
            						buffer+="<p>会员姓名:"+data.username+"</p>";
            						buffer+="<p>日期:"+data.usertime.substring(0,10)+"</p>";
            						buffer+="<p>时间:"+data.usertime.substring(11)+"</p>";
            						buffer+="<p>金额:"+"-"+spendcount+"</p>";
            						buffer+="<p>余额:"+data.count+"</p>";
            						buffer+="<p>剩余可用额度:"+data.canusecount+"</p>";
            						buffer+="<p>未激活额度:"+data.nousecount+"</p>";
            						buffer+="<p>总额度:"+data.allcount+"</p>";
            						buffer+="<p>操作员:07943</p>";
            						buffer+="<p>-------------------</p>";
            						buffer+="<p>欢迎您再次光临!</p>";
            						buffer+="<p>-------------------</p>";
            						buffer+="<p>-------------------</p>";
            						document.getElementById("dayin").innerHTML=buffer;
            						preview(1,buffer);
/*             						 <p>欢迎您再次光临!</p>
            						 <p>中油公司(接待专用)</p>
            						 <p>-------------------</p>
            						 <p>会员姓名:<input name="vname" type="hidden" id="vname" size="50" maxlength="50" readonly="readonly" value="admin"></p>
            						 <p>时间:<input name="shijian" type="hidden" id="shijian" size="50" maxlength="50" readonly="readonly" value="1 22:56:56"></p>
            						 <p>金额:<input name="je" type="hidden" id="je" size="50" maxlength="50" readonly="readonly" value="+12"></p>
            						 <p>余额:<input name="ye" type="hidden" id="ye" size="50" maxlength="50" readonly="readonly" value="402"></p>
            						 <p>剩余可用额度:<input name="se" type="hidden" id="se" size="50" maxlength="50" readonly="readonly" value="500"></p>
            						 <p>未激活额度:<input name="we" type="hidden" id="we" size="50" maxlength="50" readonly="readonly" value="500"></p>
            						 <p>总额度:<input name="ze" type="hidden" id="ze" size="50" maxlength="50" readonly="readonly" value="1000"></p>
            						 <p>-------------------</p>
            						 <p>-------------------</p>
            						 <p>-------------------</p> */
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
    						var buffer = "";
    						buffer+="<!--startprint1-->";
    						buffer+="<p>中国石油天然气股份</p>";
    						buffer+="<p>有限公司(财务专用)</p>";
    						buffer+="<p>-------------------</p>";
    						buffer+="<p>会员姓名:"+data.username+"</p>";
    						buffer+="<p>日期:"+data.usertime.substring(0,10)+"</p>";
    						buffer+="<p>时间:"+data.usertime.substring(11)+"</p>";
    						buffer+="<p>金额:"+"+"+spendcount+"</p>";
    						buffer+="<p>余额:"+data.count+"</p>";
    						buffer+="<p>剩余可用额度:"+data.canusecount+"</p>";
    						buffer+="<p>未激活额度:"+data.nousecount+"</p>";
    						buffer+="<p>总额度:"+data.allcount+"</p>";
    						buffer+="<p>操作员:07943</p>";
    						buffer+="<p>-------------------</p>";
    						buffer+="<p>欢迎您再次光临!</p>";
    						buffer+="<p>-------------------</p>";
    						buffer+="<p>-------------------</p>";
    						document.getElementById("dayin").innerHTML=buffer;
    						preview(1,buffer);
/*     						document.getElementById("vname").value = data.username;
    						document.getElementById("shijian").value = data.usertime;
    						document.getElementById("je").value = "+"+spendcount;
    						document.getElementById("ye").value = data.count;
    						document.getElementById("se").value = data.canusecount;
    						document.getElementById("we").value = data.nousecount;
    						document.getElementById("ze").value = data.allcount;
    						preview(1); */
                        	
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
<div id="dayin" style="display:none;">
</div>

<table style="margin-left:30%;width:40%;height:80%;">
	<tr>
		<td class="td1">卡号:</td>
		<td><!-- <input type="text" readonly="readonly" id="cardNo5"> -->
		<input name="CardNo" type="hidden" id="CardNo" size="50" maxlength="50" readonly="readonly" />
		
		
  <input name="CloudReaderVer" type="hidden" id="CloudReaderVer" maxlength="10" readonly="readonly" />
   <!-- <input type="submit" name="btnReset" id="btnReset" value="加油卡卡号"  onclick="CPUReset()" /> -->
  <!-- <input type="submit" name="btnCOS" id="btnCOS"  value="加油卡信息"  onclick="CPUCos()" />  -->
  <input name="CardNo2" type="hidden" id="CardNo2" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo3" type="hidden" id="CardNo3" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo4" type="hidden" id="CardNo4" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo6" type="hidden" id="CardNo6" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo7" type="hidden" id="CardNo7" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo8" type="hidden" id="CardNo8" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo9" type="hidden" id="CardNo9" size="50" maxlength="50" readonly="readonly" />
  <input name="CardNo5" type="text" id="CardNo5" size="50" maxlength="50" readonly="readonly" />
		</td>
		<td><input type="button" value="读取卡号"  onclick="CPUReset()" style="margin-left:2px;"></td>
	</tr>
	<tr>
		<td class="td1">会员姓名:</td>
		<td><input type="text" id="userName" readonly="readonly"></td>
		<td><input type="button" value="读取会员信息"  onclick="getVipInfo()" style="margin-left:2px;"></td>
	</tr>
	<tr>
		<td class="td1">身份证号:</td>
		<td><input type="text" id="idNo" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">手机号:</td>
		<td><input type="text" id="phoneNo" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">余额:</td>
		<td><input type="text" id="balance" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">已激活可用额度:</td>
		<td><input type="text" id="limited1" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">已激活额度:</td>
		<td><input type="text" id="limited2" readonly="readonly"></td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">本次消费类型:</td>
		<td>
			<select id="spentype">
				<option value="0">充值</option>
				<option value="1">消费</option>
			</select>
		</td>
		<td></td>
	</tr>
	<tr>
		<td class="td1">金额:</td>
		<td><input type="text" id="mount"></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" style="text-align:center;">
			<input id="comfirm" type="button" onclick="confirmSpendInfo();" value="确定" style="width:20%">&nbsp;&nbsp;
			<input id="cancel" type="button" value="取消" onclick="cancel();" style="width:20%">
		</td>
	</tr>
</table>
</body>
</html>