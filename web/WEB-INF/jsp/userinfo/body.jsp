<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中国石油财务管理系统</title>
<link rel="stylesheet" type="text/css" media="screen" href="../static/css/ztree/zTreeStyle.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../static/css/layout/layout.css" />
 <script type="text/javascript" src="../static/js/jquery-3.2.1.js"></script>
 <script type="text/javascript" src="../static/js/ztree/jquery.ztree-2.6.js" ></script>
 <style type="text/css">
#we {height:800px}
#left{width:20%;float:left;overflow-x:visible;height:800px}
#right{width:79.3%;float:right;height:800px}
li{
list-style:none
}
body{
text-align:center;
background-image: url(../static/img/background.jpg)
}
.tree li{
text-align:center
}
</style>
</head>
<!-- <frameset cols="15%,85%" border="1px" bordercolor="black">
	<frame src="menu.jsp" scrolling="no" name="menu">
	<frame src="content.jsp" scrolling="auto" name="content">
</frameset> -->
<!--  <frameset cols="15%,85%" border="1px" bordercolor="black">
	<frame id="treeframe"  scrolling="no" name="menu">
	<frame id="mainFrame" scrolling="auto" name="content">
</frameset>style="overflow:auto" -->
<!-- style="background-color:#20aaec;" -->
<body >
<!-- <div id="left"  >
<iframe src="" frameborder="0" width="100%" marginwidth="0" marginheight="0" height="100%" name="treeframe" id="treeframe"></iframe>
</div>
<div id="right">
	<iframe src="" frameborder="0" width="100%" marginwidth="0" marginheight="0" height="100%" name="mainFrame" id="mainFrame"></iframe>
</div> -->

<div style="float:left;margin-top:20px;margin-left:200px;height:30px;">尊贵的会员:${username },欢迎您登陆本系统</div>
<div id="we" class="layout we clearfix">
<div id="left" class="west" style="overflow:auto;margin-top:20px;text-align:center;">
	<div style="width: 150px;margin-left: 90px;">
		<ul id="group-tree" class="tree"></ul>
	</div>	        	
</div>
<div id="right" class="east">
	<iframe src="" frameborder="0" width="100%" marginwidth="0" marginheight="0" height="100%" name="mainFrame" id="mainFrame"></iframe>
</div>
</div>

<script type="text/javascript">
$(document).ready(function() 
{
	//TreeHandler.loadTree();//初始化 树的加载
	TreeHandler.frameInit();
	zTree = $("#group-tree").zTree(setting, treeNodes);
	$("#group-tree_1").click(function(){
		 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain1");
		});
	$("#group-tree_2").click(function(){
		 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain2");
		});
	$("#group-tree_3").click(function(){
		 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain3");
		});
	$("#group-tree_4").click(function(){
		 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain4");
		});
	$("#group-tree_5").click(function(){
		 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain5");
		});
	//addevent();
});
var setting = {  
        isSimpleData : true,              //数据是否采用简单 Array 格式，默认false  
        treeNodeKey : "id",               //在isSimpleData格式下，当前节点id属性  
        treeNodeParentKey : "pId",        //在isSimpleData格式下，当前节点的父节点id属性  
        showLine : false,                  //是否显示节点间的连线  
        checkable : false                  //每个节点上是否显示 CheckBox  
    };
    
var treeNodes = [   
              //   {"id":1, "pId":0, "name":"模板列表"},   
                 {"id":11, "pId":1, "name":"信息查询"},   
                 {"id":12, "pId":1, "name":"额度查询"},   
                 {"id":13, "pId":1, "name":"交易记录"},   
                 {"id":14, "pId":1, "name":"修改密码"},   
                 {"id":15, "pId":1, "name":"投诉与建议"},   
             ]; 
var TreeHandler = {
		frameInit:function(){
			//$("#treeframe").attr('src', "${pageContext.request.contextPath}/base/usertree");
			$("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
		}
	};
	
/* function addevent(){
	 	 var oUl = document.getElementById("group-tree");
			 var oLi = oUl.getElementsByTagName("li");
		 for(i=0;i<oLi.length;i++){
			 var oA = oLi[i].getElementsByTagName("a");
			 oA.onclick=function(id){
				 alert(id);
			 }
		 }  
	    var oUl = document.getElementById("group-tree");
	    var aLi = oUl.getElementsByTagName('li')[0];
	    var aul =  aLi.getElementsByTagName('ul')[0];
	    var bli = oUl.getElementsByTagName('li');
	    for(var i=0;i<bli.length;i++){
	    	bli[i].onclick = function(ev){
	            var ev = ev || window.event;
	            var target = ev.target || ev.srcElement;
	                 if(target.id=='group-tree_2_span'){
	                	 $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
	                     }
	            else if(target.id=='group-tree_3_span'){
	            	     $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
	                     }
	            else if(target.id=='group-tree_4_span'){
	            	     $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
	                     }
	            else if(target.id=='group-tree_5_span'){
	            	     $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
	                     }
	            else if(target.id=='group-tree_6_span'){
	            	     $("#mainFrame").attr('src', "${pageContext.request.contextPath}/base/usermain");
	                     } 
	            //alert(target.id);
	        }
	    } 
	};  */
	function reloadMain(adress){
		window.location.href = adress;
	}
</script>
</body>
</html>