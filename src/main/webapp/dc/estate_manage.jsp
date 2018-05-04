<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>楼盘管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/AreaService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">楼盘</a>
        </li>
        <li id="li2">
            <a href="#">楼盘四至</a>
        </li>
        <li id="li3">
            <a href="#">周边学校</a>
        </li>
        <li id="li4">
            <a href="#">楼盘配套</a>
        </li>
        <li id="li5">
            <a href="#">生活设施</a>
        </li>
        <li id="li6">
            <a href="#">自然环境</a>
        </li>
        <li id="li7">
            <a href="#">人文环境</a>
        </li>
        <li id="li8">
            <a href="#">商业氛围</a>
        </li>
        <li id="li9">
            <a href="#">其他信息</a>
        </li>
        <li id="li10">
            <a href="#">土地使用</a>
        </li>
        <li id="li12">
            <a href="#">商业楼盘</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:483px">
        <div class="tab-content-active">
            <form id="estateForm" name="estateForm" method="post">
                <table cellpadding="5" cellspacing="5">
                    <tr>
                        <td colspan="3">
                            <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
                            <input type="hidden" id="estateX" name="estateX" value="2" />
                            <input type="hidden" id="estateY" name="estateY" value="3" />
                            <input type="text" id="estateName" name="estateName" placeholder="楼盘名称" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="text" id="estateAlias" name="estateAlias" placeholder="楼盘别名" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input type="text" id="estateAddress" name="estateAddress" placeholder="楼盘地址" required="true" />
                        </td>
                    </tr>
                    <tr>
                        <td width="33%">
                            <select id="provinceId" name="provinceId" onchange="selectCityList()">
                                <option value="">选择省</option>
                            </select>
                        </td>
                        <td width="33%">
                            <select id="cityId" name="cityId" onchange="selectDistrictList()">
                                <option value="">选择市</option>
                            </select>
                        </td>
                        <td width="33%">
                            <select id="districtId" name="districtId" placeholder="行政区" required="true">
                                <option value="">选择区</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <img src="${ctx}/images/common/button_save.jpg" title="保存楼盘" style="cursor:pointer" onclick="submitEstate()"/>
                            <img src="${ctx}/images/common/button_delete.jpg" title="删除楼盘" style="cursor:pointer" onclick="deleteEstate()"/>
                            <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame2" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame3" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame4" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame5" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame6" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame7" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame8" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame9" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame10" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:460px">
            <iframe id="estateFrame12" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    if("${estateId}".length > 0){
        initTab();
        getEstate();
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
    function getEstate(){
        var estate = new DcEstate();
        estate.estateId = "${estateId}";
        estate.pageIndex = 0;
        estate.pageSize = 1;
        EstateService.queryDcEstate(estate, callbackQueryDcEstate);
    }
    function callbackQueryDcEstate(list){
        if(list.length > 0){
            var estate = list[0];
            setModelToForm(estate);
            dwr.util.addOptions("districtId", list, "districtId", "districtName");
            dwr.util.setValue("districtId", estate.districtId);
            $("li2").onclick = function () {
                $("estateFrame2").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=2";
            }
            $("li3").onclick = function () {
                $("estateFrame3").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=3";
            }
            $("li4").onclick = function () {
                $("estateFrame4").src = "${ctx}/template/template_value_map.jsp?fkId=${estateId}&fkType=1&templateId=4";
            }
            $("li5").onclick = function () {
                $("estateFrame5").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=5";
            }
            $("li6").onclick = function () {
                $("estateFrame6").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=6";
            }
            $("li7").onclick = function () {
                $("estateFrame7").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=7";
            }
            $("li8").onclick = function () {
                $("estateFrame8").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=8";
            }
            $("li9").onclick = function () {
                $("estateFrame9").src = "${ctx}/template/template_value_map.jsp?fkId=${estateId}&fkType=1&templateId=9";
            }
            $("li10").onclick = function () {
                $("estateFrame10").src = "${ctx}/template/template_value_list.jsp?fkId=${estateId}&fkType=1&templateId=10";
            }
            $("li12").onclick = function () {
                $("estateFrame12").src = "${ctx}/template/template_value_map.jsp?fkId=${estateId}&fkType=1&templateId=12";
            }
        }
    }

    //    var autoComplete = new AutoComplete("keyword", "autoSearchDiv");

    //    function search(keyword){
    //        var estate = new DcEstate();
    //        estate.estateName = keyword;
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
    //            dwr.util.setValue("keyword", null);
    //            setModelToForm(obj);
    //        } else {
    //            $("estateForm").reset();
    //            loading("数据不存在");
    //        }
    //    }

    function submitEstate() {
        var estateId = "${estateId}";
        if(estateId) {
            updateEstate();
        } else {
            insertEstate();
        }
    }
    function insertEstate(){
        if(validate($("estateForm"))){
            var district = new District();
            district.districtName = dwr.util.getText("districtId");
            var estate = dwr.util.getFormValues("estateForm");
            estate.district = district;
            EstateService.insertEstate(estate, callbackSubmitEstate);
        }
    }
    function updateEstate(){
        if(validate($("estateForm"))){
            var district = new District();
            district.districtName = dwr.util.getText("districtId");
            var estate = dwr.util.getFormValues("estateForm");
            estate.district = district;
            EstateService.updateEstate(estate, callbackSubmitEstate);
        }
    }
    function deleteEstate(){
        if(confirm("确定删除楼盘以及相关全部属性（有单元、样点的楼盘不能删除）")){
            var estateId = "${estateId}";
            if(!estateId){
                alert("请选择要删除的楼盘");
                return false;
            }
            var estate = new Estate();
            estate.estateId = estateId;
            EstateService.deleteEstate(estate, callback);
        }
    }
    function callbackSubmitEstate(estateId) {
        alert("保存楼盘成功");
        location = "${ctx}/dc/estate_manage.jsp?estateId=" + estateId;
    }
    function callback() {
        location = "${ctx}/dc/estate_list.jsp?estateId=${estateId}";
    }
</script>