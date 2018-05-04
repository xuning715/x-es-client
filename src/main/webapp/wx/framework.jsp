<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>红魔方</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        .content{
            width: 100%;
            overflow: hidden;
        }
        .title{
            width: 100%;
            height: 60px;
            background: #ededed;
            font-size: 1.2rem;
            color: #fff;
            position: relative;
            z-index: 1;
        }
        .left{
            float: left;
            line-height: 60px;
            width: 15%;
            text-align: center;
        }
        .left img{
            height: 60px;
        }
        .center{
            float: left;
            line-height: 60px;
            width: 70%;
            text-align: center;
            color: #000000;
            font-weight:bold;
        }
        .right{
            float: right;
            line-height: 60px;
            width: 15%;
            text-align: center;
        }
        #leftNav{
            position: fixed;
            overflow: hidden;
            width: 30%;
            height: 500px;
            background-color: #ffffff;
            font-size: 1.4rem;
            left: -30%;
            top: 0;
            -webkit-transition:left 0.5s;
            z-index: 120;
        }
        #blackBack{
            position: fixed;
            overflow: hidden;
            width: 0%;
            height: 0%;
            top: 0;
            left: 0;
            background-color: rgba(0,0,0,0.5);
            opacity: 0;
            z-index: 0;
            -webkit-transition:opacity 0.5s;
        }
    </style>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>
<header style="position: fixed; width: 100%; z-index: 10">
    <nav class="content">
        <ul class="title">
            <p class="left" id="menu"><img width="45" height="45" src="${ctx}/images/menu.svg"></p>
            <p id="title" class="center">我是${accountName}</p>
            <p class="right">
                <img width="30" height="30" src="${ctx}/images/message.png" style="vertical-align: middle;margin-top: 0px;">
                <sup style="background:#ff0000;font-size:10px;vertical-align: top;border-radius:50%;-webkit-border-radius:50%;-moz-border-radius:50%;">29</sup>
            </p>
        </ul>
    </nav>
</header>
<div id="leftNav">
    <ul style="text-align: center; font-size: 12px;">
        <li style="line-height: 50px; margin-top: 20px">
            <img id="deptLogo" width="80" height="80" src="${ctx}/images/head.png" onerror="this.onerror=null; this.src='${ctx}/images/head.png'" style="border-radius:50%;-webkit-border-radius:50%;-moz-border-radius:50%;border: 1px solid #b097fd" onclick="forward('${ctx}/wx/page/account_manage.jsp', '修改密码', null)" />
        </li>
        <c:forEach var="resource1" items="${securityAccount.resourceList}">
            <c:if test="${resource1.resourceState == 1}">
                <c:forEach var="resource2" items="${resource1.resources}" varStatus="status">
                    <c:if test="${resource2.resourceState == 1 && resource2.resourceType == 1}">
                        <li <c:if test="${status.index == 0}">id="homeLi"</c:if> style="line-height: 40px; vertical-align: middle; border-top: 1px solid #dddddd;" onclick="forward('${ctx}${resource2.resourceUrl}', '${resource2.resourceName}', null)">
                            <img width="10" height="10" src="${ctx}${resource2.resourceIcon}"  />
                            ${resource2.resourceName}
                        </li>
                    </c:if>
                </c:forEach>
            </c:if>
        </c:forEach>
        <li id="logoutLi" style="line-height: 40px; vertical-align: middle; border-top: 1px solid #dddddd;" onclick="location='${ctx}/controller/Logout?logoutUrl=/wx/index.jsp'">
            <img width="10" height="10" src="${ctx}"  />
            退出
        </li>
    </ul>
</div>
<div id="blackBack">
</div>
<input id="userId" name="userId" type="hidden">
<input id="deptId" name="deptId" type="hidden">
<input id="deptCode" name="deptCode" type="hidden">
<input id="deptParentId" name="deptParentId" type="hidden">
<iframe id="homeFrame" name="homeFrame" width="100%" height="2500" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="margin-top: 60px" src=""></iframe>
</body>
</html>
<script type="text/javascript">
    var menu = document.getElementById('menu');
    var leftNav = document.getElementById('leftNav');
    var back = document.getElementById('blackBack');
    menu.onclick = function(){
        leftNav.style.left = "0px";
        back.style.width = "100%";
        back.style.height = "100%";
        back.style.opacity = "1";
        back.style.zIndex = "100";
        back.onclick = function(){
            leftNav.style.left = "-30%";
            back.style.width = "0";
            back.style.height = "0";
            back.style.opacity = "0";
            back.style.zIndex = "0";
        }
        leftNav.onclick = function(){
            leftNav.style.left = "-30%";
            back.style.width = "0";
            back.style.height = "0";
            back.style.opacity = "0";
            back.style.zIndex = "0";
        }
    }

    document.getElementById("leftNav").style.height = document.documentElement.clientHeight;
    document.getElementById("blackBack").style.height = document.documentElement.clientHeight;

    var user = new User();
    user.accountId = "${accountId}";
    UserService.selectUserList(user, callbackSelectUserList);

    function callbackSelectUserList(list) {
        if (list.length > 0) {
            user = list[0];
            $("title").innerText = user.userName;
            dwr.util.setValue("userId", user.userId);
            document.getElementById("homeLi").click();
        } else {
            alert("未绑定用户");
            document.getElementById("logoutLi").click();
        }
    }

    var activeImg;
    function forward(path, title, img) {
        var homeFrame= document.getElementById("homeFrame");
        document.title = title;
        homeFrame.src = path + "?userId=" + dwr.util.getValue("userId") + "&deptId=" + dwr.util.getValue("deptId") + "&deptCode=" + dwr.util.getValue("deptCode") + "&deptParentId=" + dwr.util.getValue("deptParentId");
        if(img != null) {
            if(activeImg != null) {
                var src = activeImg.src;
                var array = src.split("/");
                src = array[array.length - 1];
                array = src.split("_");
                src = array[0];
                activeImg.src = "${ctx}/wx/images/" + src + ".png";
            }
            var src = img.src;
            var array = src.split("/");
            src = array[array.length - 1];
            array = src.split(".");
            src = array[0];
            img.src = "${ctx}/wx/images/" + src + "_selected.png";
            activeImg = img;
        }
//        homeFrame.height = document.documentElement.clientHeight;
    }
</script>

