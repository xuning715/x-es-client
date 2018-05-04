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
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderCharge()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td>资料齐全</td>
            <td>
                <select id="chargeZlqq" name="chargeZlqq" required>
                    <option value="">请选择</option>
                    <option value="齐全">齐全</option>
                    <option value="不齐全">不齐全</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>核对产权证原件</td>
            <td>
                <select id="chargeHdyj" name="chargeHdyj" required>
                    <option value="">请选择</option>
                    <option value="已核">已核</option>
                    <option value="未核">未核</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td>支付方式</td>
            <td>
                <select id="chargeZffs" name="chargeZffs">
                    <option value="">请选择</option>
                    <option value="现金">现金</option>
                    <option value="转账">转账</option>
                    <option value="微信">微信</option>
                    <option value="支付宝">支付宝</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>收费金额</td>
            <td>
                <input type="number" id="chargeSfje" name="chargeSfje" max="1000000">
            </td>
        </tr>
        <tr>
            <td>票据编号</td>
            <td>
                <input type="text" id="chargePjbh" name="chargePjbh" maxlength="100">
            </td>
        </tr>
        <tr>
            <td>是否开发票</td>
            <td>
                <select id="chargeFp" name="chargeFp">
                    <option value="">请选择</option>
                    <option value="否">否</option>
                    <option value="是">是</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>备注</td>
            <td>
                <input type="text" id="chargeBz" name="chargeBz" maxlength="200">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    var orderCharge = new OrderCharge();
    orderCharge.orderId = "${orderId}";
    OrderService.selectOrderChargeList(orderCharge, function (list) {
        if(list.length > 0) {
            orderCharge = list[0];
            dwr.util.setValues(orderCharge);
        }
    });
    function insertOrderCharge() {
        var orderCharge = dwr.util.getFormValues("orderForm");
        OrderService.insertOrderCharge(orderCharge, function () {
            alert("保存成功");
        });
        return false;
    }
</script>