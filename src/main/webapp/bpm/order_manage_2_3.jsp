<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="orderState" value="${param.orderState}" />
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<c:set var="orderValuatorDept" value="${param.orderValuatorDept}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form>
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="estateId" name="estateId" />
    <input type="hidden" id="buildingId" name="buildingId" />
    <input type="hidden" id="unitId" name="unitId" />
    <input type="hidden" id="houseId" name="houseId" />
    <table width="100%" align="center" cellpadding="5" cellspacing="0">
        <tr>
            <td id="activeTd" style="color: #729fb2; background: #e1ecf5; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_report.jsp?userId=${userId}&orderId=${orderId}', this)">报单</td>
            <td id="orderEstateState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_estate.jsp?userId=${userId}&orderId=${orderId}&estateId=${estateId}', this)">楼盘</td>
            <td id="orderBuildingUnitState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_buildingunit.jsp?userId=${userId}&orderId=${orderId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}', this)">楼栋</td>
            <td id="orderHouseState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_house.jsp?userId=${userId}&orderId=${orderId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}', this)">房间</td>
            <td style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="location='${ctx}/bpm/order_manage_2_3_location.jsp?userId=${userId}&orderId=${orderId}&orderState=${orderState}&estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}&orderValuatorDept=${orderValuatorDept}'">定位</td>
        </tr>
        <tr>
            <td id="orderListBack" style="color: #729fb2;" onclick="">返回</td>
            <td id="orderSignState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_sign.jsp?userId=${userId}&orderId=${orderId}', this)">签字</td>
            <td id="orderSpecState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_spec.jsp?userId=${userId}&orderId=${orderId}', this)">特殊</td>
            <td id="orderChargeState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_charge.jsp?userId=${userId}&orderId=${orderId}', this)">资费</td>
            <td id="orderImageState" style="color: red; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_2_3_folder.jsp?userId=${userId}&orderId=${orderId}&orderValuatorDept=${orderValuatorDept}', this)">图像</td>
        </tr>
    </table>
</form>
<iframe id="homeFrame" name="homeFrame" width="100%" height="100%" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0" src="${ctx}/bpm/order_manage_2_3_report.jsp?userId=${userId}&orderId=${orderId}"></iframe>
</body>
</html>
<script type="text/javascript">
    var homeFrame= document.getElementById("homeFrame");
    homeFrame.height = document.documentElement.clientHeight;
    var activeTd = document.getElementById("activeTd");
    function forward(path, td) {
        homeFrame.src = path;
        homeFrame.height = document.documentElement.clientHeight;
        activeTd.style.background = "#ffffff";
        td.style.background = "#e1ecf5";
        activeTd = td;
    }

    var order = new Order();
    order.orderId = "${orderId}";
    order.pageIndex = 1;
    order.pageSize = 1;
    OrderService.selectOrderList(order, function (list) {
        if (list.length > 0) {
            order = list[0];
            document.getElementById("orderEstateState").style.color = order.orderEstateState == 0 ? "red" : "#729fb2";
            document.getElementById("orderBuildingUnitState").style.color = order.orderBuildingUnitState == 0 ? "red" : "#729fb2";
            document.getElementById("orderHouseState").style.color = order.orderHouseState == 0 ? "red" : "#729fb2";
            document.getElementById("orderSignState").style.color = order.orderSignState == 0 ? "red" : "#729fb2";
            document.getElementById("orderSpecState").style.color = order.orderSpecState == 0 ? "red" : "#729fb2";
            document.getElementById("orderChargeState").style.color = order.orderChargeState == 0 ? "red" : "#729fb2";
            document.getElementById("orderImageState").style.color = order.orderImageState == 0 ? "red" : "#729fb2";
        }
    });

    var orderState = ${orderState};
    document.getElementById("orderListBack").onclick = function () {
        if (orderState == 2) {
            location = "${ctx}/bpm/order_list_2_3.jsp?userId=${userId}";
        } else if (orderState == 3) {
            location = "${ctx}/bpm/order_list_3.jsp?userId=${userId}";
        }
    }

</script>