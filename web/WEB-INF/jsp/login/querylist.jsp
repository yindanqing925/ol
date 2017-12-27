<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>属性查询</title>
	
    

    <style type="text/css">
    	td{
    		text-align: center;
    		vertical-align: middle;
    	}
    	th{
    		text-align: center;
    		vertical-align: middle;
    	}
    	.viewAttr{
    		cursor: pointer;
    	}
    	.viewChange{
    		cursor: pointer;
    		margin-right: 10px;
    		margin-left: 0px;
    	}
    	.viewDelete{
    		cursor: pointer;
    		color: red;
    		margin-left: 10px;
    		margin-right: 0px;
    	}
    	.li{
    		list-style-type: none;
    		display: inline;
    	}
    </style>
       
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    
    <script type="text/javascript"  src="../static/js/bootstrap.min.js"></script> 
        	 <script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
</head>
<body>

    <div class="container" style="position: absolute;top: 15%;left: 5%">




        <div class="col-md-offset-1">
            <table class="table">
                <thead>
                <tr style="border: solid 1px gray">
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">序号</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">username</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">idcard</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">sex</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">phone</th>
                    <th style="border: solid 1px gray;text-align: center;vertical-align: middle;">birthday</th>
                </tr>
                </thead>
                <tbody id="task_tbody">
                
                </tbody>
            </table>
          
        </div>

    </div>
    
    


    
    
    <script  type="text/javascript">
    
    window.onload=function(){
    	
    	$.ajax({
            type:"get",
            url:"${pageContext.request.contextPath }/user/list.action?yema=1",
            async:false,
            dataType:"json",

            success:function(data){
                
                if(data == null || data == ""){
            	}else{
            		handle_query(data,yema);
            	}
            },
            error:function(data){
                alert("连接失败！");
            }
        });

    }

 

        function handle_query(list,id){
        	document.getElementById("task_tbody").innerHTML = "";

            /* $.each(ret,function(index,v){ */
                var ret = list.list;
                $.each(ret,function(index,v){
                	var li=[];
                	var xuhao = index + (parseInt(id) - 1) * 10 + 1;
                    li.push("<tr id='"+ret[index].id+"'><td style='border: solid 1px gray;vertical-align: middle;'>"+xuhao+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].username+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].idcard+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].sex+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].phone+"</td>");
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].birthday+"</td></tr>");
                    document.getElementById("task_tbody").innerHTML += li.join("");
                });
                
                //document.getElementById("zongshu").innerHTML = list.count;
           /*  }); */
        }
        

        function handle_confirm(ret){
            var a = "";
            var xuhao = document.getElementById("xuhaohide").value;
            $.each(ret,function(index,v){
                var li=[];
                a = ret[index].id;
                li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+xuhao+"</td>");
                li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].attrname+"</td>");
                if(ret[index].attrtype.toString()=="0"){
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>已知</td>");
                }else if(ret[index].attrtype.toString()=="1"){
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>待标注</td>");
                }else{
                	li.push("<td style='border: solid 1px gray;vertical-align: middle;'>两者都有</td>");
                }
                if(ret[index].oprtype.toString() == "0"){
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>单选</td>");
                }else{
                	if(ret[index].oprtype.toString() == "1"){
                		li.push("<td style='border: solid 1px gray;vertical-align: middle;'>填写</td>");
                	}else{
                		li.push("<td style='border: solid 1px gray;vertical-align: middle;'>多选</td>");
                	}
                }
                if(ret[index].distribased.toString() == "1"){
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>是</td>");
                }else{
                    li.push("<td style='border: solid 1px gray;vertical-align: middle;'>否</td>");
                }
                li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+changeTime(ret[index].createtime)+"</td>");
                li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+changeTime(ret[index].updatetime)+"</td>");
                
                if(ret[index].oprtype.toString() == "1"){
                		li.push("<td style='border: solid 1px gray;vertical-align: middle;'></td>");
                    }else{
                    	li.push("<td style='border: solid 1px gray;vertical-align: middle;'><a class='viewAttr' name='"+ret[index].id+"' data-toggle='modal' data-target='#changeAttrvalue' onclick='changeAttr(this.name)'>查看属性值</a></td>");
                    }
                /* li.push("<td style='border: solid 1px gray;vertical-align: middle;'>"+ret[index].desp+"</td>"); */
                li.push("<td style='border: solid 1px gray;vertical-align: middle;'><a class='viewChange' name='"+ret[index].id+"' data-toggle='modal' data-target='#changeAttr' onclick='change(this.name"+xuhao+")'>修改</a>");

                li.push("<a class='viewDelete' id='"+ret[index].attrname+"' name='"+ret[index].id+"' onclick='delete1(this.name,this,id)'>删除</a></td></tr>");
				
                document.getElementById(a).innerHTML = li.join("");
            });
        }



    </script>
</body>
</html>