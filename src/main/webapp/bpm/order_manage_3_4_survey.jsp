<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
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
    <table width="100%" align="center">
        <tr>
            <td id="activeTd" style="color: #729fb2; background: #e1ecf5; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_report.jsp?userId=${userId}&orderId=${orderId}', this)">报单</td>
            <td id="orderEstateState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_estate.jsp?orderId=${orderId}&estateId=${estateId}', this)">楼盘</td>
            <td id="orderBuildingUnitState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_buildingunit.jsp?orderId=${orderId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}', this)">楼栋</td>
            <td id="orderHouseState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_house.jsp?orderId=${orderId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}', this)">房间</td>
        </tr>
        <tr>
            <td style="color: #729fb2;" onclick="location='${ctx}/bpm/order_list_3_4.jsp?userId=${userId}'">返回</td>
            <td id="orderSpecState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_spec.jsp?orderId=${orderId}', this)">特殊</td>
            <td id="orderChargeState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_charge.jsp?orderId=${orderId}', this)">资费</td>
            <td id="orderImageState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_folder.jsp?orderId=${orderId}&orderValuatorDept=${orderValuatorDept}', this)">图像</td>
        </tr>
    </table>
</form>
<iframe id="homeFrame" name="homeFrame" width="100%" height="5000" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0" src="${ctx}/bpm/order_manage_3_4_report.jsp?userId=${userId}&orderId=${orderId}"></iframe>
</body>
</html>
<script type="text/javascript">
    var homeFrame= document.getElementById("homeFrame");
//    homeFrame.height = document.documentElement.clientHeight;
    var activeTd = document.getElementById("activeTd");
    function forward(path, td) {
        homeFrame.src = path;
//        homeFrame.height = document.documentElement.clientHeight;
        activeTd.style.background = "#ffffff";
        td.style.background = "#e1ecf5";
        activeTd = td;
    }

    <%--var order = new Order();--%>
    <%--order.orderId = "${orderId}";--%>
    <%--order.pageIndex = 1;--%>
    <%--order.pageSize = 1;--%>
    <%--OrderService.selectOrderList(order, function (list) {--%>
        <%--if (list.length > 0) {--%>
            <%--order = list[0];--%>
        <%--}--%>
    <%--});--%>
</script>