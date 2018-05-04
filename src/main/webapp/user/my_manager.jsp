<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
    <title>我的地址</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <style type="text/css" media="all">
        body, html {
            padding: 0;
            margin: 0;
            height: 100%;
            font-family: Arial, Helvetica, sans-serif;
            background: #e4ecef;
        }
    </style>
    <link rel="stylesheet" href="${ctx}/css/pullToRefresh.css"/>
    <script src="${ctx}/js/iscroll.js"></script>
    <script src="${ctx}/js/pullToRefresh.js"></script>
    <script type="text/javascript" src="${ctx}/js/alert.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>
<div id="wrapper" style="width: 100%">
    <ul id="list" style="width: 100%">
    </ul>
</div>
<footer>
</footer>
</body>
</html>
<script>
    refresher.init({
        id:"wrapper",
        pullDownAction:Refresh,
        pullUpAction:Load
    });

    Refresh();

    function Refresh() {
        var userserPost = new UserPost();
        userserPost.postId = "1";
        UserService.selectPostUserList(userserPost, refreshData);
    }

    function refreshData(managerList){
        setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
            var list = document.getElementById("list");
            while (list.childNodes.length > 1) {
                list.removeChild(list.childNodes[1]);
            }
            addList(list, managerList);
            myScroll.refresh();
        }, 200);
    }

    function Load() {
        loadData();
    }

    function loadData() {
        setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
            myScroll.refresh();
        }, 200);
    }

    function addList(list, managerList){
        for (var i=0; i<managerList.length; i++) {
            var li = document.createElement('li');
            li.style.height = "120px";
            li.style.verticalAlign = "middle";

            var span1 = document.createElement("span");
            var span2 = document.createElement("span");
            var span3 = document.createElement("span");
            span1.style.width = "30%";
            span2.style.width = "50%";
            span3.style.width = "20%";
            span1.style.float = "left";
            span2.style.float = "left";
            span3.style.float = "left";
            span1.style.listStyleType = "none";
            span2.style.listStyleType = "none";
            span3.style.listStyleType = "none";
            span1.style.verticalAlign = "middle";
            span2.style.verticalAlign = "middle";
            span3.style.verticalAlign = "middle";
            span1.innerHTML = "<img src='${ctx}/upload/photo/head/" + managerList[i].userPhoto + "' style='margin-top:10px' onclick=bindManager('" + managerList[i].userId + "') />";
            span2.innerHTML = "<span>姓名：" + managerList[i].userName + "</span><span>电话:：" + managerList[i].userMobile + "</span>";
            span3.innerHTML = "<a href='tel:1" + managerList[i].userMobile + "'><img src='${ctx}/images/mobile.png' style='margin-top:30px' /></a>";
            li.appendChild(span1);
            li.appendChild(span2);
            li.appendChild(span3);
//				list.insertBefore(li, list.childNodes[1]);
            list.appendChild(li, list.childNodes[0]);
        }
    }

    function bindManager(managerId){
        if(confirm("确定绑定该客户经理")){
            var clientManager = new ClientManager();
            clientManager.clientId = "${userId}";
            clientManager.managerId = managerId;
            UserService.updateClientManager(clientManager, callbackUpdateClientManager);
        }
    }

    function callbackUpdateClientManager(){
        location = "${ctx}/user/center_user.jsp?userId=${userId}";
    }
</script>
