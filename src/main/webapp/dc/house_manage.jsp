<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<c:set var="estateId" value="${param.estateId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
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
    <script type="text/javascript" src="${ctx}/dwr/interface/HouseService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/SampleService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EvaluateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<%--<%@include file="/home/logo.jsp"%>--%>
<div id="tabs-vertical" class="tabs-vertical" title="0">
    <ul>
        <li>
            <a class="tab-active" href="#">房间号</a>
        </li>
        <li id="li40">
            <a href="#">房间属性</a>
        </li>
        <li id="li41">
            <a href="#">挂接样点</a>
        </li>
        <!--li>
            <a href="#">楼栋性质</a>
        </li>
        <li>
            <a href="#">单元性质</a>
        </li>
        <li>
            <a href="#">样点户型</a>
        </li-->
        <li id="li42">
            <a href="#">特殊描述</a>
        </li>
        <li id="li43">
            <a href="#">历史评估</a>
        </li>
        <li id="li44">
            <a href="#">历史租金</a>
        </li>
        <li id="li45">
            <a href="#">商业样点</a>
        </li>
    </ul>
    <div class="tabs-content-placeholder" style="height:500px">
        <div class="tab-content-active">
            <form id="houseForm" name="houseForm" method="post">
                    <p>
                        <input type="hidden" id="estateId" name="estateId" value="${estateId}" />
                        <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
                        <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
                        <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
                        <input type="text" id="houseCode" name="houseCode" placeholder="房间号" required="true" />
                    </p>
                    <p>
                        <input type="text" id="houseY" name="houseY" placeholder="楼层" pattern="integer" required="true" />
                    </p>
                    <p>
                        <input type="text" id="houseX" name="houseX" placeholder="第几户" pattern="integer" required="true" />
                    </p>
                    <p>
                        <select id="sampleId" name="sampleId" placeholder="挂接样点" required="true">
                            <option value="">挂接样点</option>
                        </select>
                        <select id="houseState" name="houseState">
                            <option value="0">无效</option>
                            <option value="1">有效</option>
                        </select>
                    </p>
                    <p>
                        <img src="${ctx}/images/common/button_save.jpg" title="保存房间" style="cursor:pointer" onclick="submitHouse()"/>
                        <img src="${ctx}/images/common/button_delete.jpg" title="删除房间" style="cursor:pointer" onclick="deleteHouse()"/>
                        <img src="${ctx}/images/common/button_copy.jpg" title="复制" style="cursor:pointer" onclick="location='${ctx}/dc/house_paste.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}'"/>
                        <img src="${ctx}/images/common/button_value.jpg" title="计算" style="cursor:pointer" onclick="cost()"/>
                        <img src="${ctx}/images/common/button_back.jpg" title="返回" style="cursor:pointer" onclick="callback()"/>
                    </p>
            </form>
        </div>
        <div style="height:500px">
            <iframe id="houseFrame40" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame41" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <!--div style="height:500px">
            <iframe src="${ctx}/template/template_column.jsp?fkId=${buildingId}&fkType=5&templateId=21&columnIds=3,4,6,10" width="100%" height="520" frameborder="0">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe src="${ctx}/template/template_column.jsp?fkId=${unitId}&fkType=5&templateId=31&columnIds=2,3" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:415px">
            <iframe src="${ctx}/template/template_value_list.jsp?fkId=${houseId}&fkType=5&templateId=46" width="100%" height="600" frameborder="0">
            </iframe>
        </div-->
        <div style="height:500px">
            <iframe id="sampleFrame42" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame43" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame44" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
        <div style="height:500px">
            <iframe id="sampleFrame45" src="" width="100%" height="520" frameborder="0" scrolling="yes">
            </iframe>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    selectSampleList();
    if("${houseId}".length > 0){
        initTab();
    }
    function selectSampleList(){
        var sample = new Sample();
        sample.estateId = "${estateId}";
        SampleService.selectSampleList(sample, callbackSelectSampleList);
    }
    function callbackSelectSampleList(list){
        dwr.util.addOptions("sampleId", list, "sampleId", "sampleName");
        if("${houseId}".length > 0){
            selectHouseList();
        }
    }
    function selectHouseList(){
        if("${houseId}".length > 0){
            var house = new House();
            house.houseId = "${houseId}";
            HouseService.selectHouseList(house, callbackSelectHouseList);
        }
    }
    function callbackSelectHouseList(list){
        var house = list[0];
        setModelToForm(house);
        var sampleId = house.sampleId;
        $("li40").onclick = function () {
            $("houseFrame40").src = "${ctx}/template/template_value_map.jsp?fkId=${houseId}&fkType=4&templateId=40";
        }
        $("li41").onclick = function () {
            $("sampleFrame41").src = "${ctx}/template/template_column_map.jsp?fkId=" + sampleId + "&fkType=5&templateId=41";
        }
        $("li42").onclick = function () {
            $("sampleFrame42").src = "${ctx}/template/template_column_list.jsp?fkId=" + sampleId + "&fkType=5&templateId=42";
        }
        $("li43").onclick = function () {
            $("sampleFrame43").src = "${ctx}/template/template_column_list.jsp?fkId=" + sampleId + "&fkType=5&templateId=43";
        }
        $("li44").onclick = function () {
            $("sampleFrame44").src = "${ctx}/template/template_column_list.jsp?fkId=" + sampleId + "&fkType=5&templateId=44";
        }
        $("li45").onclick = function () {
            $("sampleFrame45").src = "${ctx}/template/template_column_map.jsp?fkId=" + sampleId + "&fkType=5&templateId=45";
        }
    }
    function submitHouse(){
        var houseId = "${houseId}";
        if(houseId.length > 0) {
            updateHouse();
        } else {
            insertHouse();
        }
    }
    function insertHouse(){
        if(validate($("houseForm"))){
            var house = dwr.util.getFormValues("houseForm");
            HouseService.insertHouse(house, callback);
        }
    }
    function updateHouse(){
        if(validate($("houseForm"))){
            var house = dwr.util.getFormValues("houseForm");
            HouseService.updateHouse(house, "${houseId}", callback);
        }
    }
    function deleteHouse(){
        if(confirm("确定删房间以及相关全部属性")){
            var houseId = "${houseId}";
            if(!houseId){
                alert("请选择要删除的楼栋");
                return false;
            }
            var house = new House();
            house.houseId = houseId;
            house.unitId = "${unitId}";
            HouseService.deleteHouse(house, callback);
        }
    }
    
    function cost() {
        var house = new House();
        house.houseId = "${houseId}";
        house.unitId = "${unitId}";
        house.sampleId = dwr.util.getValue("sampleId");
        EvaluateService.selectCostList(house, callbackSelectCostList);
    }
    function callbackSelectCostList(result) {
        var cost = result[0];
        var profit = result[1];
        var person = result[2];
        var enterprise = result[3];
        location = "${ctx}/dc/sample_value_manage.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}&houseId=${houseId}&sampleId=" + dwr.util.getValue("sampleId") + "&costValue=" + cost + "&personValue=" + person;
    }
    function callback() {
        location = "${ctx}/dc/unit_list.jsp?estateId=${estateId}&buildingId=${buildingId}&unitId=${unitId}";
    }
</script>