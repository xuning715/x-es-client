<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="estateId" value="${param.estateId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/EstateService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderEstate()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="estateId" name="estateId" />
    <input type="hidden" id="buildingId" name="buildingId" />
    <input type="hidden" id="unitId" name="unitId" />
    <input type="hidden" id="houseId" name="houseId" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td>楼盘名称</td>
            <td>
                <input type="text" id="estateName" name="estateName" required>
            </td>
        </tr>
        <tr>
            <td>周边楼盘</td>
            <td>
                <input type="text" id="template4Column12" name="template4Column12" required>
            </td>
        </tr>
        <tr>
            <td>物业公司</td>
            <td>
                <input type="text" id="template9Column1" name="template9Column1">
            </td>
        </tr>
        <tr>
            <td>物业费</td>
            <td>
                <input type="number" step="0.01" id="template9Column2" name="template9Column2">
            </td>
        </tr>
        <tr>
            <td>小区绿化</td>
            <td>
                <select id="template4Column3" name="template4Column3" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>交通组织方式</td>
            <td>
                <select id="template4Column13" name="template4Column13" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>封闭性</td>
            <td>
                <select id="template4Column1" name="template4Column1" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>社区规模</td>
            <td>
                <select id="template4Column2" name="template4Column2" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>社区成熟度</td>
            <td>
                <select id="template4Column4" name="template4Column4"required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>周边超市</td>
            <td>
                <input type="text" id="template5Column1Supermarket" name="template5Column1Supermarket">
            </td>
        </tr>
        <tr>
            <td>周边医院</td>
            <td>
                <input type="text" id="template5Column1Hospital" name="template5Column1Hospital">
            </td>
        </tr>
        <tr>
            <td>周边银行</td>
            <td>
                <input type="text" id="template5Column1Bank" name="template5Column1Bank">
            </td>
        </tr>
        <tr>
            <td>学校</td>
            <td>
                <input type="text" id="template3Column1" name="template3Column1">
            </td>
        </tr>
        <tr>
            <td>停车位</td>
            <td id="template4Column7Td">
            </td>
        </tr>
        <tr>
            <td>自然环境</td>
            <td>
                <input type="text" id="template6Column1" name="template6Column1">
            </td>
        </tr>
        <tr>
            <td>人文环境</td>
            <td>
                <input type="text" id="template7Column1" name="template7Column1">
            </td>
        </tr>
        <tr>
            <td>商业氛围</td>
            <td>
                <input type="text" id="template8Column1" name="template8Column1">
            </td>
        </tr>
        <tr>
            <td>四至东</td>
            <td>
                <input type="text" id="template2Column3East" name="template2Column3East">
            </td>
        </tr>
        <tr>
            <td>四至东距离</td>
            <td>
                <input type="number" id="template2Column2East" name="template2Column2East">
            </td>
        </tr>
        <tr>
            <td>四至东公交站</td>
            <td>
                <input type="text" id="template2Column5East" name="template2Column5East">
            </td>
        </tr>
        <tr>
            <td>四至东公交线路</td>
            <td>
                <input type="text" id="template2Column6East" name="template2Column6East">
            </td>
        </tr>
        <tr>
            <td>四至南</td>
            <td>
                <input type="text" id="template2Column3South" name="template2Column3South">
            </td>
        </tr>
        <tr>
            <td>四至南距离</td>
            <td>
                <input type="number" id="template2Column2South" name="template2Column2South">
            </td>
        </tr>
        <tr>
            <td>四至南公交站</td>
            <td>
                <input type="text" id="template2Column5South" name="template2Column5South">
            </td>
        </tr>
        <tr>
            <td>四至南公交线路</td>
            <td>
                <input type="text" id="template2Column6South" name="template2Column6South">
            </td>
        </tr>
        <tr>
            <td>四至西</td>
            <td>
                <input type="text" id="template2Column3West" name="template2Column3West">
            </td>
        </tr>
        <tr>
            <td>四至西距离</td>
            <td>
                <input type="number" id="template2Column2West" name="template2Column2West">
            </td>
        </tr>
        <tr>
            <td>四至西公交站</td>
            <td>
                <input type="text" id="template2Column5West" name="template2Column5West">
            </td>
        </tr>
        <tr>
            <td>四至西公交线路</td>
            <td>
                <input type="text" id="template2Column6West" name="template2Column6West">
            </td>
        </tr>
        <tr>
            <td>四至北</td>
            <td>
                <input type="text" id="template2Column3North" name="template2Column3North">
            </td>
        </tr>
        <tr>
            <td>四至北距离</td>
            <td>
                <input type="number" id="template2Column2North" name="template2Column2North">
            </td>
        </tr>
        <tr>
            <td>四至北公交站</td>
            <td>
                <input type="text" id="template2Column5North" name="template2Column5North">
            </td>
        </tr>
        <tr>
            <td>四至北公交线路</td>
            <td>
                <input type="text" id="template2Column6North" name="template2Column6North">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <button type="submit" style="width: 100%">保存</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    if("${estateId}".length > 0) {
        var estate = new DcEstate();
        estate.estateId = "${estateId}";
        estate.pageIndex = 0;
        estate.pageSize = 1;
        EstateService.queryDcEstate(estate, function (list) {
            if(list.length > 0) {
                estate = list[0];
                dwr.util.setValue("estateName", estate.estateName);
            }
        });
        var templateColumnEnum = new TemplateColumnEnum();
        TemplateService.selectTemplateColumnEnum(templateColumnEnum, function (templateColumnEnumList) {
           for (var i = 0; i < templateColumnEnumList.length; i++) {
               templateColumnEnum = templateColumnEnumList[i];
               var element = document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId);
               if (element != null) {
                   if (element.options != null) {
                       document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId).options.add(new Option(templateColumnEnum.enumValue, templateColumnEnum.enumValue));
                   }
               } else if (document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Td") != null) {
                   element = document.getElementById("template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Td");
                   var checkbox = document.createElement("input");
                   checkbox.type = "checkbox";
                   checkbox.id = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Enum" + templateColumnEnum.enumId;
                   checkbox.name = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId;
                   checkbox.value = templateColumnEnum.enumValue;
                   var label = document.createElement("label");
                   label.htmlFor = "template" + templateColumnEnum.templateId + "Column" + templateColumnEnum.columnId + "Enum" + templateColumnEnum.enumId;
                   label.innerText = templateColumnEnum.enumValue + "       ";
                   element.appendChild(checkbox);
                   element.appendChild(label);
               }
           }

            var orderEstate = new OrderEstate();
            orderEstate.orderId = "${orderId}";
            OrderService.selectOrderEstateList(orderEstate, function (list) {
                if(list.length > 0) {
                    orderEstate = list[0];
                    dwr.util.setValues(orderEstate);
                    dwr.util.setValue("template4Column7", orderEstate.template4Column7.split(","));
                } else {
                    var templateValue = new TemplateValue();
                    var templateValueFk = new TemplateValueFk();
                    templateValueFk.fkId = "${estateId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        var value;
                        var template5Column1Supermarket = "";
                        var template5Column1Hospital = "";
                        var template5Column1Bank = "";
                        var template3Column1 = "";
                        var template6Column1 = "";
                        var template7Column1 = "";
                        var template8Column1 = "";
                        var templateValueNext;
                        for (var i = 0; i < list.length; i++) {
                            templateValue = list[i];
                            value = templateValue.columnValueStr != null && templateValue.columnValueStr.length > 0 ? templateValue.columnValueStr : templateValue.columnValueNum;
                            if (templateValue.templateId == 5 && templateValue.columnId == 1) {
                                if (templateValue.templateColumn.columnType != "enum") {
                                    templateValueNext = list[i + 1];
                                    if (templateValueNext.templateColumn.columnType == "enum") {
                                        if (templateValueNext.templateColumn.columnName == "类型" && templateValueNext.columnValueStr == "超市") {
                                            template5Column1Supermarket += value + ",";
                                        } else if (templateValueNext.templateColumn.columnName == "类型" && templateValueNext.columnValueStr == "医院") {
                                            template5Column1Hospital += value + ",";
                                        } else if (templateValueNext.templateColumn.columnName == "类型" && templateValueNext.columnValueStr == "银行") {
                                            template5Column1Bank += value + ",";
                                        }
                                    }
                                }
                            } else if (templateValue.templateId == 3 && templateValue.columnId == 1) {
                                template3Column1 += value + ",";
                            } else if (templateValue.templateId == 6 && templateValue.columnId == 1) {
                                template6Column1 += value + ",";
                            } else if (templateValue.templateId == 7 && templateValue.columnId == 1) {
                                template7Column1 += value + ",";
                            } else if (templateValue.templateId == 8 && templateValue.columnId == 1) {
                                template8Column1 += value + ",";
                            } else if (templateValue.templateId == 2) {
                                if (templateValue.columnId == 1 && templateValue.templateColumn.columnType == "enum" && templateValue.templateColumn.columnName == "方位") {
                                    if (value == "东") {
                                        templateValue = list[i + 1];
                                        dwr.util.setValue("template2Column2East", templateValue.columnValueNum);
                                        templateValue = list[i + 2];
                                        dwr.util.setValue("template2Column3East", templateValue.columnValueStr);
                                        templateValue = list[i + 4];
                                        dwr.util.setValue("template2Column5East", templateValue.columnValueStr);
                                        templateValue = list[i + 5];
                                        dwr.util.setValue("template2Column6East", templateValue.columnValueStr);
                                    } else if (value == "南") {
                                        templateValue = list[i + 1];
                                        dwr.util.setValue("template2Column2South", templateValue.columnValueNum);
                                        templateValue = list[i + 2];
                                        dwr.util.setValue("template2Column3South", templateValue.columnValueStr);
                                        templateValue = list[i + 4];
                                        dwr.util.setValue("template2Column5South", templateValue.columnValueStr);
                                        templateValue = list[i + 5];
                                        dwr.util.setValue("template2Column6South", templateValue.columnValueStr);
                                    } else if (value == "西") {
                                        templateValue = list[i + 1];
                                        dwr.util.setValue("template2Column2West", templateValue.columnValueNum);
                                        templateValue = list[i + 2];
                                        dwr.util.setValue("template2Column3West", templateValue.columnValueStr);
                                        templateValue = list[i + 4];
                                        dwr.util.setValue("template2Column5West", templateValue.columnValueStr);
                                        templateValue = list[i + 5];
                                        dwr.util.setValue("template2Column6West", templateValue.columnValueStr);
                                    } else if (value == "北") {
                                        templateValue = list[i + 1];
                                        dwr.util.setValue("template2Column2North", templateValue.columnValueNum);
                                        templateValue = list[i + 2];
                                        dwr.util.setValue("template2Column3North", templateValue.columnValueStr);
                                        templateValue = list[i + 4];
                                        dwr.util.setValue("template2Column5North", templateValue.columnValueStr);
                                        templateValue = list[i + 5];
                                        dwr.util.setValue("template2Column6North", templateValue.columnValueStr);
                                    }
                                }
                            } else {
                                if (templateValue.templateId == 4 && templateValue.columnId == 7) {
                                    dwr.util.setValue("template" + templateValue.templateId + "Column" + templateValue.columnId, value.split(","));
                                } else {
                                    if (document.getElementById("template" + templateValue.templateId + "Column" + templateValue.columnId) != null) {
                                        dwr.util.setValue("template" + templateValue.templateId + "Column" + templateValue.columnId, value);
                                    }
                                }
                            }
                        }
                        dwr.util.setValue("template5Column1Supermarket", template5Column1Supermarket);
                        dwr.util.setValue("template5Column1Hospital", template5Column1Hospital);
                        dwr.util.setValue("template5Column1Bank", template5Column1Bank);
                        dwr.util.setValue("template3Column1", template3Column1);
                        dwr.util.setValue("template6Column1", template6Column1);
                        dwr.util.setValue("template7Column1", template7Column1);
                        dwr.util.setValue("template8Column1", template8Column1);
                    });
                }
            });
        });
    }

    function insertOrderEstate() {
        var orderEstate = dwr.util.getFormValues("orderForm");
        orderEstate.template4Column7 = orderEstate.template4Column7.join(",");
        OrderService.insertOrderEstate(orderEstate, function () {
            alert("保存成功");
        });
        return false;
    }
</script>