<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/js/calendar/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type='text/javascript' src='${ctx}/dwr/interface/OrderService.js'></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm">
        <table cellspacing="5" cellpadding="5">
            <tr>
                <td>
                    <input type="search" name="orderEstateName" id="orderEstateName" placeholder="楼盘名称"/>
                </td>
                <td>
                    <input type="search" name="orderHouseAddress" id="orderHouseAddress" placeholder="物业地址"/>
                </td>
                <td>
                    <input type="search" name="orderReporterName" id="orderReporterName" placeholder="报单人"/>
                </td>
                <td>
                    <input type="search" id="orderWatcherMobile" name="orderWatcherMobile" placeholder="看房联系电话" maxlength="11" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" id="reporterOrgId" name="reporterOrgId" placeholder="委托机构" required="true"/>
                    <input type="search" id="reporterOrgName" name="reporterOrgName" placeholder="委托机构" autocomplete="off" oninput="selectReportOrgList(this)" onemptied="selectReportOrgList(this)" />
                </td>
                <td>
                    <input type="hidden" id="loanBankOrgId" name="loanBankOrgId" placeholder="贷款银行" required="true"/>
                    <input type="search" id="loanBankOrgName" name="loanBankOrgName" placeholder="贷款银行" autocomplete="off" oninput="selectLoanBankOrgList(this)" onemptied="selectLoanBankOrgList(this)" />
                </td>
                <td>
                    <select id="orderValuatorDept" name="orderValuatorDept" placeholder="个贷部门">
                        <option value="">工作部门</option>
                        <option value="GD">个贷部门</option>
                        <option value="GFB">个非部门（办公）</option>
                        <option value="GFS">个非部门（商业临街）</option>
                        <option value="GFN">个非部门（商业小区内铺）</option>
                    </select>
                </td>
                <td>
                    <input type="search" id="orderCode" name="orderCode" placeholder="评估编号(序号部分)" maxlength="10" />
                </td>
                <td>
                    <select id="orderPurpose" name="orderPurpose" placeholder="评估目的">
                        <option value="">评估目的</option>
                        <option value="D">个人抵押</option>
                        <option value="M">二手房买卖</option>
                        <option value="L">了解市值</option>
                        <option value="E">中英文报告</option>
                        <option value="Y">预估报告</option>
                        <option value="Z">咨询</option>
                        <option value="Q">中小企业贷款</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <select id="managerUserId" name="managerUserId">
                        <option value="">客户经理</option>
                    </select>
                </td>
                <td>
                    <select id="surveyorUserId" name="surveyorUserId">
                        <option value="">查勘员</option>
                    </select>
                </td>
                <td>
                    <select id="orderState" name="orderState">
                        <option value="">业务进度</option>
                        <option value="0">报单</option>
                        <option value="1">报单</option>
                        <option value="2">报单</option>
                        <option value="3">报单</option>
                        <option value="4">报单</option>
                    </select>
                </td>
                <td>
                    <input type="date" id="orderCreateTime" name="orderCreateTime" placeholder="报单时间" onkeypress="return false" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="6">
                    <button type="button" onclick="getOrderPage()">查询</button>
                    <button type="button" onclick="location='${ctx}/bpm/order_manage0.jsp'">报单</button>
                </td>
            </tr>
        </table>
</form>
<br>
<SCRIPT LANGUAGE="JavaScript" >
    var orderThead = new Array(
            new XThead("评估编号"),
            new XThead("报单时间"),
            new XThead("楼盘名称"),
            new XThead("物业地址"),
            new XThead("委托机构"),
            new XThead("贷款银行"),
            new XThead("报单人"),
            new XThead("收费情况"),
            new XThead("业务状态"),
            new XThead("操作")
    );

    var orderXTable = new XTable("order", orderThead);

    orderXTable.XTbodyArray = function (model) {
        var href = "<a style='border-right: 1px solid #dddddd' href='${ctx}/bpm/order_manage0.jsp?orderId=" + model.orderId + "'>修改&nbsp;</a>";
        if(model.orderState == 0) {
            href += "<a style='border-right: 1px solid #dddddd' href='${ctx}/bpm/order_manage_0_1.jsp?orderId=" + model.orderId + "'>&nbsp;关联&nbsp;</a>";
        }
        var array = new Array(
                new XTbody("order", model.orderValuatorDept + "-" + model.orderCode + "-" + model.orderPurpose),
                new XTbody("order", model.orderCreateTime),
                new XTbody("order", model.orderEstateName),
                new XTbody("order", model.orderHouseAddress),
                new XTbody("order", model.reporterOrgName),
                new XTbody("order", model.loanBankOrgName),
                new XTbody("order", model.orderReporterName),
                new XTbody("order", model.orderChargeStand),
                new XTbody("order", model.orderState == 1 ? "已关联" : model.orderState),
                new XTbody("order", href, "string", null, null, "center")
        );
        return array;
    }

    orderXTable.getXList = function (page){
        var order = dwr.util.getValues("orderForm");
        order.pageIndex = page;
        order.pageSize = orderXTable.pageSize;
        OrderService.selectOrderList(order, function(list){orderXTable.addTable(list);});
    }

    function getOrderPage(){
        var order = dwr.util.getFormValues("orderForm");
        OrderService.selectOrderNum(order, function(num){orderXTable.setTotalPage(num);}) ;
    }
</SCRIPT>
<div id="searchDiv" style="width: 224px; border: 1px solid #0099FF; background: white; display: none; position: absolute; z-index: 13;" onmouseleave="closeDiv('searchDiv')">
    <table id="searchTable" style="width: 100%;">
    </table>
</div>
</body>
</html>
<script>
    getOrderPage();

    var userPost = new UserPost();
    userPost.postId = 1;
    UserService.selectPostUserList(userPost, function (list) {
        dwr.util.addOptions("managerUserId", list, "userId", "userName");
        userPost.postId = 5;
        UserService.selectPostUserList(userPost, function (list) {
            dwr.util.addOptions("surveyorUserId", list, "userId", "userName");
        });
    });
    //获取元素的纵坐标
    function getTop(e){
        var offset = e.offsetTop;
        if(e.offsetParent != null) {
            offset += getTop(e.offsetParent);
        }
        return offset;
    }
    //获取元素的横坐标
    function getLeft(e){
        var offset = e.offsetLeft;
        if(e.offsetParent!=null) {
            offset += getLeft(e.offsetParent);
        }
        return offset;
    }
    function selectReportOrgList(input) {
        dwr.util.setValue("reporterOrgId", "");
        $("searchDiv").style.display = "none";
        if(input.value.length > 0) {
            var org = new Org();
            org.orgFullName = input.value;
            org.orgType = dwr.util.getValue("orderReporterType");
            org.pageIndex = 1;
            org.pageSize = 10;
            OrgService.selectOrgList(org, function (list) {
                if (list.length > 0) {
                    $("searchDiv").style.display = "block";
                    $("searchDiv").style.left = getLeft(input) + "px";
                    $("searchDiv").style.top = getTop(input) + 38 + "px";
                    var table = $("searchTable");
                    while (table.rows.length > 0) {
                        table.deleteRow(0);
                    }
                    var row;
                    var cell;
                    for (var i = 0; i < list.length; i++) {
                        org = list[i];
                        row = table.insertRow();
                        row.org = org;
                        cell = row.insertCell();
                        cell.innerHTML = "<a>" + org.orgFullName + "</a>";
                        cell.onclick = function () {
                            var org = this.parentElement.org;
                            dwr.util.setValue("reporterOrgId", org.orgId);
                            dwr.util.setValue("reporterOrgName", org.orgFullName);
                            closeDiv("searchDiv");
                        }
                    }
                }
            });
        }
    }
    function selectLoanBankOrgList(input) {
        dwr.util.setValue("loanBankOrgId", "");
        $("searchDiv").style.display = "none";
        if(input.value.length > 0) {
            var org = new Org();
            org.orgFullName = input.value;
            org.orgType = 1;
            org.pageIndex = 1;
            org.pageSize = 10;
            OrgService.selectOrgList(org, function (list) {
                if (list.length > 0) {
                    $("searchDiv").style.display = "block";
                    $("searchDiv").style.left = getLeft(input) + "px";
                    $("searchDiv").style.top = getTop(input) + 38 + "px";
                    var table = $("searchTable");
                    while (table.rows.length > 0) {
                        table.deleteRow(0);
                    }
                    var row;
                    var cell;
                    for (var i = 0; i < list.length; i++) {
                        org = list[i];
                        row = table.insertRow();
                        row.org = org;
                        cell = row.insertCell();
                        cell.innerHTML = "<a>" + org.orgFullName + "</a>";
                        cell.onclick = function () {
                            var org = this.parentElement.org;
                            dwr.util.setValue("loanBankOrgId", org.orgId);
                            dwr.util.setValue("loanBankOrgName", org.orgFullName);
                            closeDiv("searchDiv");
                        }
                    }
                }
            });
        }
    }
    function closeDiv(divId){
        $(divId).style.display="none";
    }

</script>
