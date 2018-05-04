<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<c:set var="buildingId" value="${param.buildingId}" />
<c:set var="unitId" value="${param.unitId}" />
<c:set var="houseId" value="${param.houseId}" />
<c:set var="sampleId" value="${param.sampleId}" />
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
    <script type="text/javascript" src="${ctx}/dwr/interface/TemplateService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderBuildingUnit()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="buildingId" name="buildingId" value="${buildingId}" />
    <input type="hidden" id="unitId" name="unitId" value="${unitId}" />
    <input type="hidden" id="houseId" name="houseId" value="${houseId}" />
    <input type="hidden" id="sampleId" name="houseId" value="${sampleId}" />
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td width="80">楼号</td>
            <td>
                <input type="text" id="buildingName" name="buildingName" required>
            </td>
        </tr>
        <tr>
            <td>单元号</td>
            <td>
                <input type="text" id="unitName" name="unitName" required>
            </td>
        </tr>
        <tr>
            <td>总楼层</td>
            <td>
                <input type="number" id="template31Column3" name="template31Column3" required>
            </td>
        </tr>
        <tr>
            <td>所在楼层</td>
            <td>
                <input type="number" id="template40Column1" name="template40Column1" required>
            </td>
        </tr>
        <tr>
            <td>地下层数</td>
            <td>
                <input type="number" id="template31Column4" name="template31Column4" required>
            </td>
        </tr>
        <tr>
            <td>屋面形式</td>
            <td>
                <select id="template21Column8" name="template21Column8" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>建筑形式</td>
            <td>
                <select id="template31Column2" name="template31Column2" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>外墙面</td>
            <td id="template21Column9Td">
            </td>
        </tr>
        <tr>
            <td>临街状况</td>
            <td>
                <select id="template21Column10" name="template21Column10" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>电梯数量</td>
            <td>
                <input type="number" id="template31Column7" name="template31Column7" required>
            </td>
        </tr>
        <tr>
            <td>电梯品牌</td>
            <td>
                <select id="template31Column8" name="template31Column8">
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>单元户数</td>
            <td>
                <input type="number" id="template31Column5" name="template31Column5" required>
            </td>
        </tr>
        <tr>
            <td>设备设施</td>
            <td id="template21Column13Td">
            </td>
        </tr>
        <tr>
            <td>建成年代</td>
            <td>
                <input type="number" id="template21Column4" name="template21Column4" required>
            </td>
        </tr>
        <tr>
            <td>层高</td>
            <td>
                <select id="template41Column21" name="template41Column21" required>
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>公共地面</td>
            <td>
                <input type="text" id="template31Column12" name="template31Column12" required>
            </td>
        </tr>
        <tr>
            <td>公共墙面</td>
            <td>
                <input type="text" id="template31Column13" name="template31Column13" required>
            </td>
        </tr>
        <tr>
            <td>公共天花</td>
            <td>
                <input type="text" id="template31Column14" name="template31Column14" required>
            </td>
        </tr>
        <tr>
            <td>建筑物功能</td>
            <td>
                <select id="template22Column1" name="template22Column1">
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>写字楼等级</td>
            <td>
                <select id="template22Column13" name="template22Column13">
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>大堂层高</td>
            <td>
                <input type="number" id="template32Column1" name="template32Column1">
            </td>
        </tr>
        <tr>
            <td>大堂地面</td>
            <td id="template32Column2Td">
            </td>
        </tr>
        <tr>
            <td>大堂墙面</td>
            <td id="template32Column3Td">
            </td>
        </tr>
        <tr>
            <td>大堂天花</td>
            <td id="template32Column4Td">
            </td>
        </tr>
        <tr>
            <td>大堂装修</td>
            <td>
                <select id="template32Column5" name="template32Column5">
                    <option value="">请选择</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>地上用途</td>
            <td>
                <input type="text" id="template32Column6" name="template32Column6">
            </td>
        </tr>
        <tr>
            <td>地下用途</td>
            <td>
                <input type="text" id="template32Column7" name="template32Column7">
            </td>
        </tr>
        <tr>
            <td>楼栋备注</td>
            <td>
                <input type="text" id="template21Column14" name="template21Column14">
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
                label.innerText = templateColumnEnum.enumValue;
                element.appendChild(checkbox);
                element.appendChild(label);
            }
        }

        var orderBuildingUnit = new OrderBuildingUnit();
        orderBuildingUnit.orderId = "${orderId}";
        OrderService.selectOrderBuildingUnitList(orderBuildingUnit, function (list) {
            if(list.length > 0) {
                orderBuildingUnit = list[0];
                dwr.util.setValues(orderBuildingUnit);
                dwr.util.setValue("template21Column9", orderBuildingUnit.template21Column9.split(","));
                dwr.util.setValue("template21Column13", orderBuildingUnit.template21Column13.split(","));
                dwr.util.setValue("template32Column2", orderBuildingUnit.template32Column2.split(","));
                dwr.util.setValue("template32Column3", orderBuildingUnit.template32Column3.split(","));
                dwr.util.setValue("template32Column4", orderBuildingUnit.template32Column4.split(","));
            } else {
                var templateValue = new TemplateValue();
                var templateValueFk = new TemplateValueFk();
                if("${buildingId}".length > 0) {
                    templateValueFk.fkId = "${buildingId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        setForm(list);
                    });
                }
                if("${unitId}".length > 0) {
                    templateValueFk.fkId = "${unitId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        setForm(list);
                    });
                }
                if("${houseId}".length > 0) {
                    templateValueFk.fkId = "${houseId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        setForm(list);
                    });
                }
                if("${sampleId}".length > 0) {
                    templateValueFk.fkId = "${sampleId}";
                    TemplateService.selectTemplateValue(templateValue, templateValueFk, function (list) {
                        setForm(list);
                    });
                }
            }
        });
    });
    function setForm(list) {
        var value;
        for (var i = 0; i < list.length; i++) {
            templateValue = list[i];
            value = templateValue.columnValueStr != null && templateValue.columnValueStr.length > 0 ? templateValue.columnValueStr : templateValue.columnValueNum;
            if ((templateValue.templateId == 21 && templateValue.columnId == 9) ||
                    (templateValue.templateId == 21 && templateValue.columnId == 13) ||
                    (templateValue.templateId == 32 && templateValue.columnId == 2) ||
                    (templateValue.templateId == 32 && templateValue.columnId == 3) ||
                    (templateValue.templateId == 32 && templateValue.columnId == 4)) {
                dwr.util.setValue("template" + templateValue.templateId + "Column" + templateValue.columnId, value.split(","));
            } else {
                if (document.getElementById("template" + templateValue.templateId + "Column" + templateValue.columnId) != null) {
                    dwr.util.setValue("template" + templateValue.templateId + "Column" + templateValue.columnId, value);
                }
            }
        }
    }

    function insertOrderBuildingUnit() {
        var orderBuildingUnit = dwr.util.getFormValues("orderForm");
        orderBuildingUnit.template21Column9 = orderBuildingUnit.template21Column9.join(",");
        orderBuildingUnit.template21Column13 = orderBuildingUnit.template21Column13.join(",");
        orderBuildingUnit.template32Column2 = orderBuildingUnit.template32Column2.join(",");
        orderBuildingUnit.template32Column3 = orderBuildingUnit.template32Column3.join(",");
        orderBuildingUnit.template32Column4 = orderBuildingUnit.template32Column4.join(",");
        OrderService.insertOrderBuildingUnit(orderBuildingUnit, function () {
            alert("保存成功");
        });
        return false;
    }

</script>