<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<HEAD>
<LINK type="text/css" rel="stylesheet" href="${ctx}/css/xtree.css">
<script type="text/javascript" src="${ctx}/js/xtree.js"></script>
</HEAD>
<body>
<SCRIPT language="javascript" type="text/javascript">
var menuTree = new WebFXTree(0, '操作菜单');
<c:if test="${!empty securityAccount}">
    <c:if test="${!empty securityAccount.resourceList}">
        <c:forEach var="resource1" items="${securityAccount.resourceList}">
            var menu${resource1.resourceId} = new WebFXTreeItem("${resource1.resourceId}", "${resource1.resourceName}", "", menuTree, menuTree);
            <c:forEach var="resource2" items="${resource1.resources}">
                <c:if test="${resource2.resourceType == 1}">
                var menuItem${resource2.resourceId} = new WebFXTreeItem("${resource2.resourceId}", "${resource2.resourceName}", "javascript:parent.showMenuItem('${resource2.resourceId}', '${resource2.resourceName}', '${ctx}${resource2.resourceUrl}')", menu${resource1.resourceId}, menuTree);
                </c:if>
            </c:forEach>
        </c:forEach>
    </c:if>
</c:if>
</SCRIPT>
</body>
</html>
