<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <LINK type="text/css" rel="stylesheet" href="${ctx}/css/accordion.css">
    <LINK type="text/css" rel="stylesheet" href="${ctx}/css/font-awesome.min.css">
    <script type="text/javascript" src="${ctx}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/js/accordion.js"></script>
</HEAD>
<body>
<ul id="accordion" class="accordion" style="margin-top: 0px;">
    <c:if test="${!empty securityAccount}">
    <c:if test="${!empty securityAccount.resourceList}">
        <c:forEach var="resource1" items="${securityAccount.resourceList}">
        <c:if test="${resource1.resourceType == 1}">
        <li>
            <div class="link"><i class="fa fa-dot-circle-o"></i>${resource1.resourceName}<i class="fa fa-chevron-down"></i></div>
            <ul class="submenu">
            <c:forEach var="resource2" items="${resource1.resources}">
                <c:if test="${resource2.resourceType == 1}">
                    <li><a href="javascript:void(0)" onclick="parent.showMenuItem(${resource2.resourceId}, '${resource2.resourceName}', '${ctx}${resource2.resourceUrl}')">${resource2.resourceName}</a></li>
                </c:if>
            </c:forEach>
            </ul>
        <li>
        </c:if>
        </c:forEach>
    </c:if>
</c:if>
</ul>
</body>
</html>
