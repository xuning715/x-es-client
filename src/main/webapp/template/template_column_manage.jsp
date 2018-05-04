<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglibs.jsp"%>
<html>
<head>
    <LINK type="text/css" rel="stylesheet" href="${ctx}/css/style.css"/>
    <LINK type="text/css" rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/validator.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
    <title>模版管理</title>
</head>
<body onload="init()">
<table>
    <tr>
        <td align="center" valign="top" style="width:30%" nowrap>
            <form id="templateForm" name="templateForm" action="">
                模版编号：
                <input type="text" id="templateId" name="templateId"/>
                <br/><br/>
                模版名称：
                <input type="text" id="templateName" name="templateName"/>
                <br/><br/>
                模版描述：
                <input type="text" id="templateRemark" name="templateRemark"/>
                <br/><br/>
                <img src="${ctx}/images/common/button_insert.jpg" title="添加模板" style="cursor:pointer" onclick="insertTemplate()"/>
                <img src="${ctx}/images/common/button_update.jpg" title="修改模板" style="cursor:pointer" onclick="updateTemplate()"/>
                <img src="${ctx}/images/common/button_delete.jpg" title="删除模板" style="cursor:pointer" onclick="deleteTemplate()"/>
                <br/><br/>
            </form>
            <SCRIPT LANGUAGE="JavaScript" type="">
                var templateXThead = new Array(
                        new XThead("选择", "radio"),
                        new XThead("模版编号"),
                        new XThead("模版名称"),
                        new XThead("模版描述")
                );

                var templateXTable = new XTable("template", templateXThead, true);

                templateXTable.XTbodyArray = function (model) {
                    var array = new Array(
                            new XTbody("template", model.templateId, "radio", "onclick='setTemplate(this)'", model),
                            new XTbody("template", model.templateId),
                            new XTbody("template", model.templateName),
                            new XTbody("template", model.templateRemark)
                    );
                    return array;
                }

                templateXTable.getXList = function (page){
                    var template = new Template();
                    TemplateService.selectTemplate(template, function(list){templateXTable.addTable(list);});
                }

                function selectTemplate(){
                    templateXTable.goPage(1);
                }
            </SCRIPT>
        </td>
        <td>&nbsp;</td>
        <td valign="top">
            <form id="templateColumnForm" name="templateColumnForm" action="">
                <table>
                    <tr>
                        <td align="center" colspan="6">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            字段编号：
                        </td>
                        <td>
                            <input type="text" id="columnId" name="columnId" placeholder="字段编号" required="true" pattern="integer"/>
                        </td>
                        <td>
                            字段名称：
                        </td>
                        <td>
                            <input type="text" id="columnName" name="columnName" placeholder="字段名称" required="true"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            字段类型：
                        </td>
                        <td>
                            <select id="columnType" name="columnType">
                                <option value="string">文本</option>
                                <option value="integer">整数</option>
                                <option value="float">小数</option>
                                <option value="enum">单选</option>
                                <option value="enums">多选</option>
                                <option value="date">日期</option>
                                <option value="file">图片</option>
                            </select>
                        </td>
                        <td>
                            不可为空：
                        </td>
                        <td>
                            <select id="columnNotNull" name="columnNotNull">
                                <option value="0" selected>否</option>
                                <option value="1">是</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" colspan="4">
                            <br/><br/>
                            <img src="${ctx}/images/common/button_insert.jpg" title="添加字段" style="cursor:pointer" onclick="insertTemplateColumn()"/>
                            <img src="${ctx}/images/common/button_update.jpg" title="修改字段" style="cursor:pointer" onclick="updateTemplateColumn()"/>
                            <img src="${ctx}/images/common/button_delete.jpg" title="删除字段" style="cursor:pointer" onclick="deleteTemplateColumn()"/>
                            <br/><br/>
                        </td>
                    </tr>
                </table>
            </form>
            <SCRIPT LANGUAGE="JavaScript" type="">
                var templateColumnXThead = new Array(
                        new XThead("选择", "radio"),
                        new XThead("编号"),
                        new XThead("列名"),
                        new XThead("类型"),
                        new XThead("不空")
                );

                var templateColumnXTable = new XTable("templateColumn", templateColumnXThead, true);

                templateColumnXTable.XTbodyArray = function (model) {
                    var columnType = model.columnType;
                    if(columnType == "string") {
                        columnType = "文本";
                    } else if(columnType == "date") {
                        columnType = "日期";
                    } else if(columnType == "integer") {
                        columnType = "整数";
                    } else if(columnType == "float") {
                        columnType = "小数";
                    } else if(columnType == "enum") {
                        columnType = "<a href='#' onclick=\"getTemplateColumnEnum(" + model.columnId + ", '" + model.columnName + "')\">单选</a>";
                    } else if(columnType == "enums") {
                        columnType = "<a href='#' onclick=\"getTemplateColumnEnum(" + model.columnId + ", '" + model.columnName + "')\">多选</a>";
                    } else if(columnType == "file") {
                        columnType = "图片";
                    }
                    var array = new Array(
                            new XTbody("templateColumn", model.columnId, "radio", "onclick='setTemplateColumn(this)'", model),
                            new XTbody("templateColumn", model.columnId),
                            new XTbody("templateColumn", model.columnName),
                            new XTbody("templateColumn", columnType),
                            new XTbody("templateColumn", model.columnNotNull == 0 ? "否" : "是")
                    );
                    return array;
                }

                templateColumnXTable.getXList = function (page){
                    var templateId = templateXTable.getRadioValue();
                    var templateColumn = new TemplateColumn();
                    templateColumn.templateId = templateId;
                    TemplateService.selectTemplateColumn(templateColumn, function(list){templateColumnXTable.addTable(list);});
                }

                function selectTemplateColumn(){
                    templateColumnXTable.goPage(1);
                }
            </SCRIPT>
        </td>
    </tr>
</table>

<DIV id="templateColumnEnumDiv" name="templateColumnEnumDiv" class="DIV" align="center" style="width:400px;height:100%;display:none;position:absolute;top:150px;left:10px;;z-index:13">
    <table width="100%">
        <thead class="xThead">
            <tr>
                <td>
                    <img alt="" src="${ctx}/images/common/nav.gif"/>
                    <span id="templateColumnEnumTitle"></span>
                </td>
                <td align="right">
                    <img alt="关闭" src="${ctx}/images/common/close.gif" onclick="hiddenTemplateColumnEnumDiv()"/>
                </td>
            </tr>
        </thead>
    </table>
    <form id="templateColumnEnumForm" name="templateColumnEnumForm" action="">
        <br />
        <table>
            <tr>
                <td>
                    编号
                </td>
                <td>
                    <input type="text" id="enumId" name="enumId" placeholder="编号" required="true" pattern="integer"/>
                </td>
                <td>
                    枚举值
                </td>
                <td>
                    <input type="text" id="enumValue" name="enumValue" placeholder="枚举值"/>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <br />
                    <img src="${ctx}/images/common/button_insert.jpg" title="添加枚举值" style="cursor:pointer" onclick="insertTemplateColumnEnum()"/>
                    <img src="${ctx}/images/common/button_update.jpg" title="修改枚举值" style="cursor:pointer" onclick="updateTemplateColumnEnum()"/>
                    <img src="${ctx}/images/common/button_delete.jpg" title="删除枚举值" style="cursor:pointer" onclick="deleteTemplateColumnEnum()"/>
                    <br />
                </td>
            </tr>
        </table>
    </form>
    <SCRIPT LANGUAGE="JavaScript" type="">
        var templateColumnEnumXThead = new Array(
                new XThead("选择", "radio"),
                new XThead("编号"),
                new XThead("枚举值")
        );

        var templateColumnEnumXTable = new XTable("templateColumnEnum", templateColumnEnumXThead, true);

        templateColumnEnumXTable.XTbodyArray = function (model) {
            var array = new Array(
                    new XTbody("templateColumnEnum", model.enumId, "radio", "onclick='setTemplateColumnEnum(this)'", model),
                    new XTbody("templateColumnEnum", model.enumId),
                    new XTbody("templateColumnEnum", model.enumValue)
            );
            return array;
        }

        templateColumnEnumXTable.getXList = function (page){
            var templateId = templateXTable.getRadioValue();
            var columnId = templateColumnXTable.getRadioValue();
            var templateColumnEnum = new TemplateColumnEnum();
            templateColumnEnum.templateId = templateId;
            templateColumnEnum.columnId = columnId;
            TemplateService.selectTemplateColumnEnum(templateColumnEnum, function(list){templateColumnEnumXTable.addTable(list);});
        }

        function selectTemplateColumnEnum(){
            templateColumnEnumXTable.goPage(1);
        }
    </SCRIPT>
</DIV>

</body>
</html>
<script type="text/javascript">
function init(){
    selectTemplate();
}

function setTemplate(obj){
    var template = obj.parentElement.parentElement.model
    setModelToForm(template);
    selectTemplateColumn();
}

function insertTemplate(){
    if(validate($("templateForm"))){
        var template = dwr.util.getFormValues("templateForm");
        TemplateService.insertTemplate(template, selectTemplate);
    }
}

function updateTemplate(){
    if(validate($("templateForm"))){
        var template = dwr.util.getFormValues("templateForm");
        if(template.templateId == null){
            alert("请选择要修改的模版");
            return false;
        }
        TemplateService.updateTemplate(template, selectTemplate);
    }
}

function deleteTemplate(){
    if(confirm("确定删除选择数据")){
        var templateId = templateXTable.getRadioValue();
        if(templateId == null){
            alert("请选择要删除的模版");
            return false;
        }
        var template = new Template();
        template.templateId = templateId;
        TemplateService.deleteTemplate(template, selectTemplate);
    }
}

function setTemplateColumn(obj){
    var templateColumn = obj.parentElement.parentElement.model;
    setModelToForm(templateColumn);
}

function insertTemplateColumn(){
    if(validate($("templateColumnForm"))){
        var templateColumn = dwr.util.getFormValues("templateColumnForm");
        templateColumn.templateId = templateXTable.getRadioValue();
        if(templateColumn.templateId == null){
            alert("请选择要定制的模版");
            return false;
        }
        TemplateService.insertTemplateColumn(templateColumn, selectTemplateColumn);
    }
}

function updateTemplateColumn(){
    if(validate($("templateColumnForm"))){
        var templateColumn = dwr.util.getFormValues("templateColumnForm");
        templateColumn.templateId = templateXTable.getRadioValue();
        if(templateColumn.columnId == null){
            alert("请选择要修改的字段");
            return false;
        }
        TemplateService.updateTemplateColumn(templateColumn, selectTemplateColumn);
    }
}

function deleteTemplateColumn(){
    if(confirm("确定删除选择数据")){
        var templateId = templateXTable.getRadioValue();
        var templateColumnId = templateColumnXTable.getRadioValue();
        if(templateColumnId == null){
            alert("请选择要删除的字段");
            return false;
        }
        var templateColumn = new TemplateColumn();
        templateColumn.templateId = templateId;
        templateColumn.columnId = templateColumnId;
        TemplateService.deleteTemplateColumn(templateColumn, selectTemplateColumn);
    }
}

function getTemplateColumnEnum(columnId, columnName){
    templateColumnXTable.setRadioValue(columnId);
    selectTemplateColumnEnum();
    showTemplateColumnEnumDiv(columnName);
}

function showTemplateColumnEnumDiv(columnName){
    $("templateColumnEnumDiv").style.display = "block";
    $("templateColumnEnumTitle").innerText = columnName + "枚举值管理";
}

function hiddenTemplateColumnEnumDiv(){
    $("templateColumnEnumDiv").style.display = "none";
}

function setTemplateColumnEnum(obj){
    var templateColumnEnum = obj.parentElement.parentElement.model
    setModelToForm(templateColumnEnum);
}

function insertTemplateColumnEnum(){
    if(validate($("templateColumnEnumForm"))){
        var templateColumnEnum = dwr.util.getFormValues("templateColumnEnumForm");
        templateColumnEnum.templateId = dwr.util.getValue("templateId");
        templateColumnEnum.columnId = dwr.util.getValue("columnId");
        if(templateColumnEnum.columnId == null){
            alert("请选择要绑定的字段");
            return false;
        }
        TemplateService.insertTemplateColumnEnum(templateColumnEnum, selectTemplateColumnEnum);
    }
}

function updateTemplateColumnEnum(){
    if(validate($("templateColumnEnumForm"))){
        var templateColumnEnum = dwr.util.getFormValues("templateColumnEnumForm");
        templateColumnEnum.templateId = templateXTable.getRadioValue();
        templateColumnEnum.columnId = templateColumnXTable.getRadioValue();
        templateColumnEnum.enumId = templateColumnEnumXTable.getRadioValue();
        if(templateColumnEnum.enumId == null){
            alert("请选择要修改的枚举值");
            return false;
        }
        TemplateService.updateTemplateColumnEnum(templateColumnEnum, selectTemplateColumnEnum);
    }
}

function deleteTemplateColumnEnum(){
    if(confirm("确定删除选择数据")){
        var templateColumnEnumId = templateColumnEnumXTable.getRadioValue();
        if(templateColumnEnumId == null){
            alert("请选择要删除的数据");
            return false;
        }
        var templateColumnEnum = new TemplateColumnEnum();
        templateColumnEnum.templateId = templateXTable.getRadioValue();
        templateColumnEnum.columnId = templateColumnXTable.getRadioValue();
        templateColumnEnum.enumId = templateColumnEnumId;
        TemplateService.deleteTemplateColumnEnum(templateColumnEnum, selectTemplateColumnEnum);
    }
}

</script>
