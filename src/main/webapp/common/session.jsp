<%@include file="/common/taglibs.jsp"%>
<c:set var="securityAccount" value="${sessionScope.SECURITY_ACCOUNT}" scope="request" />
<c:if test="${!empty securityAccount}">
    <c:set var="accountId" value="${securityAccount.accountId}" scope="request" />
    <c:set var="accountName" value="${securityAccount.accountName}" scope="request" />
    <c:set var="accountPassword" value="${securityAccount.accountPassword}" scope="request" />
    <c:set var="applicationName" value="${securityAccount.application.applicationName}" scope="request" />
    <c:set var="userId" value="${sessionScope.userId}" scope="request" />
    <c:set var="userOpenId" value="${sessionScope.userOpenId}" scope="request" />
    <c:set var="orgId" value="${sessionScope.orgId}" scope="request" />
</c:if>
