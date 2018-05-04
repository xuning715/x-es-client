<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title></title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/AreaService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/PartService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/ParamService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/BuildingService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderEvaluateForm" name="orderEvaluateForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderEvaluate()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="sampleId" value="${sampleId}" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td colspan="5">
                <input type="radio" id="remarkUse1" name="remarkUse" value="个人所有" onchange="checkRemarkUse1(this)" checked>
                <label for="remarkUse1">个人所有</label>
                <input type="radio" id="remarkUse2" name="remarkUse" value="企业所有" onchange="checkRemarkUse2(this)">
                <label for="remarkUse2">企业所有</label>
            </td>
        </tr>
        <tr>
            <td>归类</td>
            <td>属性</td>
            <td>查勘端</td>
            <td>数据中心</td>
            <td>估价师</td>
        </tr>
        <tr>
            <td rowspan="3">收益法<br>成本法<br>市场法</td>
            <td>建筑面积</td>
            <td></td>
            <td id="template40Column2"></td>
            <td>
                <input type="number" step="0.01" id="evaluateTemplate40Column2" name="evaluateTemplate40Column2" />
            </td>
        </tr>
        <tr>
            <td>建成年代</td>
            <td id="orderTemplate21Column4"></td>
            <td id="template21Column4"></td>
            <td>
                <input type="number" step="1" id="evaluateTemplate21Column4" name="evaluateTemplate21Column4" />
            </td>
        </tr>
        <tr>
            <td>样点类型</td>
            <td></td>
            <td id="useName"></td>
            <td>
                <select id="evaluateUse" name="evaluateUse">
                </select>
            </td>
        </tr>
        <tr>
            <td rowspan="8">收益法<br>成本法</td>
            <td>房屋结构</td>
            <td></td>
            <td id="template21Column6"></td>
            <td>
                <select id="evaluateTemplate21Column6" name="evaluateTemplate21Column6">
                </select>
            </td>
        </tr>
        <tr>
            <td>是否商住两用</td>
            <td></td>
            <td id="template41Column1"></td>
            <td>
                <select id="evaluateTemplate41Column1" name="evaluateTemplate41Column1">
                </select>
            </td>
        </tr>
        <tr>
            <td>行政区</td>
            <td></td>
            <td id="districtName"></td>
            <td>
                <select id="evaluateDistrict" name="evaluateDistrict">
                </select>
            </td>
        </tr>
        <tr>
            <td>土地基础设施</td>
            <td id="orderTemplate21Column13"></td>
            <td id="template4Column20"></td>
            <td id="evaluateTemplate4Column20Td">
            </td>
        </tr>
        <tr>
            <td>建筑形式</td>
            <td id="orderTemplate31Column2"></td>
            <td id="template31Column2"></td>
            <td>
                <select id="evaluateTemplate31Column2" name="evaluateTemplate31Column2">
                </select>
            </td>
        </tr>
        <tr>
            <td>户型结构</td>
            <td id="orderTemplate41Column20"></td>
            <td id="template41Column20"></td>
            <td>
                <select id="evaluateTemplate41Column20" name="evaluateTemplate41Column20">
                </select>
            </td>
        </tr>
        <tr>
            <td>容积率</td>
            <td></td>
            <td id="template4Column10"></td>
            <td>
                <input type="number" step="0.01" id="evaluateTemplate4Column10" name="evaluateTemplate4Column10">
            </td>
        </tr>
        <tr>
            <td>容积率来源</td>
            <td></td>
            <td id="template4Column11"></td>
            <td>
                <input type="text" id="evaluateTemplate4Column11" name="evaluateTemplate4Column11">
            </td>
        </tr>
        <tr>
            <td>收益法</td>
            <td>土地使用终止日期</td>
            <td></td>
            <td id="template10Column3"></td>
            <td>
                <input type="date" id="evaluateTemplate10Column3" name="evaluateTemplate10Column3" onkeypress="return false">
            </td>
        </tr>
        <tr>
            <td rowspan="9">成本法</td>
            <td>地下建筑面积</td>
            <td></td>
            <td id="template40Column11"></td>
            <td>
                <input type="number" step="0.01" id="evaluateTemplate40Column11" name="evaluateTemplate40Column11">
            </td>
        </tr>
        <tr>
            <td>所在楼层</td>
            <td id="orderTemplate40Column1"></td>
            <td id="template40Column1"></td>
            <td>
                <input type="number" step="1" id="evaluateTemplate40Column1" name="evaluateTemplate40Column1">
            </td>
        </tr>
        <tr>
            <td>地级</td>
            <td></td>
            <td id="levelName"></td>
            <td>
                <select id="evaluateLevel" name="evaluateLevel">
                </select>
            </td>
        </tr>
        <tr>
            <td>区片</td>
            <td></td>
            <td id="partName"></td>
            <td>
                <select id="evaluatePart" name="evaluatePart">
                </select>
            </td>
        </tr>
        <tr>
            <td>土地使用起始日期</td>
            <td></td>
            <td id="template10Column2"></td>
            <td>
                <input type="date" id="evaluateTemplate10Column2" name="evaluateTemplate10Column2" onkeypress="return false">
            </td>
        </tr>
        <tr>
            <td>因素修正指标</td>
            <td></td>
            <td id="template4Column14"></td>
            <td>
                <select id="evaluateTemplate4Column14" name="evaluateTemplate4Column14">
                </select>
            </td>
        </tr>
        <tr>
            <td>地下空间修正系数</td>
            <td></td>
            <td id="template41Column31"></td>
            <td>
                <select id="evaluateTemplate41Column31" name="evaluateTemplate41Column31">
                </select>
            </td>
        </tr>
        <tr>
            <td>总楼层</td>
            <td id="orderTemplate31Column3"></td>
            <td id="template31Column3"></td>
            <td>
                <input type="number" step="1" id="evaluateTemplate31Column3" name="evaluateTemplate31Column3">
            </td>
        </tr>
        <tr>
            <td>基准地价</td>
            <td></td>
            <td id="param109"></td>
            <td>
                <input type="number" step="1" id="evaluateParam109" name="evaluateParam109">
            </td>
        </tr>
        <tr>
            <td>市<br>调<br>信<br>息</td>
            <td colspan="4">
                <textarea id="evaluateSdxx" name="evaluateSdxx" style="width: 98%; height: 100px;" maxlength="200"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <table border="0" cellspacing="0" cellpadding="0" style="font-size: 15px;">
                    <tr>
                        <td>案例</td>
                        <td>楼层</td>
                        <td>面积</td>
                        <td>月租金</td>
                        <td>日期</td>
                        <td>特殊情况</td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="evaluateCaseEstate1" name="evaluateCaseEstate1">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseFloor1" name="evaluateCaseFloor1">
                        </td>
                        <td>
                            <input type="number" step="0.01" id="evaluateCaseArea1" name="evaluateCaseArea1">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseRent1" name="evaluateCaseRent1">
                        </td>
                        <td>
                            <input type="date" id="evaluateCaseDate1" name="evaluateCaseDate1" onkeypress="return false">
                        </td>
                        <td>
                            <input type="text" id="evaluateCaseSpec1" name="evaluateCaseSpec1">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="evaluateCaseEstate2" name="evaluateCaseEstate2">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseFloor2" name="evaluateCaseFloor2">
                        </td>
                        <td>
                            <input type="number" step="0.01" id="evaluateCaseArea2" name="evaluateCaseArea2">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseRent2" name="evaluateCaseRent2">
                        </td>
                        <td>
                            <input type="date" id="evaluateCaseDate2" name="evaluateCaseDate2" onkeypress="return false">
                        </td>
                        <td>
                            <input type="text" id="evaluateCaseSpec2" name="evaluateCaseSpec2">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="evaluateCaseEstate3" name="evaluateCaseEstate3">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseFloor3" name="evaluateCaseFloor3">
                        </td>
                        <td>
                            <input type="number" step="0.01" id="evaluateCaseArea3" name="evaluateCaseArea3">
                        </td>
                        <td>
                            <input type="number" step="1" id="evaluateCaseRent3" name="evaluateCaseRent3">
                        </td>
                        <td>
                            <input type="date" id="evaluateCaseDate3" name="evaluateCaseDate3" onkeypress="return false">
                        </td>
                        <td>
                            <input type="text" id="evaluateCaseSpec3" name="evaluateCaseSpec3">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <button type="submit" style="width: 100%;">保存</button>
            </td>
        </tr>
    </table>
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td>市调出售<br>案例截图</td>
            <td>
                <input type="file" id="orderImages36" name="orderImages36" accept="image/jpeg,image/png,image/jpg" onchange="preview(this, 'orderImages36PreviewDiv', 36)" multiple>
                <div id="orderImages36PreviewDiv" style="text-align: center"></div>
                <hr>
                <div id="orderImages36Div" style="text-align: center"></div>
            </td>
            <td align="center">
                <button type="button" onclick="insertOrderImage(36)">保存</button>
            </td>
        </tr>
        <tr>
            <td>市调出租<br>案例截图</td>
            <td>
                <input type="file" id="orderImages37" name="orderImages37" accept="image/jpeg,image/png,image/jpg" onchange="preview(this, 'orderImages37PreviewDiv', 37)" multiple>
                <div id="orderImages37PreviewDiv" style="text-align: center"></div>
                <hr>
                <div id="orderImages37Div" style="text-align: center"></div>
            </td>
            <td align="center">
                <button type="button" onclick="insertOrderImage(37)">保存</button>
            </td>
        </tr>
    </table>
    <br />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td>物业名称</td>
            <td id="estateName"></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td>单价(元/㎡)</td>
            <td></td>
            <td>
                <input type="number">
            </td>
            <td>
                <input type="number">
            </td>
            <td>
                <input type="number">
            </td>
        </tr>
        <tr>
            <td>交易日期</td>
            <td>
                <input type="date" id="orderSurveyedTime" name="orderSurveyedTime" onkeypress="return false">
            </td>
            <td>
                <input type="date" onkeypress="return false">
            </td>
            <td>
                <input type="date" onkeypress="return false">
            </td>
            <td>
                <input type="date" onkeypress="return false">
            </td>
        </tr>
    </table>
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td colspan="9">市场因素</td>
        </tr>
        <tr>
            <td>交易情况</td>
            <td>
                <select id="jyqk" name="jyqk" onchange="setJyqk(this.id)">
                    <option value="正常">正常</option>
                    <option value="不正常">不正常</option>
                </select>
            </td>
            <td id="jyqkValue">100</td>
            <td>
                <select id="jyqk1" name="jyqk1" onchange="setJyqkValue(this.id)">
                    <option value="正常">正常</option>
                    <option value="不正常">不正常</option>
                </select>
            </td>
            <td id="jyqkValue1">100</td>
            <td>
                <select id="jyqk2" name="jyqk2" onchange="setJyqkValue(this.id)">
                    <option value="正常">正常</option>
                    <option value="不正常">不正常</option>
                </select>
            </td>
            <td id="jyqkValue2">100</td>
            <td>
                <select id="jyqk3" name="jyqk3" onchange="setJyqkValue(this.id)">
                    <option value="正常">正常</option>
                    <option value="不正常">不正常</option>
                </select>
            </td>
            <td id="jyqkValue3">100</td>
        </tr>
        <tr>
            <td>市场状况</td>
            <td>
                <select id="sczk" name="sczk" onchange="setSczk(this.id)">
                    <option>较好</option>
                    <option>好</option>
                    <option>一般</option>
                </select>
            </td>
            <td id="sczkValue">100</td>
            <td>
                <select id="sczk1" name="sczk1" onchange="setSczkValue(this.id)">
                    <option>较好</option>
                    <option>好</option>
                    <option>一般</option>
                </select>
            </td>
            <td id="sczkValue1">100</td>
            <td>
                <select id="sczk2" name="sczk2" onchange="setSczkValue(this.id)">
                    <option>较好</option>
                    <option>好</option>
                    <option>一般</option>
                </select>
            </td>
            <td id="sczkValue2">100</td>
            <td>
                <select id="sczk3" name="sczk3" onchange="setSczkValue(this.id)">
                    <option>较好</option>
                    <option>好</option>
                    <option>一般</option>
                </select>
            </td>
            <td id="sczkValue3">100</td>
        </tr>
    </table>
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td colspan="14">实物因素</td>
        </tr>
        <tr>
            <td colspan="14">权益因素</td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    var use = new Use();
    UseService.selectUseList(use, function (list) {
        dwr.util.addOptions("evaluateUse", list, "useName", "useName");
        var templateColumnEnum = new TemplateColumnEnum();
        templateColumnEnum.templateId = 21;
        templateColumnEnum.columnId = 6;
        TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
            dwr.util.addOptions("evaluateTemplate21Column6", list, "enumValue", "enumValue");
            templateColumnEnum.templateId = 41;
            templateColumnEnum.columnId = 1;
            TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                dwr.util.addOptions("evaluateTemplate41Column1", list, "enumValue", "enumValue");
                templateColumnEnum.templateId = 31;
                templateColumnEnum.columnId = 2;
                TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                    dwr.util.addOptions("evaluateTemplate31Column2", list, "enumValue", "enumValue");
                    templateColumnEnum.templateId = 4;
                    templateColumnEnum.columnId = 20;
                    TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                        var html = "";
                        var columnEnum;
                        var length = list.length;
                        for (var i = 0; i < length; i++) {
                            columnEnum = list[i];
                            html += "<input type='checkbox' id='evaluateTemplate4Column20" + i + "' name='evaluateTemplate4Column20' value='" + columnEnum.enumValue + "'>"
                            html += "<label for='evaluateTemplate4Column20" + i + "'>" + columnEnum.enumValue + "</label>";
                        }
                        $("evaluateTemplate4Column20Td").innerHTML = html;
                        templateColumnEnum.templateId = 41;
                        templateColumnEnum.columnId = 20;
                        TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                            dwr.util.addOptions("evaluateTemplate41Column20", list, "enumValue", "enumValue");
                            templateColumnEnum.templateId = 4;
                            templateColumnEnum.columnId = 14;
                            TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                                dwr.util.addOptions("evaluateTemplate4Column14", list, "enumValue", "enumValue");
                                templateColumnEnum.templateId = 41;
                                templateColumnEnum.columnId = 31;
                                TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){
                                    dwr.util.addOptions("evaluateTemplate41Column31", list, "enumValue", "enumValue");
                                    var district = new District();
                                    district.cityId = "110100";
                                    AreaService.selectDistrictList(district, function (list) {
                                        dwr.util.addOptions("evaluateDistrict", list, "districtName", "districtName");
                                        var level = new Level();
                                        PartService.selectLevelList(level, function (list) {
                                            dwr.util.addOptions("evaluateLevel", list, "levelName", "levelName");
                                            var part = new Part();
                                            PartService.selectPartList(part, function (list) {
                                                dwr.util.addOptions("evaluatePart", list, "partName", "partName");
                                                ////////////////////////////////////////////////
                                                if("${estateId}".length > 0) {
                                                    var estate = new Estate();
                                                    estate.estateId = "${estateId}";
                                                    EstateService.selectEstateList(estate, function (list) {
                                                        if (list.length > 0) {
                                                            estate = list[0];
                                                            dwr.util.setValue("districtName", estate.district.districtName);
                                                            dwr.util.setValue("evaluateDistrict", estate.district.districtName);
                                                            dwr.util.setValue("estateName", estate.estateName);
                                                        }
                                                        if("${sampleId}".length > 0) {
                                                            var sample = new Sample();
                                                            sample.sampleId = "${sampleId}";
                                                            SampleService.selectSampleList(sample, function (list) {
                                                                if (list.length > 0) {
                                                                    sample = list[0];
                                                                    dwr.util.setValue("levelName", sample.part.level.levelName);
                                                                    dwr.util.setValue("evaluateLevel", sample.part.level.levelName);
                                                                    dwr.util.setValue("partName", sample.part.partName);
                                                                    dwr.util.setValue("evaluatePart", sample.part.partName);
                                                                    dwr.util.setValue("useName", sample.use.useName);
                                                                    dwr.util.setValue("evaluateUse", sample.useId);
                                                                }
                                                                var param109 = new Param109();
                                                                param109.partId = sample.partId;
                                                                param109.useId = sample.useId;
                                                                ParamService.selectParam109(param109, function (list) {
                                                                    if (list.length > 0) {
                                                                        param109 = list[0];
                                                                        dwr.util.setValue("param109", param109.value);
                                                                        dwr.util.setValue("evaluateParam109", param109.value);
                                                                    }
                                                                    if("${orderId}".length > 0) {
                                                                        var order = new Order();
                                                                        order.orderId = "${orderId}";
                                                                        OrderService.selectOrderList(order, function (list) {
                                                                            order = list[0];
                                                                            dwr.util.setValue("orderSurveyedTime", order.orderSurveyedTime.substring(0, 10));
                                                                        });
                                                                        var orderBuildingUnit = new OrderBuildingUnit();
                                                                        orderBuildingUnit.orderId = "${orderId}";
                                                                        OrderService.selectOrderBuildingUnitList(orderBuildingUnit, function (list) {
                                                                            if(list.length > 0) {
                                                                                orderBuildingUnit = list[0];
                                                                                dwr.util.setValue("orderTemplate21Column4", orderBuildingUnit.template21Column4);
                                                                                dwr.util.setValue("orderTemplate21Column13", orderBuildingUnit.template21Column13);
                                                                                dwr.util.setValue("orderTemplate31Column2", orderBuildingUnit.template31Column2);
                                                                                dwr.util.setValue("orderTemplate40Column1", orderBuildingUnit.template40Column1);
                                                                                dwr.util.setValue("orderTemplate31Column3", orderBuildingUnit.template31Column3);
                                                                            }
                                                                            var orderHouse = new OrderHouse();
                                                                            orderHouse.orderId = "${orderId}";
                                                                            OrderService.selectOrderHouseList(orderHouse, function (list) {
                                                                                if (list.length > 0) {
                                                                                    orderHouse = list[0];
                                                                                    dwr.util.setValue("orderTemplate41Column20", orderBuildingUnit.template41Column20);
                                                                                }
                                                                                if("${buildingId}".length > 0) {
                                                                                    var building = new Building();
                                                                                    building.buildingId = "${buildingId}";

                                                                                    BuildingService.selectBuildingList(building, function (list) {
                                                                                        building = list[0];
                                                                                        setModelToForm(building);
                                                                                    });

                                                                                    var templateValue = new TemplateValue();
                                                                                    var templateValueFk = new TemplateValueFk();

                                                                                    templateValue.templateId = 21;
                                                                                    templateValueFk.fkId = "${buildingId}";
                                                                                    templateValueFk.fkType = 2;
                                                                                    TemplateService.selectTemplateValueList(templateValue, templateValueFk, 18, function (list) {
                                                                                        setTemplateValue(list);
                                                                                        templateValue.templateId = 4;
                                                                                        templateValueFk.fkId = "${estateId}";
                                                                                        templateValueFk.fkType = 1;
                                                                                        TemplateService.selectTemplateValueList(templateValue, templateValueFk, 23, function (list) {
                                                                                            setTemplateValue(list);
                                                                                            templateValue.templateId = 10;
                                                                                            templateValueFk.fkId = "${estateId}";
                                                                                            templateValueFk.fkType = 1;
                                                                                            TemplateService.selectTemplateValueList(templateValue, templateValueFk, 3, function (list) {
                                                                                                setTemplateValue(list);
                                                                                                if("${unitId}".length > 0) {
                                                                                                    templateValue.templateId = 31;
                                                                                                    templateValueFk.fkId = "${unitId}";
                                                                                                    templateValueFk.fkType = 3;
                                                                                                    TemplateService.selectTemplateValueList(templateValue, templateValueFk, 16, function (list) {
                                                                                                        setTemplateValue(list);
                                                                                                        if("${houseId}".length > 0) {
                                                                                                            templateValue.templateId = 40;
                                                                                                            templateValueFk.fkId = "${houseId}";
                                                                                                            templateValueFk.fkType = 4;
                                                                                                            TemplateService.selectTemplateValueList(templateValue, templateValueFk, 11, function (list) {
                                                                                                                setTemplateValue(list);
                                                                                                                templateValue.templateId = 41;
                                                                                                                templateValueFk.fkId = "${sampleId}";
                                                                                                                templateValueFk.fkType = 5;
                                                                                                                TemplateService.selectTemplateValueList(templateValue, templateValueFk, 31, function (list) {
                                                                                                                    setTemplateValue(list);
                                                                                                                    if("${orderId}".length > 0) {
                                                                                                                        var orderEvaluate = new OrderEvaluate();
                                                                                                                        orderEvaluate.orderId = "${orderId}";
                                                                                                                        OrderService.selectOrderEvaluateList(orderEvaluate, function (list) {
                                                                                                                            if (list.length > 0) {
                                                                                                                                orderEvaluate = list[0];
                                                                                                                                dwr.util.setValues(orderEvaluate);
                                                                                                                                dwr.util.setValue("evaluateTemplate4Column20", orderEvaluate.evaluateTemplate4Column20.split(","));
                                                                                                                            }
                                                                                                                        });
                                                                                                                    }
                                                                                                                });
                                                                                                            });
                                                                                                        }
                                                                                                    });
                                                                                                }
                                                                                            });
                                                                                        });
                                                                                    });
                                                                                }
                                                                            });
                                                                        });
                                                                    }
                                                                });
                                                            });
                                                        }
                                                    });
                                                }
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });
        });
    });

    var orderImage = new OrderImage();
    orderImage.orderId = "${orderId}";
    // orderImage.imageTypeId = "35";
    OrderService.selectOrderImageList(orderImage, function (list) {
        if (list.length > 0) {
            var html = "";
            for (var i = 0; i < list.length; i++) {
                orderImage = list[i];
                if (orderImage.imageTypeId == "36" || orderImage.imageTypeId == "37") {
                    var img = document.createElement("img");
                    img.src = "${ctx}/upload/photo/order/" + orderImage.imageTypeId + "/" + orderImage.orderId + "/" + orderImage.imageUrl;
                    img.width = 100;
                    img.height = 100;
                    img.title = "点击删除";
                    img.style.cursor = "pointer";
                    img.onclick = function () {
                        if(confirm("确认删除该图片")) {
                            var array = this.src.split("/");
                            var image = new OrderImage();
                            image.imageTypeId = array[7];
                            image.orderId = array[8];
                            image.imageUrl = array[9];
                            image.imageId = array[9].split(".")[0];
                            OrderService.deleteOrderImage(image, function (result) {
                                location.reload();
                            });
//                                                this.parentNode.removeChild(this);
                        }
                    }
                    $("orderImages" + orderImage.imageTypeId + "Div").appendChild(img);
                }
            }
        }
    });
    var base64Codes36 = "";
    var base64Codes37 = "";
    function preview(input, imgDivId, imageTypeId) {
        var files = input.files;
        for(var i = 0; i < files.length; i++){
            var tmpFile = files[i];
            var reader = new FileReader();//每循环一次都要重新new一个FileReader实例
            reader.readAsDataURL(tmpFile);
            reader.onload = function(e){
                var img = document.createElement("img");
                img.src = e.target.result;
                img.width = 100;
                img.height = 100;
                img.title = "点击删除";
                img.style.cursor = "pointer";
                img.onclick = function () {
                    if(confirm("确认删除该图片")) {
                        this.parentNode.removeChild(this);
                        if (imageTypeId == 36) {
                            base64Codes36 = base64Codes36.replace(this.src.split(",")[1] + ",", "");
                        } else if (imageTypeId == 37) {
                            base64Codes37 = base64Codes37.replace(this.src.split(",")[1] + ",", "");
                        }
                    }
                }
                $(imgDivId).appendChild(img);
                if (imageTypeId == 36) {
                    base64Codes36 += img.src.split(",")[1] + ",";
                } else if (imageTypeId == 37) {
                    base64Codes37 += img.src.split(",")[1] + ",";
                }
            };
        }
    }

    function setTemplateValue(list) {
        if(list.length > 0) {
            var model = list[0];
            for(var i = 0; i < model.length; i++) {
                var value = "";
                if(model[i].columnValueStr) {
                    value = model[i].columnValueStr;
                } else if(model[i].columnValueNum) {
                    value = model[i].columnValueNum;
                }
                var name = model[i].templateId + "Column" + model[i].columnId;
                if(value && $("template" + name)){
                    dwr.util.setValue("template" + name, value);
                    if (("evaluateTemplate" + name) == "evaluateTemplate4Column20") {
                        dwr.util.setValue("evaluateTemplate" + name, value.split(","));
                    } else if ($("evaluateTemplate" + name).type == "date") {
                        dwr.util.setValue("evaluateTemplate" + name, value.replace("/", "-").replace("/", "-"));
                    } else {
                        dwr.util.setValue("evaluateTemplate" + name, value);
                    }
                }
            }
        }
    }
    function insertOrderEvaluate() {
        var orderEvaluate = dwr.util.getFormValues("orderEvaluateForm");
        orderEvaluate.evaluateTemplate4Column20 = orderEvaluate.evaluateTemplate4Column20.join(",");
        OrderService.insertOrderEvaluate(orderEvaluate, function () {
            alert("保存成功");
        });
        return false;
    }
    function insertOrderImage(imageTypeId) {
        var orderImage = new OrderImage();
        orderImage.orderId = "${orderId}";
        orderImage.imageTypeId = imageTypeId;
        if (imageTypeId == 36) {
            orderImage.imageUrl = base64Codes36;
        } else if (imageTypeId == 37) {
            orderImage.imageUrl = base64Codes37;
        }
        OrderService.insertOrderImage(orderImage, function () {
            alert("保存成功");
            location.reload();
        });
        return false;
    }
    function setJyqk(id) {
        var jyqkValue = dwr.util.getValue(id);
        if (jyqkValue == "正常") {
            dwr.util.setValue("jyqkValue", 100);
            for (var i = 1; i <= 3; i++) {
                jyqkValue = dwr.util.getValue(id + i);
                if (jyqkValue == "正常") {
                    dwr.util.setValue("jyqkValue" + i, 100);
                } else if (jyqkValue == "不正常") {
                    dwr.util.setValue("jyqkValue" + i, 99);
                }
            }
        } else if (jyqkValue == "不正常") {
            dwr.util.setValue("jyqkValue", 100);
            for (var i = 1; i <= 3; i++) {
                jyqkValue = dwr.util.getValue(id + i);
                if (jyqkValue == "正常") {
                    dwr.util.setValue("jyqkValue" + i, 101);
                } else if (jyqkValue == "不正常") {
                    dwr.util.setValue("jyqkValue" + i, 100);
                }
            }
        }
    }
    function setSczk(id) {
        var sczkValue = dwr.util.getValue(id);
        if (sczkValue == "较好") {
            dwr.util.setValue("sczkValue", 100);
            for (var i = 1; i <= 3; i++) {
                sczkValue = dwr.util.getValue(id + i);
                if (sczkValue == "较好") {
                    dwr.util.setValue("sczkValue" + i, 100);
                } else if (sczkValue == "好") {
                    dwr.util.setValue("sczkValue" + i, 101);
                } else if (sczkValue == "一般") {
                    dwr.util.setValue("sczkValue" + i, 99);
                }
            }
        } else if (sczkValue == "好") {
            dwr.util.setValue("sczkValue", 100);
            for (var i = 1; i <= 3; i++) {
                sczkValue = dwr.util.getValue(id + i);
                if (sczkValue == "较好") {
                    dwr.util.setValue("sczkValue" + i, 99);
                } else if (sczkValue == "好") {
                    dwr.util.setValue("sczkValue" + i, 100);
                } else if (sczkValue == "一般") {
                    dwr.util.setValue("sczkValue" + i, 98);
                }
            }
        } else if (sczkValue == "一般") {
            dwr.util.setValue("sczkValue", 100);
            for (var i = 1; i <= 3; i++) {
                sczkValue = dwr.util.getValue(id + i);
                if (sczkValue == "较好") {
                    dwr.util.setValue("sczkValue" + i, 101);
                } else if (sczkValue == "好") {
                    dwr.util.setValue("sczkValue" + i, 102);
                } else if (sczkValue == "一般") {
                    dwr.util.setValue("sczkValue" + i, 100);
                }
            }
        }
    }
    function setSczkValue(id) {
        var sczkValue = dwr.util.getValue("sczk");
        var sczkValueX = dwr.util.getValue(id);
        if (sczkValue == "较好") {
            if (sczkValueX == "较好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 100);
            } else if (sczkValueX == "好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 101);
            } else if (sczkValueX == "一般") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 99);
            }
        } else if (sczkValue == "好") {
            if (sczkValueX == "较好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 99);
            } else if (sczkValueX == "好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 100);
            } else if (sczkValueX == "一般") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 98);
            }
        } else if (sczkValue == "一般") {
            if (sczkValueX == "较好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 101);
            } else if (sczkValueX == "好") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 102);
            } else if (sczkValueX == "一般") {
                dwr.util.setValue(id.substring(0, 4) + "Value" + id.substring(4), 100);
            }
        }
    }
</script>