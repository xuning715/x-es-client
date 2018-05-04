<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>修改密码</title>
    <style>
        *:focus{
            outline:none; /* Prevents blue border in Webkit */
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /*  */
        }

        form {
            width:250px;
            margin: 20px auto;
        }

        input, textarea {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            border:1px solid #a4c639;
            width:250px;
            font-size:18px;
            min-height:35px;

            -webkit-border-radius:10px;
            -moz-border-radius:10px;

            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
            background-color:#FFFFFF;
            border-radius:10px;
        }

        input:focus, textarea:focus {
            -webkit-box-shadow:0 0 25px #ccc;
            -moz-box-shadow:0 0 25px #ccc;
            box-shadow:0 0 25px #ccc;
            -webkit-transform: scale(1.1);
            -moz-transform: scale(1.1);
            transform: scale(1.1);
            border-color:rgba(82, 168, 236, 0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
        }

        input:not(:focus), textarea:not(:focus) {
            opacity:1;
        }

        input:required, textarea:required {
            background:url("${ctx}/images/warn.png") no-repeat 220px;
        }

        input:valid, textarea:valid {
            background:url("${ctx}/images/tick.png") no-repeat 220px;
        }

        input:focus:invalid, textarea:focus:invalid {
            background:url("${ctx}/images/cancel.png") no-repeat 220px;
        }

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
    <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
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
<form id="userForm" name="userForm" action="" method="post">
    <input type="hidden" id="userId" name="userId" value="${userId}">
    <div style="white-space:nowrap;">
        <input type="password" id="userPassword0" name="userPassword0" placeholder="原密码" required="true" />
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <input type="password" id="userPassword1" name="userPassword1" placeholder="新设密码" required="true" />
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <input type="password" id="userPassword2" name="userPassword2" placeholder="确认密码" required="true" />
    </div>
    <br/>
    <div align="center" style="height:40px;">
        <a href="javascript:void(0)" class="zocial reg" onclick="selectUser()">修改</a>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    function selectUser() {
        var user = new User();
        user.userId = "${userId}";
        user.userPassword = dwr.util.getValue("userPassword0");
        if(!user.userPassword) {
            loading("原密码错误");
            return false;
        }
        UserService.selectUserList(user, updateUser);
    }

    function updateUser(list){
        if(list.length == 0) {
            loading("原密码错误");
            return false;
        }
        var user = new User();
        user.userId = "${userId}";
        user.userPassword = dwr.util.getValue("userPassword1");
        alert(user.userPassword)
        if(!user.userPassword) {
            loading("新密码错误");
            return false;
        }
        if(user.userPassword != dwr.util.getValue("userPassword2")) {
            loading("确认密码不一致");
            return false;
        }
        UserService.updateUser(user, center);
    }

    function center(flag) {
        if(flag > 0) {
            loading("密码修改成功");
            window.location = "center_user.jsp";
        } else {
            loading("密码修改失败");
        }
    }
</script>
