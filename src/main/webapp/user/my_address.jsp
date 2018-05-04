<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<c:set var="userId" value="${param.userId}" />
<c:set var="addressId" value="${param.addressId}" />
<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<meta content="email=no" name="format-detection">
	<title>我的地址</title>
	<link rel="stylesheet" href="${ctx}/css/switch-box.css"/>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
	<link rel="stylesheet" href="${ctx}/css/LArea.css"/>
	<script type="text/javascript" src="${ctx}/js/LAreaData2.js"></script>
	<script type="text/javascript" src="${ctx}/js/LArea.js"></script>
	<script type="text/javascript" src="${ctx}/js/alert.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/util.js"></script>
	<script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script></head>

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
<form id="addressForm" name="addressForm" method="post">
	<input type="hidden" id="userId" name="userId" value="${userId}" />
	<input type="hidden" id="addressId" name="addressId" value="${addressId}" />
	<input type="hidden" id="provinceId" name="provinceId"  />
	<input type="hidden" id="cityId" name="cityId"  />
	<input type="hidden" id="districtId" name="districtId"  />
            <!--label for="addressDefault" class="switch-box-label">设为默认地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input id="addressDefault" name="addressDefault" class="switch-box-input" type="checkbox" checked />
            <label for="addressDefault" class="switch-box-slider"></label-->
        <input id="addressDefault" name="addressDefault" class="tgl tgl-light" type="checkbox">
        <label for="addressDefault" class="tgl-btn"></label>
        <p>
		<input type="text" id="areaName" name="areaName" readonly="" placeholder="省、市、区" />
		<input type="hidden" id="areaId" name="areaId" required="true" />
        </p>
        <p>
		<input type="text" id="addressDetail" name="addressDetail" placeholder="详细地址" required="true" />
        </p>
        <p>
		<input type="number" id="addressMobile" name="addressMobile" minlength="11" maxlength="11" placeholder="联系电话" required="true" />
        </p>
        <p>
		<input type="text" id="addressLinkman" name="addressLinkman"  placeholder="联系人" required="true" />
        </p>
        <p class="contact-submit">
	    <input type="button" onclick="submitAddress()" value="提&nbsp;&nbsp;交"  />
        </p>
</form>
</body>
</html>
<script>
	var area = new LArea();
	area.init({
		'trigger': '#areaName',
		'valueTo': '#areaId',
		'keys': {
			id: 'value',
			name: 'text'
		},
		'type': 2,
		'data': [provs_data, citys_data, dists_data]
	});

	function setAreaId() {
		var areaId = dwr.util.getValue("areaId");
		var array = areaId.split(",");
		dwr.util.setValue("provinceId", array[0]);
		dwr.util.setValue("cityId", array[1]);
		dwr.util.setValue("districtId", array[2]);
	}

	var addressId = "${addressId}";
	if(addressId) {
		var userAddress = new UserAddress();
		userAddress.addressId = addressId;
		UserService.selectUserAddressList(userAddress, setAddress);
	}

	function setAddress(list) {
		if(list.length > 0) {
			var userAddress = list[0];
			this.setModelToForm(userAddress);
            dwr.util.setValue("areaName", userAddress.province.provinceName + userAddress.city.cityName + userAddress.district.districtName);
            dwr.util.setValue("areaId", userAddress.provinceId + "," + userAddress.cityId + "," + userAddress.districtId);
		}
	}

	function submitAddress() {
		setAreaId();
		var userAddress = dwr.util.getFormValues("addressForm");
		if (!userAddress.addressId) {
			UserService.insertUserAddress(userAddress, addressList);
		} else {
			UserService.updateUserAddress(userAddress, addressList);
		}
	}

	function addressList() {
		window.location = "${ctx}/user/my_address_list.jsp?userId=${userId}"
	}
</script>

