<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
	<title>我的地址</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<style type="text/css" media="all">
		body, html {
			padding: 0;
			margin: 0;
			height: 100%;
			font-family: Arial, Helvetica, sans-serif;
			background: #e4ecef;
		}
	</style>
	<link rel="stylesheet" href="${ctx}/css/pullToRefresh.css"/>
	<script src="${ctx}/js/iscroll.js"></script>
	<script src="${ctx}/js/pullToRefresh.js"></script>
	<script type="text/javascript" src="${ctx}/js/alert.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/util.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
</head>
<body>
<header align="right" style="height:70px">
	<input type="button" value="添加地址" onclick="location='${ctx}/user/my_address.jsp?userId=${userId}'" />
</header>
<div id="wrapper" style="width: 100%">
	<ul id="list" style="width: 100%">
	</ul>
</div>
<footer>
</footer>
</body>
</html>
<script>
	var pageIndex = 1;
	var pageSize = 2;

	refresher.init({
		id:"wrapper",
		pullDownAction:Refresh,
		pullUpAction:Load
	});

	Refresh();

	function Refresh() {
		var userAddress = new UserAddress();
		userAddress.userId = "${userId}";
		userAddress.pageIndex = 1;
		userAddress.pageSize = pageSize;
		UserService.selectUserAddressList(userAddress, refreshData);
	}

	function refreshData(addressList){
		pageIndex = 1;
		var length = addressList.length;
		if(length > 0) {
			pageIndex++;
		} else {
			window.location = "${ctx}/user/my_address.jsp?userId=${userId}";
		}

		setTimeout(function () {	// <-- Simulate network congestion, remove setTimeout from production!
			var list = document.getElementById("list");
			while (list.childNodes.length > 1) {
				list.removeChild(list.childNodes[1]);
			}
            addList(list, addressList);
			myScroll.refresh();
			/****remember to refresh when you action was completed！！！****/
		}, 200);
	}

	function Load() {
		var userAddress = new UserAddress();
		userAddress.userId = "${userId}";
		userAddress.pageIndex = pageIndex;
		userAddress.pageSize = pageSize;
		UserService.selectUserAddressList(userAddress, loadData);
	}

	function loadData(addressList) {
		var length = addressList.length;
		if(length > 0) {
			pageIndex++;
		}
		setTimeout(function () {// <-- Simulate network congestion, remove setTimeout from production!
			//el =document.querySelector("#wrapper ul");
			var list = document.getElementById("list");
            addList(list, addressList);
			myScroll.refresh();
			/****remember to refresh when you action was completed！！！****/
		}, 200);
	}

    function addList(list, addressList){
        for (var i=0; i<addressList.length; i++) {
            var li = document.createElement('li');
            li.style.height = "120px";
            li.style.verticalAlign = "middle";

            var span1 = document.createElement("span");
            var span2 = document.createElement("span");
            var span3 = document.createElement("span");
            span1.style.width = "80%";
            span2.style.width = "10%";
            span3.style.width = "10%";
            span1.style.float = "left";
            span2.style.float = "left";
            span3.style.float = "left";
            span2.style.listStyleType = "none";
            span3.style.listStyleType = "none";
            span1.style.verticalAlign = "middle";
            span2.style.verticalAlign = "middle";
            span3.style.verticalAlign = "middle";
            span1.innerHTML = "<a href='${ctx}/user/center_user.jsp?userId=${userId}&addressId=" + addressList[i].addressId + "'>电话：" + addressList[i].addressMobile + "&nbsp;&nbsp;&nbsp;联系人：" + addressList[i].addressLinkman + "<br/>" + addressList[i].province.provinceName + addressList[i].city.cityName + addressList[i].district.districtName + addressList[i].addressDetail + "</a>";
            span2.innerHTML = "<a href='${ctx}/user/my_address.jsp?userId=${userId}&addressId=" + addressList[i].addressId + "'><img src='${ctx}/images/edit.png' width='20' height='20' style='vertical-align: middle' /></a>";
            span3.innerHTML = "<a href='javascript:void(0)' onclick=deleteAddress('" + addressList[i].addressId + "')><img src='${ctx}/images/del.png' width='20' height='20' style='vertical-align: middle' /></a>";
            li.appendChild(span1);
            li.appendChild(span2);
            li.appendChild(span3);
//				list.insertBefore(li, list.childNodes[1]);
            list.appendChild(li, list.childNodes[0]);
        }
    }
    function deleteAddress(addressId){
        if(confirm("确定删除快递地址")){
            var userAddress = new UserAddress();
            userAddress.addressId = addressId;
            UserService.deleteUserAddress(userAddress, Refresh);
        }
    }
</script>
