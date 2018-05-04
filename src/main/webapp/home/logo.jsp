<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <FORM method="post" id="logoutForm" name="logoutForm" action="">
        <INPUT TYPE="hidden" id="accountName" NAME="accountName" value="${accountName}">
        <INPUT TYPE="hidden" id="accountPassword" NAME="accountPassword" value="${accountPassword}">
        <center>
        <TABLE style="width:100%" cellSpacing="0" cellpadding="10">
            <tr style="color: #4682B4">
                <td style="vertical-align:middle; background:-moz-linear-gradient(top,#E1EBF4,#FFFFFF); background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#E1EBF4), to(#FFFFFF)); background-image: -webkit-gradient(linear,left bottom,left top,color-start(0, #E1EBF4),color-stop(1, #FFFFFF)); border-right:0;">
                    <img src="${ctx}/images/common/logo.gif" />
                </td>
                <td align="center" style="width:150px; vertical-align:middle;background:-moz-linear-gradient(top,#E1EBF4,#FFFFFF); background:-webkit-gradient(linear, 0% 0%, 0% 100%,from(#E1EBF4), to(#FFFFFF)); background-image: -webkit-gradient(linear,left bottom,left top,color-start(0, #E1EBF4),color-stop(1, #FFFFFF)); font-size:15px; font-weight:bold; border-left:0;" nowrap>
                    <span>${accountName} </span><a onclick="logout('${ctx}/controller/Logout')" style="cursor: hand">退出</a>
                </td>
            </tr>
        </TABLE>
        </center>
    </FORM>
<script type="text/javascript">
function logout(url) {
    document.getElementById("logoutForm").action = url;
    document.getElementById("logoutForm").submit();
}
</script>
