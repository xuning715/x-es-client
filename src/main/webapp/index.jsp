<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<HTML>
<HEAD>
    <TITLE>登陆</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8"/>
    <META HTTP-EQUIV="pragma" CONTENT="no-cache"/>
    <META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"/>
    <META HTTP-EQUIV="expires" CONTENT="0"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/style.css"/>
</HEAD>
<body bgcolor="#DEEEBD">
    <FORM method="post" name="loginForm" id="loginForm" action="${ctx}/controller/Login" onsubmit="return login()">
        <%--<input type="hidden" name="token" value="${token}" />--%>
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align=center valign=middle>
                    <table style="width:305px;height:219px;background-image: url(${ctx}/images/common/login.jpg);font-family:Arial, Helvetica, sans-serif;font-size:12px;color:#396DA5" border="0" cellpadding="0" cellspacing="2">
                        <tr>
                            <td align=right valign=bottom style="height:30px">红魔方数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td align=center valign=middle style="height:152px">
                            用户名：
                            <INPUT TYPE="text" id="accountName" NAME="accountName">
                            <BR/>
                            <BR/>
                            密&nbsp;&nbsp;&nbsp;&nbsp;码：
                            <INPUT TYPE="password" id="accountPassword" NAME="accountPassword">
                            </td>
                        </tr>
                        <tr>
                            <td align=right valign=bottom>
                                <input type="image" alt="登录" src="${ctx}/images/common/button_submit.jpg" style="border:0px" />
                                <img alt="重置" src="${ctx}/images/common/button_reset.jpg" onclick="reset()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </FORM>
</body>
</html>
<script type="text/javascript">
function login() {
    var accountName = document.getElementById("accountName").value;
    var accountPassword = document.getElementById("accountPassword").value;
    if (!accountName || !accountPassword) {
        alert("请输入用户名密码!");
        return false;
    }
    return true;
}

function reset(){
    document.getElementById("loginForm").reset();
}
</script>
