<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="openId" value="${param.openId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>红魔方</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<br>
<table width="100%">
    <tr>
        <td align="center">
            <img width="100" height="100" src="${ctx}/images/logo.png" style="border: 1px #ececec solid;border-radius:50%;-webkit-border-radius:50%;-moz-border-radius:50%;" />
        </td>
    </tr>
</table>
<FORM method="post" id="loginForm" name="loginForm" action="${ctx}/controller/Login">
    <input type="hidden" id="userOpenId" name="userOpenId" value="${openId}" />
    <input type="hidden" id="loginUrl" name="loginUrl" value="/wx/framework.jsp" />
    <input type="hidden" id="logoutUrl" name="logoutUrl" value="/wx/index.jsp" />
    <table width="100%">
        <tr>
            <td>
                <INPUT TYPE="tel" id="accountName" NAME="accountName" placeholder="手机号" minlength="11" maxlength="11" required />
            </td>
        </tr>
        <tr>
            <td>
                <INPUT TYPE="password" id="accountPassword" NAME="accountPassword" placeholder="密码" required />
            </td>
        </tr>
        <tr align="center">
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <button type="submit" style="width: 100%;">登&nbsp;&nbsp;录</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
</script>