<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.trs.model.AppUser"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
AppUser loginUser = (AppUser)	request.getSession().getAttribute("loginUser");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--[if IE 7]>
	<meta http-equiv="X-UA-Compatible" content="IE=7"/>
<![endif]-->

<!--[if IE 8]>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
<![endif]-->


<!--[if IE 9]>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"/>
<![endif]-->

<title>TRS杭州办事处-互动平台</title>
<link href="<%=basePath%>appadmin/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>appadmin/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>appadmin/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="<%=basePath%>appadmin/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="<%=basePath%>appadmin/css/app_mgr.css" rel="stylesheet" type="text/css" media="screen"/>
<!--[if IE]>
<link href="<%=basePath%>appadmin/themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="<%=basePath%>appadmin/js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="<%=basePath%>appadmin/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/jquery.cookie.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/jquery.validate.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/xheditor/xheditor-1.1.14-zh-cn.min.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->


<script src="<%=basePath%>appadmin/js/dwz.core.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.util.date.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.drag.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.tree.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.accordion.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.ui.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.theme.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.navTab.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.tab.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.resize.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.dialog.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.stable.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.ajax.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.pagination.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.database.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.effects.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.panel.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.history.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.combox.js" type="text/javascript"></script>
<script src="<%=basePath%>appadmin/js/dwz.print.js" type="text/javascript"></script>

<script src="<%=basePath%>appadmin/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("<%=basePath%>appadmin/js/dwz.frag.xml", {
		//loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
		loginUrl:"<%=basePath%>login.do?method=login",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"<%=basePath%>appadmin/themes"}); // themeBase 相对于appMgr页面的主题base路径
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="###">标志</a>
				<ul class="nav">
					<li><a href="javascript:" ><%=loginUser.getUsername() %> 你好！</a></li>

					<li><a href="<%=basePath%>appMgr.do?method=edditPage&userIDs=<%=loginUser.getUserId() %>&pageFlag=1" target="dialog" mask="true" width="500" height="320">个人资料</a></li>
					<li><a href="<%=basePath %>appMgr.do?method=edditPage&userIDs=<%=loginUser.getUserId() %>&pageFlag=0" title="重置密码" target="dialog" mask="true" width="500" height="320">修改密码</a></li>
	<%
		if(loginUser.getUsertype()==1){
 	%>
					<li><a href="<%=basePath %>appindex.jsp" target="_blank">后台管理</a></li>
	<%
		}
 	%>					
					<li><a href="login.do?method=logoutUser">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>我的应用</h2>
					</div>
					<div class="accordionContent">
						<ul id="ztreedemo" class="ztree"></ul>
					</div>
					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">

					</div>
					
				</div>
			</div>
		</div>

	</div>

	<div id="footer">
	
	</div>

<script  type="text/javascript">
	var setting = {   
        data: {   
            simpleData: {   
                enable: true  
            }   
        },async: {
				enable: true,//开启异步加载
				autoParam:["id","name","url","target","rel"],//设置父节点数据需要自动提交的参数
				url:"<%=basePath%>appMgr.do?method=getAppTreeJson", //设置异步获取节点的 URL 地址
				dataFilter: ajaxJsonFilter
		},  
        callback: {   
            onAsyncSuccess:zTreeRegisterTargetx,
            onClick: onClickFun
        },
        view:{
        	dblClickExpand: false
        } 
    };	                             
        var zNodes ;
        var currNodeId ;
	function ajaxJsonFilter(treeId, parentNode, childNodes){
		var zTree = $.fn.zTree.getZTreeObj("ztreedemo");
		if (!childNodes) return null;
		var l=childNodes.length;
		if(l<1){
			zTree.reAsyncChildNodes(parentNode.getParentNode(), "refresh");			
		}
		return childNodes;
	}
    function zTreeRegisterTargetx(event, treeId, treeNode) {   
        initUI($('#'+treeId));
        var treeObj = $.fn.zTree.getZTreeObj("ztreedemo");
        var node = treeObj.getNodeByParam("id", currNodeId, null);
        treeObj.selectNode(node);       
    }
    function onClickFun(e,treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("ztreedemo");
		zTree.expandNode(treeNode, null, null, null, true);
	}
	function refreshNode() {
		var zTree = $.fn.zTree.getZTreeObj("ztreedemo"),
		nodes = zTree.getSelectedNodes();
		
		if (nodes.length == 0) {
			alert("请先选择一个父节点");
		}
		var parentNode = nodes[0].getParentNode();
		currNodeId = nodes[0].id;
		var isParent = nodes[0].isParent;		
 		if(isParent==false){
			zTree.reAsyncChildNodes(parentNode, "refresh");			
		}else{		
			zTree.reAsyncChildNodes(nodes[0], "refresh");
		}
		
	} 
        
    $(document).ready(function(){   
		$.fn.zTree.init($("#ztreedemo"), setting, zNodes);
		 errorULock();
    }); 
    function errorULock(){
			  $.get("<%=basePath%>appMgr.do?method=ULockErrorObject", {Action:"get",appId:1,timeStamp:new Date().getTime()}, function (data, textStatus){
					this; 
					//alert(data);
				});
		}
		
   		//window.onbeforeunload = function (e) {
   		//window.onunload = function (e) {
		//	 errorULock();
		//};
</script>
</body>
</html>