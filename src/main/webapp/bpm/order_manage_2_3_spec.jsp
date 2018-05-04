<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderSpec()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td>缺少情况</td>
            <td>
                <input type="checkbox" id="specQsqk1" name="specQsqk" value="缺少楼牌号">
                <label for="specQsqk1">缺少楼牌号</label><br>
                <input type="checkbox" id="specQsqk2" name="specQsqk" value="缺少门牌号">
                <label for="specQsqk2">缺少门牌号</label><br>
                <input type="checkbox" id="specQsqk3" name="specQsqk" value="地址不一致">
                <label for="specQsqk3">地址不一致</label>
            </td>
        </tr>
        <tr>
            <td>实际用途</td>
            <td>
                <input type="checkbox" id="specUse1" name="specUse" value="住宅">
                <label for="specUse1">住宅</label>
                <input type="checkbox" id="specUse2" name="specUse" value="办公">
                <label for="specUse2">办公</label>
                <input type="checkbox" id="specUse3" name="specUse" value="商业">
                <label for="specUse3">商业</label>
            </td>
        </tr>
        <tr>
            <td>使用现状</td>
            <td>
                <select id="specSyxz" name="specSyxz" required>
                    <option value="">请选择</option>
                    <option value="自用">自用</option>
                    <option value="出租">出租</option>
                    <option value="空置">空置</option>
                    <option value="装修中">装修中</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>原户型</td>
            <td>
                <input type="text" id="specYhx" name="specYhx" maxlength="100">
            </td>
        </tr>
        <tr>
            <td>改造方式</td>
            <td>
                <input type="text" id="specGzfs" name="specGzfs" maxlength="100">
            </td>
        </tr>
        <tr>
            <td>赠送</td>
            <td>
                <input type="text" id="specZs" name="specZs" maxlength="100">
            </td>
        </tr>
        <tr>
            <td>面积</td>
            <td>
                <input type="text" id="specMj" name="specMj" maxlength="100">
            </td>
        </tr>
        <tr>
            <td>打通</td>
            <td>
                <input type="text" id="specDt" name="specDt" placeholder="相邻房间" maxlength="10">
            </td>
        </tr>
        <tr>
            <td>其他</td>
            <td>
                <textarea id="specQt" name="specQt" style="width: 98%; height: 100px;" maxlength="200"></textarea>
            </td>
        </tr>
        <tr>
            <td>市调信息</td>
            <td>
                <textarea id="specSdxx" name="specSdxx" style="width: 98%; height: 100px;" maxlength="200"></textarea>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <button type="submit" style="width: 100%">保存</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    var orderSpec = new OrderSpec();
    orderSpec.orderId = "${orderId}";
    OrderService.selectOrderSpecList(orderSpec, function (list) {
        if(list.length > 0) {
            orderSpec = list[0];
            dwr.util.setValues(orderSpec);
            dwr.util.setValue("specQsqk", orderSpec.specQsqk.split(","));
            dwr.util.setValue("specUse", orderSpec.specUse.split(","));
        }
    });
    function insertOrderSpec() {
        var orderSpec = dwr.util.getFormValues("orderForm");
        orderSpec.specQsqk = orderSpec.specQsqk.join(",");
        orderSpec.specUse = orderSpec.specUse.join(",");
        OrderService.insertOrderSpec(orderSpec, function () {
            alert("保存成功");
        });
        return false;
    }
</script>