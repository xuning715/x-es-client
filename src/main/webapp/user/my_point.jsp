<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
	<title>我的红豆</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" href="${ctx}/css/pullToRefresh.css"/>
	<script src="${ctx}/js/iscroll.js"></script>
	<script src="${ctx}/js/pullToRefresh.js"></script>
	<style type="text/css" media="all">
		body, html {
			padding: 0;
			margin: 0;
			height: 100%;
			font-family: Arial, Helvetica, sans-serif;
		}
	</style>
	<script type="text/javascript" src="${ctx}/js/alert.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/util.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body bgcolor="#DEEEBD">
<header></header>
<div id="wrapper" style="width: 100%">
	<ul id="list" style="width: 100%">
		<li style="width: 100%">
			<span style="width: 10%; float: left; list-style-type: none;">变动</span>
			<span style="width: 10%; float: left; list-style-type: none;">总数</span>
			<span style="width: 40%; float: left; list-style-type: none;">备注</span>
			<span style="width: 40%; float: left; list-style-type: none;">时间</span>
		</li>
	</ul>
</div>
<footer>
</footer>
</body>
</html>
<script>
	var pageIndex = 1;
	var pageSize = 2;

	refresher.init({
		id:"wrapper",
		pullDownAction:Refresh,
		pullUpAction:Load
	});

	Refresh();

	function Refresh() {
		var pointLog = new PointLog();
		pointLog.userId = "${userId}";
		pointLog.pageIndex = 1;
		pointLog.pageSize = pageSize;
		UserService.selectPointLogList(pointLog, refreshData);
	}

	function refreshData(pointLogList){
		pageIndex = 1;
		var length = pointLogList.length;
		if(length > 0) {
			pageIndex++;
		}
		setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
			var li;
			var list = document.getElementById("list");
			while (list.childNodes.length > 2) {
				list.removeChild(list.childNodes[2]);
			}
			for (var i=0; i<length; i++) {
				li = document.createElement('li');
				var span1 = document.createElement("span");
				var span2 = document.createElement("span");
				var span3 = document.createElement("span");
				var span4 = document.createElement("span");
				span1.style.width = "10%";
				span2.style.width = "10%";
				span3.style.width = "40%";
				span4.style.width = "40%";
				span1.style.float = "left";
				span2.style.float = "left";
				span3.style.float = "left";
				span4.style.float = "left";
				span1.style.listStyleType = "none";
				span2.style.listStyleType = "none";
				span3.style.listStyleType = "none";
				span4.style.listStyleType = "none";
				span1.innerText = pointLogList[i].pointIncrement;
				span2.innerText = pointLogList[i].pointCurrent;
				span3.innerText = pointLogList[i].pointRemark;
				span4.innerText = new Date(pointLogList[i].pointTime).Format("yyyy-MM-dd hh:mm:ss");
				li.appendChild(span1);
				li.appendChild(span2);
				li.appendChild(span3);
				li.appendChild(span4);
//				list.insertBefore(li, list.childNodes[1]);
				list.appendChild(li, list.childNodes[0]);
			}
			myScroll.refresh();
			/****remember to refresh when you action was completed！！！****/
		}, 200);
	}

	function Load() {
		var pointLog = new PointLog();
		pointLog.userId = "${userId}";
		pointLog.pageIndex = pageIndex;
		pointLog.pageSize = pageSize;
		UserService.selectPointLogList(pointLog, loadData);
	}

	function loadData(pointLogList) {
		var length = pointLogList.length;
		if(length > 0) {
			pageIndex++;
		}
		setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
			var li;
			//el =document.querySelector("#wrapper ul");
			var list = document.getElementById("list");

			for (var i=0; i<length; i++) {
				li = document.createElement('li');
				var span1 = document.createElement("span");
				var span2 = document.createElement("span");
				var span3 = document.createElement("span");
				var span4 = document.createElement("span");
				span1.style.width = "10%";
				span2.style.width = "10%";
				span3.style.width = "40%";
				span4.style.width = "40%";
				span1.style.float = "left";
				span2.style.float = "left";
				span3.style.float = "left";
				span4.style.float = "left";
				span1.style.listStyleType = "none";
				span2.style.listStyleType = "none";
				span3.style.listStyleType = "none";
				span4.style.listStyleType = "none";
				span1.innerText = pointLogList[i].pointIncrement;
				span2.innerText = pointLogList[i].pointCurrent;
				span3.innerText = pointLogList[i].pointRemark;
				span4.innerText = new Date(pointLogList[i].pointTime).Format("yyyy-MM-dd hh:mm:ss");
				li.appendChild(span1);
				li.appendChild(span2);
				li.appendChild(span3);
				li.appendChild(span4);
				list.appendChild(li, list.childNodes[0]);
			}
			myScroll.refresh();
			/****remember to refresh when you action was completed！！！****/
		}, 200);
	}
</script>
