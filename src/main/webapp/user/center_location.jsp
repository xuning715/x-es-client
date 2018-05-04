<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<c:set var="openId" value="${param.openId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>用户中心</title>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>

</body>
</html>
<script type="text/javascript">
    var user = new User();
    user.userOpenId = "${openId}";
    UserService.selectUserList(user, callbackSelectUserList);
    function callbackSelectUserList(list) {
        var url;
        if(list.length == 0) {
            url = "register.jsp?openId=${openId}";
        } else {
            var user = list[0];
            var userId = user.userId;
            url = "center_user.jsp?userId=" + userId;
        }
        window.location = url;
    }
</script>