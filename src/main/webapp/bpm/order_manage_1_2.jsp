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
    <link rel="stylesheet" href="${ctx}/css/mobiscroll.custom-2.5.0.min.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/mobiscroll.custom-2.5.0.min.js"></script>
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
    <input type="hidden" id="estateId" name="estateId" />
    <input type="hidden" id="buildingId" name="buildingId" />
    <input type="hidden" id="unitId" name="unitId" />
    <input type="hidden" id="houseId" name="houseId" />
    <form>
        <button type="button" onclick="showDiv('orderSurveyorTimeDiv')">约&nbsp;单</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="showDiv('orderRollbackDiv')">退&nbsp;单</button>&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="location='${ctx}/bpm/order_list_1_2.jsp'">返&nbsp;回</button>
    </form>
    <form style="text-align: left;">
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
    </form>

    <div id="orderSurveyorTimeDiv" style="width: 98%; border: 1px solid #0099FF; background: white; display: none; position: absolute; left: 1%; right: 1%; top: 10px; z-index: 13;">
        <form id="orderSurveyorForm" name="orderSurveyorForm" method="post" onsubmit="return updateOrderState(2)">
            <table>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td>约单日期</td>
                    <td>
                        <input type="text" id="orderSurveyorTime" name="orderSurveyorTime" style="width: 95%;" required readonly>
                    </td>
                </tr>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <button type="submit">约单</button>
                        <button type="button" onclick="closeDiv('orderSurveyorTimeDiv')">返回</button>
                    </td>
                </tr>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
    </div>

    <div id="orderRollbackDiv" style="width: 98%; border: 1px solid #0099FF; background: white; display: none; position: absolute; left: 1%; right: 1%; top: 10px; z-index: 13;">
        <form id="orderRollbackForm" name="orderRollbackForm" method="post" onsubmit="return updateOrderState(-1)">
            <table>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td>退回原因</td>
                    <td>
                        <input type="text" id="orderRollback" name="orderRollback" style="width: 95%;" required>
                    </td>
                </tr>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
                <tr align="center">
                    <td colspan="2">
                        <button type="submit">退单</button>
                        <button type="button" onclick="closeDiv('orderRollbackDiv')">关闭</button>
                    </td>
                </tr>
                <tr align="center">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>
    </div>

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
        order.orderState = 1;
        order.pageIndex = 1;
        order.pageSize = 1;
        OrderService.selectOrderList(order, function (list) {
            if(list.length > 0) {
                order = list[0];
                dwr.util.setValues(order);
                dwr.util.setValue("orderPurposeDesc", orderPurposeHash[order.orderPurpose]);
                dwr.util.setValue("orderCreateTime", order.orderCreateTime);
                var estate = new Estate();
                estate.estateId = dwr.util.getValue("estateId");
                EstateService.selectEstateList(estate, function (list) {
                    if(list.length > 0) {
                        estate = list[0];
                        dwr.util.setValue("estateName", estate.estateName);
                        dwr.util.setValue("estateAddress", estate.estateAddress);
                    }
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
    function showDiv(divId) {
        document.getElementById(divId).style.display = "block";
        if(divId == "orderSurveyorTimeDiv") {
            dwr.util.setValue("orderSurveyorTime", new Date().Format("yyyy-MM-dd hh:mm:ss"));
            $("#orderSurveyorTime").mobiscroll().date();
            //初始化日期控件
            var opt = {
                preset: 'datetime', //日期，可选：date\datetime\time\tree_list\image_text\select
                theme: 'default', //皮肤样式，可选：default\android\android-ics light\android-ics\ios\jqm\sense-ui\wp light\wp
                display: 'top', //显示方式 ，可选：modal\inline\bubble\top\bottom
                mode: 'scroller', //日期选择模式，可选：scroller\clickpick\mixed
                lang: 'zh',
                dateFormat: 'yyyy-mm-dd HH:ii:ss', // 日期格式
                setText: '确定', //确认按钮名称
                cancelText: '取消',//取消按钮名籍我
                dateOrder: 'yyyymmdd', //面板中日期排列格式
                timeWheels: 'HHii',
                timeFormat: '',
                yearText: '年', monthText: '月', dayText: '日', hourText: '时', minuteText: '分', secText: '秒',//面板中年月日文字
                showNow: false,
                nowText: "今",
                startYear: (new Date()).getFullYear(), //开始年份
                endYear: (new Date()).getFullYear() + 2 //结束年份
            };
            $("#orderSurveyorTime").mobiscroll(opt);
        }
    }

    function updateOrderState(orderState) {
        if (confirm("确定修改")) {
            var order = new Order();
            order.orderId = dwr.util.getValue("orderId");
            order.orderState = orderState;
            if(orderState == -1) {
                order.orderRollback = dwr.util.getValue("orderRollback");
            } else if(orderState == 2) {
                order.orderSurveyorTime = dwr.util.getValue("orderSurveyorTime");
            }
            OrderService.updateOrder(order, "", "", function () {
                location = "${ctx}/bpm/order_list_1_2.jsp";
            });
        }
        return false;
    }

    function closeDiv(divId) {
        document.getElementById(divId).style.display = "none";
    }

</script>