<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="openId" value="${param.openId}" />
<c:set var="estateId" value="${param.estateId}" />
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
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<form id="estateForm" name="estateForm" method="post" onsubmit="return selectEstatePage()">
    <table cellspacing="5" cellpadding="5">
        <tr>
            <td colspan="4">
                <input type="search" id="estateName" name="estateName" placeholder="查重：名称/别名/地址" />
            </td>
        </tr>
        <tr>
            <td width="25%">
                <select id="provinceId" name="provinceId" onchange="selectCityList()">
                    <option value="">选择省</option>
                </select>
            </td>
            <td width="25%">
                <select id="cityId" name="cityId" onchange="selectDistrictList()">
                    <option value="">选择市</option>
                </select>
            </td>
            <td width="25%">
                <select id="districtId" name="districtId">
                    <option value="">选择区</option>
                </select>
            </td>
            <td width="25%">
                <img src="${ctx}/images/common/button_select.jpg" title="查询楼盘" style="cursor:pointer" onclick="selectEstatePage()"/>
                <img src="${ctx}/images/common/button_insert.jpg" title="添加楼盘" style="cursor:pointer" onclick="location='${ctx}/dc/estate_manage.jsp'"/>
            </td>
        </tr>
    </table>
</form>
<SCRIPT LANGUAGE="JavaScript" type="">
    var estateThead = new Array(
            //new XThead("选择", "radio"),
            new XThead("楼盘名称"),
            new XThead("楼盘别名"),
            new XThead("楼盘地址"),
            new XThead("楼盘行政区"),
            new XThead("操作")
    );

    var estateXTable = new XTable("estate", estateThead);

    estateXTable.XTbodyArray = function (model) {
        var array = new Array(
                //new XTbody("estate", model.estateId, "radio", "onclick='setEstate(this)'", model),
                new XTbody("estate", "<a href='${ctx}/dc/estate_manage.jsp?estateId=" + model.estateId + "'>" + model.estateName + "</a>"),
                new XTbody("estate", model.estateAlias),
                new XTbody("estate", model.estateAddress),
                new XTbody("estate", model.districtName, null, null, null, "center"),
                new XTbody("estate", "<a href='${ctx}/dc/estate_manage.jsp?estateId=" + model.estateId + "'>楼盘</a> | <a href='building_list.jsp?estateId=" + model.estateId + "'>楼栋</a> | <a href='sample_list.jsp?estateId=" + model.estateId + "'>样点</a>", null, null, null, "center")
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
</body>
</html>
<script type="text/javascript">
    if("${estateId}".length > 0){
        var estate = new Estate();
        estate.estateId = "${estateId}";
        EstateService.selectEstateList(estate, callbackSelectEstateList);
    } else {
        selectEstatePage();
    }
    function callbackSelectEstateList(list){
        var estate = list[0];
        dwr.util.setValue("estateName", estate.estateName);
        selectEstatePage();
    }
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