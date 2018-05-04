<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
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
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<input type="hidden" id="orderId" name="orderId" value="${orderId}" />
<input type="hidden" id="userId" name="userId" value="${userId}" />
    <input type="hidden" id="estateId" name="estateId" />
    <input type="hidden" id="buildingId" name="buildingId" />
    <input type="hidden" id="unitId" name="unitId" />
    <input type="hidden" id="houseId" name="houseId" />
    <p id="orderValuatorDept-orderCode-orderPurpose">
        <label>评估编号：</label>
        <label id="orderValuatorDept"></label>-<label id="orderCode"></label>-<label id="orderPurpose"></label>
    </p>
    <p>
        <label>报评时间：</label>
        <label id="orderCreateTime"></label>
    </p>
    <p id="orderEstateName" style="font-size: 20px"></p>
    <p id="estateName" style="color: #0a6cd6; font-size: 20px"></p>
    <p id="orderHouseAddress"></p>
    <p style="color: #0a6cd6;">
        <label id="estateAddress"></label>
        <label id="buildingName"></label>
        <label id="unitName"></label>
        <label id="houseCode"></label>
    </p>
    <p>
        <label>贷款银行：</label>
        <label id="loanBankOrgName"></label>
    </p>
    <p>
        <label>评估目的：</label>
        <label id="orderPurposeDesc"></label>
    </p>
    <p>
        <label>委托机构：</label>
        <label id="reporterOrgName"></label>
    </p>
    <p>
        <label>报单人：</label>
        <label id="orderReporterName"></label>
    </p>
    <p>
        <label>报单人电话：</label>
        <label id="orderReporterMobile"></label>
    </p>
    <p>
        <label>看房联系人：</label>
        <label id="orderWatcherName"></label>
    </p>
    <p>
        <label>看房联系电话：</label>
        <label id="orderWatcherMobile"></label>
    </p>
    <p>
        <label>资料获取方式：</label>
        <label id="orderDataWay"></label>
    </p>
    <p>
        <label>收费方式：</label>
        <label id="orderChargeWay"></label>
    </p>
    <p>
        <label>查勘员费用：</label>
        <label id="orderSurveyorFee"></label>
    </p>
    <p>
        <label>查勘注意事项：</label>
        <label id="orderSurveyorAttention"></label>
    </p>
    <p id="orderP" style="display: none;">
        <button type="button" style="width: 100%;" onclick="updateOrder()">完成查勘</button>
    </p>
</body>
</html>
<script type="text/javascript">
    var orderPurposeHash = {
        "D":"个人抵押",
        "M":"二手房买卖",
        "L":"了解市值",
        "E":"中英文报告",
        "Y":"预估报告",
        "Z":"咨询",
        "Q":"中小企业贷款"
    }

    if("${orderId}".length > 0) {
        var order = new Order();
        order.orderId = "${orderId}";
//        order.orderState = 2;
        order.pageIndex = 1;
        order.pageSize = 1;
        OrderService.selectOrderList(order, function (list) {
            if(list.length > 0) {
                order = list[0];
                dwr.util.setValues(order);
                dwr.util.setValue("orderPurposeDesc", orderPurposeHash[order.orderPurpose]);
                dwr.util.setValue("orderCreateTime", order.orderCreateTime);

                if(order.orderEstateState == 1 && order.orderBuildingUnitState == 1 && order.orderHouseState == 1 && order.orderSignState == 1 && order.orderSpecState == 1 && order.orderChargeState == 1 && order.orderImageState == 1) {
                    document.getElementById("orderP").style.display = "block";
                }

                var estate = new Estate();
                estate.estateId = dwr.util.getValue("estateId");
                EstateService.selectEstateList(estate, function (list) {
                    estate = list[0];
                    dwr.util.setValue("estateName", estate.estateName);
                    dwr.util.setValue("estateAddress", estate.estateAddress);
                });
                var building = new Building();
                building.buildingId = dwr.util.getValue("buildingId");
                BuildingService.selectBuildingList(building, function (list) {
                    if(list.length > 0) {
                        building = list[0];
                        dwr.util.setValue("buildingName", building.buildingName);
                    }
                });
                var unit = new Unit();
                unit.unitId = dwr.util.getValue("unitId");
                UnitService.selectUnitList(unit, function (list) {
                    if(list.length > 0) {
                        unit = list[0];
                        dwr.util.setValue("unitName", unit.unitName);
                    }
                });
                var house = new House();
                house.houseId = dwr.util.getValue("houseId");
                HouseService.selectHouseList(house, function (list) {
                    if(list.length > 0) {
                        house = list[0];
                        dwr.util.setValue("houseCode", house.houseCode);
                    }
                });
            }
        });
    }

    function updateOrder() {
        var order = new Order();
        order.orderId = "${orderId}";
        order.orderState = 3;
        OrderService.updateOrder(order, "", "", function () {
            parent.document.location = "${ctx}/bpm/order_list_2_3.jsp?userId=${userId}";
        });
    }
</script>