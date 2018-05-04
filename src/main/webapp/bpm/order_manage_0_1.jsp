<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>楼盘管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/search.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/AreaService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UnitService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<table>
    <tr>
        <td colspan="4">
            <form id="estateForm" name="estateForm" method="post" onsubmit="return selectEstatePage()">
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td>
                            <input type="search" id="estateName" name="estateName" placeholder="查重：名称/别名/地址" />
                        </td>
                        <td width="15%">
                            <select id="provinceId" name="provinceId" onchange="selectCityList()">
                                <option value="">选择省</option>
                            </select>
                        </td>
                        <td width="15%">
                            <select id="cityId" name="cityId" onchange="selectDistrictList()">
                                <option value="">选择市</option>
                            </select>
                        </td>
                        <td width="15%">
                            <select id="districtId" name="districtId">
                                <option value="">选择区</option>
                            </select>
                        </td>
                        <td width="20%">
                            <img src="${ctx}/images/common/button_select.jpg" title="查询楼盘" style="cursor:pointer" onclick="selectEstatePage()"/>
                            <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="location='${ctx}/bpm/order_list_0_1.jsp'"/>
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td width="40%" valign="top">
            <input type="hidden" id="estateId" name="estateId" />
            <input type="hidden" id="buildingId" name="buildingId" />
            <input type="hidden" id="unitId" name="unitId" />
            <input type="hidden" id="houseId" name="houseId" />
            <input type="hidden" id="sampleId" name="sampleId" />
            <SCRIPT LANGUAGE="JavaScript" type="">
                var estateThead = new Array(
                        new XThead("楼盘名称")
                );
                var estateXTable = new XTable("estate", estateThead);
                estateXTable.XTbodyArray = function (model) {
                    var href = "<a href='javascript:void(0)' onclick=getBuildingList('" + model.estateId + "')>" + model.estateName + "<br>";
                    href += model.districtName + " " + model.estateAlias + "<br>";
                    href += model.estateAddress + "</a>";
                    var array = new Array(
                            new XTbody("estate", href)
                    );
                    return array;
                }
                estateXTable.getXList = function (page){
                    var estate = dwr.util.getFormValues("estateForm");
                    estate.pageIndex = (page - 1) * this.pageSize;
                    estate.pageSize = this.pageSize;
                    EstateService.queryDcEstate(estate, function(list){estateXTable.addTable(list);});
                }
                function selectEstatePage(){
                    var dcEstate = dwr.util.getFormValues("estateForm");
                    EstateService.countDcEstate(dcEstate, function(num){estateXTable.setTotalPage(num);});
                    return false;
                }
            </SCRIPT>
        </td>
        <td width="20%" valign="top">
            <SCRIPT LANGUAGE="JavaScript" type="">
                var buildingThead = new Array(
                        new XThead("楼栋名称"),
                        new XThead("建成年代")
                );
                var buildingXTable = new XTable("building", buildingThead, true);
                buildingXTable.XTbodyArray = function (model) {
                    var href = "<a href='javascript:void(0)' onclick=\"getUnitList('" + model.buildingId + "')\">" + model.buildingName + "</a>";
                    var array = new Array(
                            new XTbody("building", href, null, null, null, "center"),
                            new XTbody("building", model.buildingPeriod, null, null, null, "center")
                    );
                    return array;
                }
                buildingXTable.getXList = function (page){
                    var building = new Building();
                    building.estateId = dwr.util.getValue("estateId");
                    BuildingService.selectBuildingList(building, function(list){buildingXTable.addTable(list);});
                }
                function getBuildingList(estateId) {
                    dwr.util.setValue("estateId", estateId);
                    buildingXTable.goPage(1);
                }
            </SCRIPT>
        </td>
        <td width="20%" valign="top">
            <SCRIPT LANGUAGE="JavaScript" type="">
                var unitThead = new Array(
                        new XThead("单元")
                );
                var unitXTable = new XTable("unit", unitThead, true);
                unitXTable.XTbodyArray = function (model) {
                    var href = "<a href='javascript:void(0)' onclick=\"getHouseList('" + model.unitId + "')\">" + model.unitName + "</a>";
                    var array = new Array(
                            new XTbody("unit", href, null, null, null, "center")
                    );
                    return array;
                }
                unitXTable.getXList = function (page){
                    var unit = new Unit();
                    unit.buildingId = dwr.util.getValue("buildingId");
                    UnitService.selectUnitList(unit, function(list){unitXTable.addTable(list);});
                }
                function getUnitList(buildingId) {
                    dwr.util.setValue("buildingId", buildingId);
                    unitXTable.goPage(1);
                }
            </SCRIPT>
        </td>
        <td width="20%" valign="top">
            <SCRIPT LANGUAGE="JavaScript" type="">
                var houseThead = new Array(
                        new XThead("关联"),
                        new XThead("房间")
                );
                var houseXTable = new XTable("house", houseThead, true);
                houseXTable.XTbodyArray = function (model) {
                    var xTbodyText = model.sampleId == null ? "未绑定样点" : model.houseId;
                    var xTbodyType = model.sampleId == null ? "string" : "radio";
                    var xTbodyOnclick = model.sampleId == null ? "" : "onclick=\"updateOrder1('" + model.houseId + "','" + model.sampleId + "')\"";
                    var array = new Array(
                            new XTbody("house", xTbodyText, xTbodyType, xTbodyOnclick),
                            new XTbody("house", model.houseCode, null, null, null, "center")
                    );
                    return array;
                }
                houseXTable.getXList = function (page){
                    var house = new House();
                    house.unitId = dwr.util.getValue("unitId");
                    HouseService.selectHouseList(house, function(list){houseXTable.addTable(list);});
                }
                function getHouseList(unitId) {
                    dwr.util.setValue("unitId", unitId);
                    houseXTable.goPage(1);
                }
                function updateOrder1(houseId, sampleId) {
                    if(confirm("确认关联")) {
                        dwr.util.setValue("houseId", houseId);
                        dwr.util.setValue("sampleId", sampleId);
                        var order = new Order();
                        order.orderId = "${orderId}";
                        order.orderState = 1;
                        order.estateId = dwr.util.getValue("estateId");
                        order.buildingId = dwr.util.getValue("buildingId");
                        order.unitId = dwr.util.getValue("unitId");
                        order.houseId = dwr.util.getValue("houseId");
                        order.sampleId = dwr.util.getValue("sampleId");
                        OrderService.updateOrder(order, "", "", function () {
                            location = "${ctx}/bpm/order_list_0_1.jsp";
                        });
                    }
                }
            </SCRIPT>
        </td>
    </tr>
</table>

</body>
</html>
<script type="text/javascript">
    var order = new Order();
    order.orderId = "${orderId}";
    order.pageIndex = 1;
    order.pageSize = 1;
    OrderService.selectOrderList(order, function (list) {
        if(list.length > 0) {
            order = list[0];
            dwr.util.setValue("estateName", order.orderEstateName);
            selectEstatePage();
        }
    });
    selectProvinceList();
    function selectProvinceList() {
        var province = new Province();
        AreaService.selectProvinceList(province, callbackSelectProvinceList);
    }
    function callbackSelectProvinceList(list) {
        dwr.util.addOptions("provinceId", list, "provinceId", "provinceName");
    }
    function selectCityList() {
        var city = new City();
        city.provinceId = dwr.util.getValue("provinceId");
        AreaService.selectCityList(city, callbackSelectCityList);
    }
    function callbackSelectCityList(list) {
        dwr.util.removeAllOptions("cityId");
        var option = new Option("选择市", "");
        $("cityId").add(option);
        dwr.util.addOptions("cityId", list, "cityId", "cityName");
    }
    function selectDistrictList() {
        var district = new District();
        district.cityId = dwr.util.getValue("cityId");
        AreaService.selectDistrictList(district, callbackSelectDistrictList);
    }
    function callbackSelectDistrictList(list) {
        dwr.util.removeAllOptions("districtId");
        var option = new Option("选择区", "");
        $("districtId").add(option);
        dwr.util.addOptions("districtId", list, "districtId", "districtName");
    }


//    var autoComplete = new AutoComplete("estateName", "autoSearchDiv");

//    function search(estateName){
//        var estate = new DcEstate();
//        estate.estateName = estateName;
//        estate.pageIndex = 0;
//        estate.pageSize = 10;
//        EstateService.queryDcEstate(estate, callbackSearch);
//    }
//    function callbackSearch(list){
//        autoComplete.addDiv(list);
//    }
//    function getSearchHtml(obj) {
//        var html = "名称：" + obj.estateName + (obj.estateAlias ? "," + obj.estateAlias : "") + "<br/>" + "地址：" + obj.estateAddress;
//        return html;
//    }
//    function setObj(obj){
//        if(obj != null) {
//            dwr.util.setValue("estateName", obj.estateName);
//        } else {
//            dwr.util.setValue("estateName", "");
//            loading("数据不存在");
//        }
//    }
//    function callbackInsertEstate(estateId) {
//        alert(estateId);
//        window.location = "${ctx}/user/center_user.jsp?userId=" + userId;
//    }
</script>