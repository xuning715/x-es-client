<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="sampleId" value="${param.sampleId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseIds" value="${param.houseIds}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>房间管理</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <link rel="stylesheet" href="${ctx}/css/tabs-vertical.css"/>
    <script type="text/javascript" src="${ctx}/js/tabs-vertical.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">批量挂接样点</a>
        </li>
        <li>
            <a href="#">批量修改状态</a>
        </li>
        <li>
            <a href="#">批量修改面积</a>
        </li>
        <li>
            <a href="#">批量修改用途</a>
        </li>
        <li>
            <a href="#">批量删除房间</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active">
            <form id="houseSampleForm" name="houseSampleForm" method="post">
                    <p>
                        <select id="sampleId" name="sampleId" required="true" placeholder="挂接样点">
                            <option value="">挂接样点</option>
                        </select>
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_join.jpg" title="挂接" style="cursor:pointer" onclick="updateHouseSample()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <form id="houseStateForm" name="houseStateForm" method="post">
                    <p>
                        <select id="houseState" name="houseState" required="true" placeholder="房间状态">
                            <option value="0">无效</option>
                            <option value="1">有效</option>
                        </select>
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_update.jpg" title="修改房间状态" style="cursor:pointer" onclick="updateHouseState()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <form id="houseAreaForm" name="houseAreaForm" method="post">
                    <p id="houseTemplateColumnSpan1">
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_update.jpg" title="修改建筑面积" style="cursor:pointer" onclick="updateHouseArea()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <form id="houseUseForm" name="houseUseForm" method="post">
                    <p class="" id="houseTemplateColumnSpan2">
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_update.jpg" title="修改设计用途" style="cursor:pointer" onclick="updateHouseUse()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <form id="houseUseForm" name="houseUseForm" method="post">
                    <p>
                        <img src="${ctx}/images/common/button_delete.jpg" title="删除房间" style="cursor:pointer" onclick="deleteHouse()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    initTab();
    selectSampleList();
    selectTemplateColumn();

    function selectSampleList(){
        var sample = new Sample();
        sample.estateId = "${estateId}";
        SampleService.selectSampleList(sample, callbackSelectSampleList);
    }

    function callbackSelectSampleList(list){
        dwr.util.addOptions("sampleId", list, "sampleId", "sampleName");
    }

    function selectTemplateColumn(){
        var templateId = 40;
        var templateColumn = new TemplateColumn();
        templateColumn.templateId = templateId;
        templateColumn.columnId = 2;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn1);
        templateColumn.columnId = 5;
        TemplateService.selectTemplateColumn(templateColumn, callbackSelectTemplateColumn4);
    }

    function callbackSelectTemplateColumn1(list){
        for(var i = 0; i < list.length; i++){
            addTemplateColumnTable(list[i], 1);
        }
    }

    function callbackSelectTemplateColumn4(list){
        for(var i = 0; i < list.length; i++){
            addTemplateColumnTable(list[i], 2);
        }
    }

    function addTemplateColumnTable(templateColumn, index){
        var span = $("houseTemplateColumnSpan" + index);
        var spanHtml =
        templateColumn.columnType == "enum"
        ?
        createInput("radio", templateColumn)
        :
        templateColumn.columnType == "enums"
        ?
        createInput("checkbox", templateColumn)
        :
        templateColumn.columnType == "file"
        ?
        "<INPUT " +
        "id='" + templateColumn.columnId + "' " +
        "name='" + templateColumn.columnId + "' " +
        "title='" + templateColumn.columnType + "' " +
        "type='file' " +
        "accept='image/jpeg,image/png,image/jpg' " + 
        "multiple='multiple' " +
        "/ >"
        :
        "<INPUT " +
        "id='" + templateColumn.columnId + "' " +
        "name='" + templateColumn.columnId + "' " +
        "type='" + (templateColumn.columnType == "date" ? "date" : "text") + "' " +
        "title='" + templateColumn.columnType + "' " +
        "placeholder='" + (templateColumn.columnNotNull == 1 ? "必填 " : "") + templateColumn.columnName + "' " +
        (templateColumn.columnNotNull == 1 ? "required='true' " : "") + 
        "pattern='" + (templateColumn.columnType == "string" || templateColumn.columnType == "date" || templateColumn.columnType == "enum" || templateColumn.columnType == "enums" ? "string" : templateColumn.columnType) + "' " + 
        (templateColumn.columnType == "date" ? "onkeypress='return false' " : "") + 
        "/>";
        span.innerHTML = spanHtml;
    }

    function createInput(type, templateColumn){
        var html = "";
        var templateColumnEnumList = templateColumn.templateColumnEnumList;
        if(templateColumnEnumList.length > 0){
            var templateColumnEnum;
            for(var i = 0; i < templateColumnEnumList.length; i++){
                templateColumnEnum = templateColumnEnumList[i];
                html += "<INPUT id='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "' ";
                html += "name='" + templateColumnEnum.columnId + "' ";
                html += "type='" + type + "' ";
                html += "title='" + templateColumn.columnType + "' ";
                html += "pattern='string' ";
                html += "required='true' "; 
                html += "placeholder=" + (i == 0 ? "'设计用途' " : "'' "); 
                html += "value='" + templateColumnEnum.enumValue + "' ";
                html += "ondblclick='this.checked = false'/>";
                html += "<LABEL for='" + templateColumnEnum.templateId + "-" + templateColumnEnum.columnId + "-" + templateColumnEnum.enumId + "'>" + templateColumnEnum.enumValue + "</LABEL>";
            }
        }
        return html;
    }

    function updateHouseSample(){
        if(validate($("houseSampleForm"))){
            var houseIds ="${houseIds}";
            var house = new House();
            house.sampleId = dwr.util.getValue("sampleId");
            HouseService.updateHouse(house, houseIds, callback);
        }
    }

    function updateHouseState(){
        if(validate($("houseStateForm"))){
            var houseIds ="${houseIds}";
            var house = new House();
            house.houseState = dwr.util.getValue("houseState");
            HouseService.updateHouse(house, houseIds, callback);
        }
    }

    function updateHouseArea(){
        if(validate($("houseAreaForm"))){
            var houseIds ="${houseIds}";
            var templateId = 40;
            var columnId = 2;
            var name = $("houseTemplateColumnSpan1").children[0].name;
            var value = dwr.util.getValue(name);
            var templateValue = new TemplateValue();
            templateValue.templateId = templateId;
            templateValue.columnId = columnId;
            templateValue.columnValueNum = value;
            TemplateService.updateBatchTemplateValue(templateValue, houseIds, 4, callback);
        }
    }

    function updateHouseUse(){
        if(validate($("houseUseForm"))){
            var houseIds ="${houseIds}";
            var templateId = 40;
            var columnId = 5;
            var name = $("houseTemplateColumnSpan2").children[0].name;
            var value = dwr.util.getValue(name);
            var templateValue = new TemplateValue();
            templateValue.templateId = templateId;
            templateValue.columnId = columnId;
            templateValue.columnValueStr = value;
            TemplateService.updateBatchTemplateValue(templateValue, houseIds, 4, callback);
        }
    }

    function deleteHouse(){
        if(confirm("确定批量删房间以及相关全部属性")){
            var house = new House();
            house.houseId = "${houseIds}";
            house.unitId = "${unitId}";
            HouseService.deleteHouse(house, callback);
        }
    }

    function callback() {
        if("${sampleId}".length > 0){
            location = "${ctx}/dc/sample_house_list.jsp?estateId=${estateId}&sampleId=${sampleId}";
        } else {
            location = "${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}";
        }
    }
</script>