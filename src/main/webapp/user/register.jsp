<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="openId" value="${param.openId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>用户注册</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/alert.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>
    <table>
        <tr>
            <td align="center">
                <img width="50" height="50" src="${ctx}/images/logo.png" style="border-radius:30px;-webkit-border-radius:30px;-moz-border-radius:30px;" />
            </td>
            <!--td style="color:#C81B0A">
            <h2>红魔方数据</h2>
        </td-->
        </tr>
    </table>
<form id="userForm" name="userForm" method="post">
        <p>
            <input type="hidden" id="userOpenId" name="userOpenId" value="${openId}" />
            <input type="hidden" id="orgId" name="orgId" required="true" />
            <input type="hidden" id="orgType" name="orgType" required="true" />
            <input type="search" id="orgFullName" name="orgFullName" placeholder="机构" oninput="autoComplete.start(event)" onpaste="return false" required="true" />
            <div class="auto_hidden" id="autoSearchDiv" style="text-align:left;"></div>
        </p>
        <p>
            <input type="tel" id="userMobile" name="userMobile" minlength="11" maxlength="11" placeholder="手机号" required="true" />
        </p>
        <p>
            <input type="text" id="userName" name="userName" placeholder="姓名" required="true" />
        </p>
        <p style="white-space:nowrap;">
            <input type="tel" id="userVertifyCode" name="userVertifyCode" style="width:38%;" maxlength="4" placeholder="验证码" required="true" />
            <input type="button" id="sendCodeButton" value="发送短信验证码" style="width:60%;" onclick="selectUser()">
        </p>
        <p class="contact-submit">
            <input type="button" value="注&nbsp;&nbsp;册" onclick="verifyCode()">
        </p>
</form>
</body>
</html>
<script type="text/javascript">
    var clock = '';
    var nums = 60;
    var btn;
    function selectUser() {
        var userMobile = dwr.util.getValue("userMobile");
        if(!userMobile){
            loading("请填写手机号");
            return false;
        }
        var user = new User();
        user.userMobile = userMobile;
        UserService.selectUserList(user, sendCode);
    }
    function sendCode(list){
        if(list.length == 1){
            loading("该电话号码已存在");
            return false;
        }
        var userMobile = dwr.util.getValue("userMobile");
        if(nums == 60){
            btn = $("sendCodeButton");
            btn.disabled = true; //将按钮置为不可点击
            UserService.sendCode(userMobile);
            btn.innerHTML = nums;
            clock = setInterval(doLoop, 1000); //一秒执行一次
        }
    }
    function doLoop(){
        nums--;
        if(nums > 0){
            btn.innerHTML = nums;
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.innerHTML = '发送短信验证码';
            nums = 60; //重置时间
        }
    }
    var Bind = function(object, fun) {
        return function() {
            return fun.apply(object, arguments);
        }
    }
    function AutoComplete(obj, autoObj){
        this.obj = $(obj);        //输入框
        this.autoObj = $(autoObj);//DIV的根节点
        this.index = -1;          //当前选中的DIV的索引
        this.search_value = "";   //保存当前搜索的字符
    }
    AutoComplete.prototype = {
        //初始化DIV的位置
        init: function(){
            this.autoObj.style.left = this.obj.offsetLeft + "px";
            this.autoObj.style.top  = this.obj.offsetTop + this.obj.offsetHeight + "px";
            this.autoObj.style.width = this.obj.offsetWidth - 2 + "px";//减去边框的长度2px
        },
        //删除自动完成需要的所有DIV
        deleteDIV: function(){
            //while(this.autoObj.hasChildNodes()){
            //    this.autoObj.removeChild(this.autoObj.firstChild);
            //}
            while(this.autoObj.children.length > 0){
                this.autoObj.removeChild(this.autoObj.childNodes[0]);
            }
            this.autoObj.className = "auto_hidden";
        },
        //设置值
        setValue: function(_this){
            return function(){
                setOrg(this.id, this.name, this.type);
                _this.autoObj.className = "auto_hidden";
            }
        },
        //模拟鼠标移动至DIV时，DIV高亮
        autoOnmouseover: function(_this,_div_index){
            return function(){
                _this.index = _div_index;
                var length  =  _this.autoObj.children.length;
                for(var j = 0; j < length; j++){
                    if(j != _this.index ){
                        _this.autoObj.childNodes[j].className = 'auto_onmouseout';
                    }else{
                        _this.autoObj.childNodes[j].className = 'auto_onmouseover';
                    }
                }
            }
        },
        //更改classname
        changeClassname: function(length){
            for(var i = 0; i < length; i++){
                if(i != this.index ){
                    this.autoObj.childNodes[i].className = 'auto_onmouseout';
                }else{
                    this.autoObj.childNodes[i].className = 'auto_onmouseover';
                    this.key = this.autoObj.childNodes[i].id;
                    this.value = this.autoObj.childNodes[i].name;
                    this.type = this.autoObj.childNodes[i].type;
                    setOrg(this.autoObj.childNodes[i].id, this.autoObj.childNodes[i].name, this.autoObj.childNodes[i].type);
                }
            }
        }
        ,
        //响应键盘
        pressKey: function(event){
            var length = this.autoObj.children.length;
            //光标键"↓"
            if(event.keyCode == 40){
                ++this.index;
                if(this.index > length){
                    this.index = 0;
                }else if(this.index == length){
                    this.obj.value = this.search_value;
                }
                this.changeClassname(length);
            }
            //光标键"↑"
            else if(event.keyCode == 38){
                this.index--;
                if(this.index < -1){
                    this.index = length - 1;
                }else if(this.index == -1){
                    this.obj.value = this.search_value;
                }
                this.changeClassname(length);
            }
            //回车键
            else if(event.keyCode == 13){
                this.autoObj.className = "auto_hidden";
                this.index = -1;
                if(this.autoObj.childNodes.length > 0){
                    if(this.key != null) {
                        setOrg(this.key, this.value, this.type);
                        this.key = null;
                    } else {
                        setOrg(this.autoObj.childNodes[0].id, this.autoObj.childNodes[0].name, this.autoObj.childNodes[0].type);
                    }
                }
                else{
                    setOrg(null, null, null);
                }
            }else{
                this.index = -1;
            }
        },
        //程序入口
        start: function(event){
            if(event.keyCode != 13&&event.keyCode != 38&&event.keyCode != 40){
                this.init();
                this.deleteDIV();
                this.search_value = this.obj.value;
                //valueArr.sort();
                if(this.obj.value.replace(/(^\s*)|(\s*$)/g,'') == ""){ return; }//值为空，退出
                search(this.obj.value);
            }
            this.pressKey(event);
            window.onresize = Bind(this,function(){this.init();});
        }
    }
    function setOrg(id, name, type){
        if(name != null) {
            dwr.util.setValue("orgId", id);
            dwr.util.setValue("orgFullName", name);
            dwr.util.setValue("orgType", type);
            if(id != null) {
                //alert(id + name + type);
            }
        } else {
            loading("数据不存在");
        }
    }

    var autoComplete = new AutoComplete('orgFullName', 'autoSearchDiv');

    function search(keyword){
        OrgService.queryCrmOrg(keyword, callbackSearch);
    }
    function callbackSearch(array){
        try{
            var reg = new RegExp("(" + autoComplete.obj.value + ")","i");
        }
        catch (e){
            return;
        }
        autoComplete.deleteDIV()
        var divIndex = 0;//记录创建的DIV的索引
        for(var i = 0; i < array.length; i++){
            var div = document.createElement("div");
            div.className = "auto_onmouseout";
            div.id = array[i].orgId;
            div.name = array[i].orgFullName;
            div.type = array[i].orgType;
            div.onclick = autoComplete.setValue(autoComplete);
            div.onmouseover = autoComplete.autoOnmouseover(autoComplete, i);
            div.innerHTML = array[i].orgFullName.replace(reg,"<strong style='color:#ff0033'>$1</strong>");//搜索到的字符粗体显示
            autoComplete.autoObj.appendChild(div);
            autoComplete.autoObj.className = "auto_show";
            divIndex++;
        }
    }
    function verifyCode(){
        var userMobile = dwr.util.getValue("userMobile");
        var userVertifyCode = dwr.util.getValue("userVertifyCode");
        UserService.verifyCode(userMobile, userVertifyCode, insertUser);
    }
    function insertUser(flag){
        if(flag){
            var user = dwr.util.getFormValues("userForm");

            var orgType = dwr.util.getValue("orgType");
            if(!user.orgId) {
                loading("请选择机构");
                return false;
            }
            if(!user.userName) {
                loading("请填写姓名");
                return false;
            }
            UserService.insertUser(user, orgType, center);
        } else {
            loading("验证码填写错误");
        }
    }
    function center(userId) {
        window.location = "${ctx}/user/center_user.jsp?userId=" + userId;
    }
</script>