<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<c:set var="managerId" value="${param.managerId}" />
<c:set var="addressId" value="${param.addressId}" />
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
            font: 14px "Lucida Grande", Verdana, sans-serif;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /*  */
            background: #e4ecef;
        }

        form {
            width:80%;
            margin: 30px auto;
        }
    </style>
    <link rel="stylesheet" href="${ctx}/css/head.css"/>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/imagecropper.js"></script>
    <script type="text/javascript" src="${ctx}/js/alert.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>
<table>
    <tr>
        <td align="center">
            <img width="50" height="50" src="${ctx}/images/logo.png" style="border-radius:30px;-webkit-border-radius:30px;-moz-border-radius:30px;" />
        </td>
        <td style="color:#C81B0A">
            <h2></h2>
        </td>
    </tr>
</table>
		<!--头像-->
	    <div class="header">
	        <div class="head" id="head">
				<form name="form0" id="form0" >
				    <input type="file" name="file0" accept="image/jpeg,image/png,image/jpg" id="file0" /><br>
				</form>
	            <img id="userPhoto" name="userPhoto" src="${ctx}/images/head.png" onerror="this.onerror=null; this.src='${ctx}/images/head.png'" />
	        </div>
	    </div>
    <div class="img-container">  
        <img id="img0"  src="">  
        <div class="close" >取消</div>
        <div class="saveBtn">选取</div>
    </div>
<form id="userForm" name="userForm" action="" method="post">
    <input type="hidden" id="managerId" name="managerId" value="${managerId}" />
    <input type="hidden" id="addressId" name="addressId" value="${addressId}" />
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
        <label style="display:inline-block; width: 210px">******</label>
        <a href="my_password.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div id="managerDiv" style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1); display: ">
        <label>客户经理：</label>
        <label id="managerName" style="display:inline-block; width: 210px"></label>
        <a href="my_manager.jsp?userId=${userId}">
            <img src="${ctx}/images/arrow.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
    <br/>
    <div id="addressDiv" style="height:40px; white-space:nowrap;border-bottom: 0.075em solid rgba(0,0,0,0.1); display: ">
        <label>物流地址：</label>
        <label id="userAddress" style="display:inline-block; width: 210px"></label>
        <a href="my_address_list.jsp?userId=${userId}">
            <img src="${ctx}/images/plus.png" width="20" height="20" style="vertical-align: middle" />
        </a>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
$("#file0").change(function(){
	var objUrl = getObjectURL(this.files[0]) ;
	console.log("objUrl = "+objUrl) ;
	if (objUrl) {
		$("#img0").attr("src", objUrl) ;
		$('.cropper-canvas img').attr('src',objUrl);
		$('.cropper-view-box img').attr('src',objUrl);
	}
	//var File=$('#img0').attr('src');
	//if(File!=''||File==undefined){
		$('.img-container').show();
	//}
}) ;

//建立一個可存取到該file的url
function getObjectURL(file) {
	var url = null ; 
	if (window.createObjectURL!=undefined) { // basic
		url = window.createObjectURL(file) ;
	} else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	} else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}

$('.close').click(function(){
	$('.img-container').hide();
})

function convertToData(url, canvasdata, cropdata, callback) {
	var cropw = cropdata.width; // 剪切的宽
	var croph = cropdata.height; // 剪切的宽
	var imgw = canvasdata.width; // 图片缩放或则放大后的高
	var imgh = canvasdata.height; // 图片缩放或则放大后的高

	var poleft = canvasdata.left - cropdata.left; // canvas定位图片的左边位置
	var potop = canvasdata.top - cropdata.top; // canvas定位图片的上边位置

	var canvas = document.createElement("canvas");
	var ctx = canvas.getContext('2d');

	canvas.width = cropw;
	canvas.height = croph;

	var img = new Image();
	img.src = url;

	img.onload = function() {
		this.width = imgw;
		this.height = imgh;
		// 这里主要是懂得canvas与图片的裁剪之间的关系位置
		ctx.drawImage(this, poleft, potop, this.width, this.height);
		var base64 = canvas.toDataURL('image/jpg', 1);  // 这里的“1”是指的是处理图片的清晰度（0-1）之间，当然越小图片越模糊，处理后的图片大小也就越小
		callback && callback(base64)      // 回调base64字符串
	}
}

$(function(){

	var $image = $('.img-container > img');

	$image.on("load", function() {        // 等待图片加载成功后，才进行图片的裁剪功能
	    $image.cropper({  
	        aspectRatio: 1 / 1  　　// 1：1的比例进行裁剪，可以是任意比例，自己调整  
	    });
	})

	// 点击保存
	$(".saveBtn").on("click", function() {
	    var src = $image.eq(0).attr("src");  
	    var canvasdata = $image.cropper("getCanvasData");  
	    var cropBoxData = $image.cropper('getCropBoxData');  
	    convertToData(src, canvasdata, cropBoxData, function(basechar) {
	        // 回调后的函数处理
            var user = new User();
            user.userId = "${userId}";
            user.userPhoto = basechar.split(",")[1];
            document.getElementById("userPhoto").src = basechar;
            UserService.updateUserPhoto(user, setUserHead);
            $('.img-container').hide();
	    });
	})
})

    function setUserHead(){
        $('.img-container').hide();
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
            if(user.userType != 10) {
                document.getElementById("managerDiv").style.display = "none";
                document.getElementById("addressDiv").style.display = "none";
            } else {
                var userAddress = new UserAddress();
                userAddress.userId = "${userId}";
                userAddress.addressId = "${addressId}";
                UserService.selectUserAddressList(userAddress, setAddress);
                var clientManager = new ClientManager();
                clientManager.clientId = "${userId}";
                UserService.selectClientManagerList(clientManager, setClientManager);
            }
            setModelToForm(user);
            setModelToForm(user.org);
            if(user.userPhoto != null) {
                document.getElementById("userPhoto").src = "${ctx}/upload/photo/head/" + user.userId + "/" + user.userPhoto;
            }
        }
    }

    function setClientManager(list) {
        if(list.length > 0) {
            var clientManager = list[0];
            dwr.util.setValue("managerName", clientManager.user.userName);
        }

    }

    function setAddress(list) {
        if(list.length > 0) {
            var userAddress = list[0];
            dwr.util.setValue("userAddress", userAddress.province.provinceName + userAddress.city.cityName + userAddress.district.districtName + userAddress.addressDetail);
        }

    }
</script>
