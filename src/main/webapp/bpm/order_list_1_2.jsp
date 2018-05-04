<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="userId" value="${param.userId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>外业</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type='text/javascript' src='${ctx}/dwr/interface/OrderService.js'></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<input type="hidden" id="surveyorUserId" name="surveyorUserId" value="${userId}">
<input type="hidden" id="orderState" name="orderState" value="1">
<SCRIPT LANGUAGE="JavaScript" >
    var table = "<table><tr>";
    table += "<td style='width: 33.3%; color: red; font-size: 18px;'>已分配</td>";
    table += "<td style='width: 33.3%;'><a href='order_list_2_3.jsp?userId=${userId}' style='font-size: 18px;'>已约单</a></td>";
    table += "<td style='width: 33.4%;'><a href='order_list_3.jsp?userId=${userId}' style='font-size: 18px;'>已完成</a></td>";
    table += "</tr></table>";
    var orderThead = new Array(
            new XThead(table, "string", false)
    );

    var orderXTable = new XTable("order", orderThead);

    orderXTable.XTbodyArray = function (model) {
        var href = "<table><tr><td><span style='font-size: 15px'>" + model.orderValuatorDept + "-" + model.orderCode + "-" + model.orderPurpose + "</span><br>";
        href += "<span style='font-size: 20px'>" + model.orderEstateName + "</span><br>";
        href += "<span style='font-size: 20px'>" + model.orderHouseAddress + "</span></td>";
        href += "<td align='right'><a href='${ctx}/bpm/order_manage_1_2.jsp?userId=${userId}&orderId=" + model.orderId + "'><img width='' height='' src='${ctx}/images/arrow-right.png'/></a></td></tr></table>"
        var array = new Array(
                new XTbody("order", href)
        );
        return array;
    }

    orderXTable.getXList = function (page){
        var order = new Order();
        order.surveyorUserId = dwr.util.getValue("surveyorUserId");
        order.orderState = dwr.util.getValue("orderState");
        order.pageIndex = page;
        order.pageSize = orderXTable.pageSize;
        OrderService.selectOrderList(order, function(list){orderXTable.addTable(list);});
    }

    function getOrderPage(){
        var order = new Order();
        order.surveyorUserId = dwr.util.getValue("surveyorUserId");
        order.orderState = dwr.util.getValue("orderState");
        OrderService.selectOrderNum(order, function(num){orderXTable.setTotalPage(num);}) ;
    }
</SCRIPT>
</body>
</html>
<script>
    getOrderPage();
</script>
