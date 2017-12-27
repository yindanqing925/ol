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
}
</style>
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <script type="text/javascript"  src="../static/js/bootstrap.min.js"></script> 
    <script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
</head>
<body>

    <div class="container" style="position: absolute;top: 3%;left: 0%;">




        <div class="col-md-offset-1">
            <table class="table">
                <thead>
                <tr style="border: solid 1px gray">
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">消费类型</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">消费金额</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">余额</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">已激活额度</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">可用额度</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">总额度</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">消费时间</th>
                </tr>
                </thead>
                <tbody id="task_tbody">
                
                </tbody>
            </table>
          <div style="margin-left:72%;font-size:18px;"><a id="lastpages" onclick="nextpage(1);">上一页</a>&nbsp;&nbsp;&nbsp;<a id="nextpages" onclick="nextpage(2);">下一页</a></div>
        </div>
    <input type="hidden" id="nowpage" value="1"/>
    <input type="hidden" id="allpage" value="${pageall}" />
    </div>
    
      <script  type="text/javascript">
        window.onload=function(){
    	  // var nowpage = document.getElementById("nowpage").value;
    	$.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/base/querySpendList?nowpage=0&pagetype=0",
            async:false,
            dataType:"json",

            success:function(data){
                
                if(data == null || data == ""){
                //	document.getElementById("allpage").value = ${pageall};
                	$("#lastpages").hide();
                	$("#nextpages").hide();
            	}else{
            		handle_query(data);
            		$("#lastpages").hide();
            		if(document.getElementById("nowpage").value<document.getElementById("allpage").value){
            		$("#nextpages").show();
            		}else{
            		$("#nextpages").hide();
            			
            		}
            	//	document.getElementById("allpage").value = 0;
            	}
            },
            error:function(data){
                alert("连接失败！");
            }
        });
//parseInt("1234blue")
    }
        function nextpage(pagetype){
        	var nowpage = document.getElementById("nowpage").value;
        	$.ajax({
                type:"get",
                url:"${pageContext.request.contextPath }/base/querySpendList?nowpage="+nowpage+"&pagetype="+pagetype,
                async:false,
                dataType:"json",

                success:function(data){
                    
                    if(data == null || data == ""){
                	}else{
                		handle_query(data);
                		//document.getElementById("allpage").value = data.length;
                		if(pagetype==1){
                    		document.getElementById("nowpage").value = parseInt(nowpage)-1;
                    			$("#lastpages").show();
                    			$("#nextpages").show();
                    		if((parseInt(nowpage)-2)==0 ){
                    			$("#lastpages").hide();
                    			$("#nextpages").show();
                    		}else{
                    			$("#lastpages").show();
                    			$("#nextpages").show();
                    			
                    		}
                		}else{
                		document.getElementById("nowpage").value = parseInt(nowpage)+1;
                		if((parseInt(nowpage)+1)==document.getElementById("allpage").value ){
                			$("#nextpages").hide();
                			$("#lastpages").show();
                		}else{
                    			$("#lastpages").show();
                    			$("#nextpages").show();
                			
                		}
                		}
                	}
                },
                error:function(data){
                    alert("连接失败！");
                }
            });
        }

        function handle_query(list){
        	document.getElementById("task_tbody").innerHTML = "";

            /* $.each(ret,function(index,v){ */
                //var ret = list.length;
                $.each(list,function(index,v){
                	var li=[];
                	//var xuhao = index + (parseInt(id) - 1) * 10 + 1;
                	if(list[index].spendtype=="0"){
                    li.push("<tr id='"+list[index].id+"'><td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+"充值"+"</td>");
                		
                	}else{
                		
                    li.push("<tr id='"+list[index].id+"'><td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+"消费"+"</td>");
                	}
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].spendamount+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].count+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].alreadycount+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].canusecount+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].allcount+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;text-align:center;'>"+list[index].spendtime+"</td></tr>");
                    document.getElementById("task_tbody").innerHTML += li.join("");
                });
                
                //document.getElementById("zongshu").innerHTML = list.count;
           /*  }); */
        }
        </script>
</body>
</html>