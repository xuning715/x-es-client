<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>我的信息</title>
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
        <label id="orgFullName" style="display:inline-block; width: 210px"></label>
        <div class="auto_hidden" id="autoSearchDiv"><!--自动完成 DIV--></div>
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <label id="userMobile0" style="display:inline-block; width: 210px"></label>
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <input type="tel" id="userVertifyCode" name="userVertifyCode" style="width:60px" maxlength="4" placeholder="验证码" required="true" />
        &nbsp;
        <a href="javascript:void(0)" class="zocial email" style="text-align:right;vertical-align:middle" onclick="sendCode(this)">发送短信验证码</a>
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <input type="text" id="userMobile" name="userMobile" placeholder="手机号码" required="true" />
    </div>
    <br/>
    <div style="white-space:nowrap;">
        <input type="text" id="userName" name="userName" placeholder="姓名" required="true" />
    </div>
    <br/>
    <div align="center" style="height:40px;">
        <a href="javascript:void(0)" class="zocial reg" onclick="verifyCode()">修改</a>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    var clock = '';
    var nums = 60;
    var btn;
    function sendCode(thisBtn){
        if(nums == 60){
            btn = thisBtn;
            btn.disabled = true; //将按钮置为不可点击
            UserService.sendCode(dwr.util.getValue("userMobile0"));
            btn.innerHTML = nums+' 秒后重新获取';
            clock = setInterval(doLoop, 1000); //一秒执行一次
        }
    }
    function doLoop(){
        nums--;
        if(nums > 0){
            btn.innerHTML = nums+' 秒后重新获取';
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.innerHTML = '发送短信验证码';
            nums = 60; //重置时间
        }
    }

    function verifyCode(){
        var userMobile = dwr.util.getValue("userMobile0");
        var userVertifyCode = dwr.util.getValue("userVertifyCode");
        UserService.verifyCode(userMobile, userVertifyCode, updateUser);
    }

    function updateUser(flag){
        if(flag){
            var user = dwr.util.getFormValues("userForm");
            alert(user.userId)
            alert(user.userName)
            if(!user.userName) {
                loading("请填写姓名");
                return false;
            }
            alert(user.userMobile)
            UserService.updateUser(user, center);
        } else {
            loading("验证码填写错误");
        }
    }

    function center(flag) {
        window.location = "center_user.jsp";
    }

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
            dwr.util.setValue("userMobile0", user.userMobile);
        }
    }

</script>
