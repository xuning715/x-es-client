<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="message" value="${param.message}" />
<HTML>
<HEAD>
<TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="0">
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
</head>
<body>
</body>
</html>
<script type="text/javascript">
alert("${message}");
</script>
