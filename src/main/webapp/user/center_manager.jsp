<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>用户中心</title>
    <style>
        *:focus{
            outline:none; /* Prevents blue border in Webkit */
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /*  */
        }

        form {
            width:80%;
            margin: 30px auto;
        }
        .upload{position: relative;width: 80px;height: 18px;line-height: 18px;background: #a4c639;text-align: center;
            color: #FFF;padding: 0px 5px;-webkit-border-radius: 2px;border-radius: 2px;
            margin: 0 auto;
        }
        .upload form{width:100%;position:absolute; left:0; top:0;opacity:0; filter:alpha(opacity=0);}
        .upload form input{width: 100%;}

        .zocial,a.zocial {
            padding: 0.05em 0.5em 0 0.5em;
            border: 1px solid #777;
            border-color: rgba(0,0,0,0.2);
            border-bottom-color: #333;
            border-bottom-color: rgba(0,0,0,0.4);
            color: #fff;
            -webkit-box-shadow: inset 0 0.08em 0 rgba(255,255,255,0.4), inset 0 0 0.1em rgba(255,255,255,0.9);
            box-shadow: inset 0 0.08em 0 rgba(255,255,255,0.4), inset 0 0 0.1em rgba(255,255,255,0.9);
            cursor: pointer;
            display: inline-block;
            font: bold 100%/2.1 "Lucida Grande", Tahoma, sans-serif;
            text-align: center;
            text-decoration: none;
            text-shadow: 0 1px 0 rgba(0,0,0,0.5);
            white-space: nowrap;

            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            user-select: none;

            position: relative;
            border-radius: .5em;
            background-image: -webkit-gradient(linear, left top, left bottom, from(rgba(255,255,255,.1)), color-stop(49%, rgba(255,255,255,.05)), color-stop(51%, rgba(0,0,0,.05)), to(rgba(0,0,0,.1)));
            background-image: -webkit-linear-gradient(rgba(255,255,255,.1), rgba(255,255,255,.05) 49%, rgba(0,0,0,.05) 51%, rgba(0,0,0,.1));
            background-image: linear-gradient(rgba(255,255,255,.1), rgba(255,255,255,.05) 49%, rgba(0,0,0,.05) 51%, rgba(0,0,0,.1));
        }

        .zocial:before {
            border-right: 0.075em solid rgba(0,0,0,0.1);
            float: left;
            font: 120%/1.65 zocial;
            font-style: normal;
            font-weight: normal;
            margin: 0 0.5em 0 0;
            padding: 0.1em 0.5em 0 0.1em;
            text-align: center;
            text-decoration: none;
            text-transform: none;
            -webkit-box-shadow: 0.075em 0 0 rgba(255,255,255,0.25);
            box-shadow: 0.075em 0 0 rgba(255,255,255,0.25);
            -moz-font-smoothing: antialiased;
            -webkit-font-smoothing: antialiased;
            font-smoothing: antialiased;
        }

        .zocial.reg:before {content: "\270E";}
        .zocial.reg {background-color: #8aba42;}
        .zocial.email:before {content: "\2709";}
        .zocial.email {background-color: #8aba42;}
    </style>
    <script type="text/javascript" src="${ctx}/js/alert.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body bgcolor="#DEEEBD">
<table>
    <tr>
        <td align="center">
            <img width="50" height="50" src="${ctx}/images/logo.png" style="border-radius:30px;-webkit-border-radius:30px;-moz-border-radius:30px;" />
        </td>
        <td style="color:#C81B0A">
            <h2>红魔方数据</h2>
        </td>
    </tr>
</table>
<div align="center">
    <img id="head" name="head" width="80" height="80" src="${ctx}/images/head.png" style="border-radius:15px;-webkit-border-radius:15px;-moz-border-radius:15px;border:1px solid #b097fd"/>
</div>
<div class="upload">
    <p>上传图片</p>
    <form>
        <input id="userPhotoFile" name="userPhotoFile" type="file" accept="image/*" onchange="$('head').src=this.value"/>
    </form>
</div>
<form id="userForm" name="userForm" action="" method="post">
    <input type="hidden" id="userId" name="userId" value="${userId}" />
    <input type="hidden" id="userOpenId" name="userOpenId" />
    <input type="hidden" id="orgId" name="orgId" required="true" />
    <input type="hidden" id="orgType" name="orgType" required="true" />
    <div style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1);">
        <label>机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;构：</label>
        <label id="orgFullName" style="display:inline-block; width: 210px"></label>
        <a href="user.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1);">
        <label style="vertical-align: middle">手&nbsp;&nbsp;机&nbsp;&nbsp;号：</label>
        <label id="userMobile" style="display:inline-block; width: 210px"></label>
        <a href="user.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1);">
        <label>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
        <label id="userName" style="display:inline-block; width: 210px"></label>
        <a href="user.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1);">
        <label>我的红豆：</label>
        <label id="userPoint" style="display:inline-block; width: 210px"></label>
        <a href="my_point.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1);">
        <label>业务密码：</label>
        <label id="userPassword" style="display:inline-block; width: 210px">******</label>
        <a href="my_password.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    selectUser();

    function selectUser() {
        var user = new User();
        user.userId = "${userId}";
        UserService.selectUserList(user, setUser);
    }

    function setUser(list) {
        if(list.length > 0) {
            var user = list[0];
            setModelToForm(user);
            setModelToForm(user.org);
        }
    }

</script>
