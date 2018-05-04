<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<HTML>
<HEAD>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <TITLE>系统发生异常</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <META HTTP-EQUIV="pragma" CONTENT="no-cache">
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
    <META HTTP-EQUIV="expires" CONTENT="0">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/style.css"/>
</head>
<body>
<table width="100%" height="100%">
    <tr>
        <td align="center" valign="middle">
            <A id="forwardHref" href="${ctx}/controller/Logout?logoutUrl=${logoutUrl}">
                <c:out value="${message}" />
            </A>
        </td>
    </tr>
</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript" >
</SCRIPT>