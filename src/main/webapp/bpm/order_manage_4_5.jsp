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
    <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table width="100%" align="center">
        <tr>
            <td id="activeTd" style="color: #729fb2; background: #e1ecf5; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_4_5_data.jsp?userId=${userId}&orderId=${orderId}&estateId=${estateId}&sampleId=${sampleId}&orderValuatorDept=${orderValuatorDept}', this)">资料/照片</td>
            <td id="orderEstateState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_4_5_remark.jsp?orderId=${orderId}&estateId=${estateId}', this)">备注项</td>
            <td id="orderBuildingUnitState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_4_5_evaluate.jsp?userId=${userId}&orderId=${orderId}&estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}&orderValuatorDept=${orderValuatorDept}', this)">计算属性</td>
            <td id="orderHouseState" style="color: #729fb2; -webkit-border-radius: 3px;-moz-border-radius: 3px;border-radius: 3px;" onclick="forward('${ctx}/bpm/order_manage_3_4_house.jsp?orderId=${orderId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=${sampleId}', this)">定值</td>
            <td style="color: #729fb2;" onclick="location='${ctx}/bpm/order_list_4_5.jsp?userId=${userId}'">返回</td>
        </tr>
    </table>
</form>
<iframe id="homeFrame" name="homeFrame" width="100%" height="5000" frameborder="0" scrolling="yes" marginwidth="0" marginheight="0" src="${ctx}/bpm/order_manage_4_5_data.jsp?userId=${userId}&orderId=${orderId}&estateId=${estateId}&sampleId=${sampleId}&orderValuatorDept=${orderValuatorDept}"></iframe>
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