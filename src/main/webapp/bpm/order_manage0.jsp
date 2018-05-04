<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="/common/session.jsp" %>
<c:set var="userId" value="${param.userId}" />
<c:set var="orderId" value="${param.orderId}" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>报单</title>
    <link rel="stylesheet" href="${ctx}/css/default.css"/>
    <script type="text/javascript" src="${ctx}/js/xtable.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/UserService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" method="post" onsubmit="return insertOrder()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <input type="hidden" id="createUserId" name="createUserId" value="${userId}" />
    <input type="hidden" id="orderCode" name="orderCode" />
    <input type="hidden" id="orderState" name="orderState" value="0" />
    <fieldset>
        <legend>
            房屋信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    楼盘名称
                </td>
                <td width="20%">
                    <input type="text" id="orderEstateName" name="orderEstateName" placeholder="楼盘名称" required/>
                </td>
                <td width="10%">
                    建筑面积
                </td>
                <td width="10%">
                    <input type="number" step="0.01" id="orderHouseArea" name="orderHouseArea" placeholder="建筑面积" />
                </td>
                <td width="10%">
                    物业地址
                </td>
                <td>
                    <input type="text" id="orderHouseAddress" name="orderHouseAddress" placeholder="物业地址" required/>
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            报单信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    报单人
                </td>
                <td>
                    <input type="hidden" id="reporterUserId" name="reporterUserId" placeholder="报单人" required />
                    <input type="search" id="orderReporterName" name="orderReporterName" placeholder="报单人" autocomplete="off" oninput="selectUserList(this)" required/>
                </td>
                <td width="10%">
                    报单人类型
                </td>
                <td>
                    <select id="orderReporterType" name="orderReporterType" placeholder="报单人类型" required>
                        <option value="1">银行报单</option>
                        <option value="2">中介报单</option>
                    </select>
                </td>
                <td width="10%">
                    报单人电话
                </td>
                <td>
                    <input type="tel" id="orderReporterMobile" name="orderReporterMobile" placeholder="报单人电话" maxlength="11" required/>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    委托机构
                </td>
                <td>
                    <input type="hidden" id="reporterOrgId" name="reporterOrgId" placeholder="委托机构" required/>
                    <input type="search" id="reporterOrgName" name="reporterOrgName" placeholder="委托机构" autocomplete="off" oninput="selectReportOrgList(this)" required />
                </td>
                <td width="10%">
                    贷款银行
                </td>
                <td>
                    <input type="hidden" id="loanBankOrgId" name="loanBankOrgId" placeholder="贷款银行" required/>
                    <input type="search" id="loanBankOrgName" name="loanBankOrgName" placeholder="贷款银行" autocomplete="off" oninput="selectLoanBankOrgList(this)" required />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    评估目的
                </td>
                <td>
                    <select id="orderPurpose" name="orderPurpose" placeholder="评估目的" required>
                        <option value="D">个人抵押</option>
                        <option value="M">二手房买卖</option>
                        <option value="L">了解市值</option>
                        <option value="E">中英文报告</option>
                        <option value="Y">预估报告</option>
                        <option value="Z">咨询</option>
                        <option value="Q">中小企业贷款</option>
                    </select>
                </td>
                <td width="10%">
                    资料获取方式
                </td>
                <td>
                    <select id="orderDataWay" name="orderDataWay" required>
                        <option value="现场收取">现场收取</option>
                        <option value="银行、中介提供">银行、中介提供</option>
                    </select>
                </td>
                <td width="10%">
                    出值需要沟通
                </td>
                <td>
                    <select id="orderCommunicate" name="orderCommunicate" required>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    是否加急
                </td>
                <td>
                    <select id="orderUrgent" name="orderUrgent" required>
                        <option value="否">正常</option>
                        <option value="是">加急</option>
                    </select>
                </td>
                <td width="10%">
                    直接出报告
                </td>
                <td>
                    <select id="orderReportImmediate" name="orderReportImmediate" required>
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select>
                </td>
                <td width="10%">
                    业务联系人电话
                </td>
                <td>
                    <input type="tel" id="orderBusinessMobile" name="orderBusinessMobile" placeholder="业务联系人电话" maxlength="11" />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    看房人类型
                </td>
                <td>
                    <select id="orderWatcherType" name="orderWatcherType" required>
                        <option value="其他">其他</option>
                        <option value="委托方">委托方</option>
                        <option value="买方">买方</option>
                        <option value="卖方">卖方</option>
                        <option value="经纪人">经纪人</option>
                    </select>
                </td>
                <td width="10%">
                    看房联系人
                </td>
                <td>
                    <input type="text" id="orderWatcherName" name="orderWatcherName" placeholder="看房联系人" required/>
                </td>
                <td width="10%">
                    看房联系电话
                </td>
                <td>
                    <input type="text" id="orderWatcherMobile" name="orderWatcherMobile" placeholder="看房联系电话" maxlength="11" required/>
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            贷款信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    抵押率
                </td>
                <td>
                    <input type="number" id="orderMortgateRate" name="orderMortgateRate" placeholder="抵押率（成数 30%）" />
                </td>
                <td width="10%">
                    期望贷款额
                </td>
                <td>
                    <input type="number" id="orderLoanValue" name="orderLoanValue" placeholder="期望贷款额（元）" />
                </td>
                <td width="10%">
                    定价值
                </td>
                <td>
                    <input type="number" id="orderPreValue" name="orderPreValue" placeholder="定价值" />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    贷款备注
                </td>
                <td colspan="5">
                    <input type="text" id="orderRemark" name="orderRemark" placeholder="贷款需求备注" />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    买方
                </td>
                <td>
                    <input type="text" id="orderBuyerName" name="orderBuyerName" placeholder="买方" />
                </td>
                <td width="10%">
                    身份证
                </td>
                <td>
                    <input type="text" id="orderBuyerMobile" name="orderBuyerMobile" placeholder="买方身份证号" maxlength="18" />
                </td>
                <td width="10%">
                    交易编号
                </td>
                <td>
                    <input type="text" id="orderThirdCode" name="orderThirdCode" placeholder="交易编号" readonly/>
                </td>
            </tr>
            <tr>
                <td width="10%">
                    买方
                </td>
                <td>
                    <input type="text" id="orderSellerName" name="orderSellerName" placeholder="卖方" />
                </td>
                <td width="10%">
                    身份证
                </td>
                <td>
                    <input type="text" id="orderSellerMobile" name="orderSellerMobile" placeholder="卖方身份证号" maxlength="18" />
                </td>
                <td width="10%">
                    成交总价
                </td>
                <td>
                    <input type="number" id="orderTotalPrice" name="orderTotalPrice" placeholder="成交总价" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            工作信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">客户经理</td>
                <td>
                    <select id="managerUserId" name="managerUserId" required>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="10%">查勘员</td>
                <td>
                    <select id="surveyorUserId" name="surveyorUserId" required>
                    </select>
                </td>
                <td width="10%">
                    查勘注意事项
                </td>
                <td>
                    <input type="text" id="orderSurveyorAttention" name="orderSurveyorAttention" placeholder="查勘注意事项" />
                </td>
            </tr>
            <tr>
                <td width="10%">评估师</td>
                <td>
                    <select id="valuatorUserId" name="valuatorUserId" required>
                    </select>
                </td>
                <td width="10%">
                    工作部门
                </td>
                <td>
                    <select id="orderValuatorDept" name="orderValuatorDept" required>
                        <option value="GD">个贷部门</option>
                        <option value="GFB">个非部门（办公）</option>
                        <option value="GFS">个非部门（商业临街）</option>
                        <option value="GFN">个非部门（商业小区内铺）</option>
                    </select>
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            收费信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    收费方式
                </td>
                <td>
                    <select id="orderChargeWay" name="orderChargeWay" required>
                        <option value="现场">现场</option>
                        <option value="打卡">打卡</option>
                        <option value="月结">月结</option>
                    </select>
                </td>
                <td width="10%">
                    收费标准
                </td>
                <td>
                    <input type="number" id="orderChargeStand" name="orderChargeStand" placeholder="收费标准" />
                </td>
                <td width="10%">
                    查勘员费用
                </td>
                <td>
                    <input type="number" id="orderSurveyorFee" name="orderSurveyorFee" placeholder="查勘员费用" />
                </td>
                <td width="10%">
                    未收费可发报告
                </td>
                <td>
                    <select id="orderReportFree" name="orderReportFree" required>
                        <option value="否">否</option>
                        <option value="是">是</option>
                    </select>
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            发票信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td>
                    发票抬头
                </td>
                <td>
                    <input type="text" id="orderInvoiceCompany" name="orderInvoiceCompany" placeholder="发票抬头" />
                </td>
                <td>
                    纳税人识别号
                </td>
                <td>
                    <input type="text" id="orderInvoiceCode" name="orderInvoiceCode" placeholder="纳税人识别号" />
                </td>
                <td>
                    发票类型
                </td>
                <td>
                    <select id="orderInvoiceType" name="orderInvoiceType">
                        <option value="普票">普票</option>
                        <option value="专票">专票</option>
                    </select>
                </td>
                <td>
                    收件人
                </td>
                <td>
                    <input type="text" id="orderInvoiceReceiver" name="orderInvoiceReceiver" placeholder="收件人" />
                </td>
            </tr>
            <tr>
                <td width="10%">
                    电话
                </td>
                <td>
                    <input type="tel" id="orderInvoiceMobile" name="orderInvoiceMobile" placeholder="电话" maxlength="11" />
                </td>
                <td width="10%">
                    地址
                </td>
                <td colspan="5">
                    <input type="text" id="orderInvoiceAddress" name="orderInvoiceAddress" placeholder="地址" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            图片
        </legend>
        <input type="file" id="orderImages" name="orderImages" accept="image/jpeg,image/png,image/jpg" onchange="preview(this)" multiple>
        <div id="orderImagesPreviewDiv" style="text-align: center"></div>
        <hr>
        <div id="orderImagesDiv" style="text-align: center"></div>
    </fieldset>
    <br>
    <fieldset>
        <legend>
            快递信息
        </legend>
        <table width="100%" cellpadding="5" cellspacing="5" border="0">
            <tr>
                <td width="10%">
                    <select id="expressType" name="expressType" placeholder="物流类型">
                        <option value="快递">快递</option>
                        <option value="自取">自取</option>
                        <option value="其他">其他</option>
                    </select>
                </td>
                <td width="10%">
                    <input type="number" id="expressNum" name="expressNum" value="2" placeholder="报告份数" />
                </td>
                <td>
                    <input type="text" id="expressAddress" name="expressAddress" placeholder="物流地址" />
                </td>
                <c:if test="${!empty orderId}">
                    <td width="15%">
                        <button type="button" onclick="insertOrderExpress()">添加快递地址</button>
                    </td>
                </c:if>
            </tr>
        </table>
        <SCRIPT LANGUAGE="JavaScript" >
            var expressThead = new Array(
                    new XThead("快递类型"),
                    new XThead("报告份数"),
                    new XThead("物流地址"),
                    new XThead("删除")
            );

            var expressXTable = new XTable("express", expressThead, true);

            expressXTable.XTbodyArray = function (model) {
                var href = "<a href='javascript:void(0)' onclick=\"deleteOrderExpress('" + model.expressId + "')\">删除</a>";
                var array = new Array(
                        new XTbody("express", model.expressType),
                        new XTbody("express", model.expressNum),
                        new XTbody("express", model.expressAddress),
                        new XTbody("express", href, "string", null, null, "center")
                );
                return array;
            }

            expressXTable.getXList = function (page){
                var express = new OrderExpress();
                express.orderId = "${orderId}";
                OrderService.selectOrderExpressList(express, function(list){expressXTable.addTable(list);});
            }
        </SCRIPT>
    </fieldset>
    <br>
    <table width="100%" cellpadding="5" cellspacing="5" border="0">
        <tr>
            <td>
                <button type="submit">报单</button>
                <button onclick="location='${ctx}/bpm/order_list0.jsp'">返回</button>
            </td>
        </tr>
    </table>
</form>


<%--<div id="orgDiv" style="width: 300px; border: 1px solid #0099FF; display: none; position: absolute; background: white; z-index: 13;">--%>
    <%--<table>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<img alt="" src="${ctx}/images/common/org.gif"/>--%>
            <%--</td>--%>
            <%--<td width="40" align="center" style="word-break:keep-all;">--%>
                <%--<img alt="选中" src="${ctx}/images/common/tick.png"  id="setOrgButton"/>--%>
                <%--<img alt="关闭" src="${ctx}/images/common/cancel.png" onclick="closeDiv('orgDiv')"/>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td valign="top" colspan="3">--%>
                <%--<iframe id="orgFrame" name="orgFrame" width="100%" height="300px" frameborder="0"></iframe>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</div>--%>

<div id="searchDiv" style="width: 224px; border: 1px solid #0099FF; background: white; display: none; position: absolute; z-index: 13;" onmouseleave="closeDiv('searchDiv')">
    <table id="searchTable" style="width: 100%;">
    </table>
</div>

</body>
</html>
<script type="text/javascript">
    var userPost = new UserPost();
    userPost.postId = 1;
    UserService.selectPostUserList(userPost, function (list) {
        dwr.util.addOptions("managerUserId", list, "userId", "userName");
        userPost.postId = 5;
        UserService.selectPostUserList(userPost, function (list) {
            dwr.util.addOptions("surveyorUserId", list, "userId", "userName");
            userPost.postId = 7;
            UserService.selectPostUserList(userPost, function (list) {
                dwr.util.addOptions("valuatorUserId", list, "userId", "userName");
                if("${orderId}".length > 0) {
                    var order = new Order();
                    order.orderId = "${orderId}";
                    order.pageIndex = 1;
                    order.pageSize = 1;
                    OrderService.selectOrderList(order, function (list) {
                        if(list.length > 0) {
                            order = list[0];
                            dwr.util.setValues(order);
                        }
                    });
                    var orderImage = new OrderImage();
                    orderImage.orderId = "${orderId}";
                    orderImage.imageTypeId = "00";
                    OrderService.selectOrderImageList(orderImage, function (list) {
                        for (var i = 0; i < list.length; i++) {
                            orderImage = list[i];
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
                                    });
                                    this.parentNode.removeChild(this);
                                }
                            }
                            $("orderImagesDiv").appendChild(img);
                        }
                    });
                    expressXTable.goPage(1);
                }
            });
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

    function selectUserList(input) {
        dwr.util.setValue("reporterUserId", "");
        $("searchDiv").style.display = "none";
        if(input.value.length > 0) {
            var user = new User();
            user.userName = input.value;
            user.pageIndex = 1;
            user.pageSize = 10;
            UserService.selectUserList(user, function (list) {
                if (list.length > 0) {
                    $("searchDiv").style.display = "block";
                    $("searchDiv").style.left = getLeft(input) + "px";
                    $("searchDiv").style.top = getTop(input) + 37 + "px";
                    var table = $("searchTable");
                    while (table.rows.length > 0) {
                        table.deleteRow(0);
                    }
                    var row;
                    var cell;
                    for (var i = 0; i < list.length; i++) {
                        user = list[i];
                        row = table.insertRow();
                        row.user = user;
                        cell = row.insertCell();
                        cell.innerHTML = "<a>" + user.userName + "</a>";
                        cell.onclick = function () {
                            var user = this.parentElement.user;
                            dwr.util.setValue("reporterUserId", user.userId);
                            dwr.util.setValue("orderReporterName", user.userName);
                            dwr.util.setValue("orderReporterMobile", user.userMobile);
                            dwr.util.setValue("reporterOrgId", user.org.orgId);
                            dwr.util.setValue("reporterOrgName", user.org.orgFullName);
                            dwr.util.setValue("orderReporterType", user.org.orgType);
                            dwr.util.setValue("orderChargeWay", user.org.orgChargeWay);
                            dwr.util.setValue("orderChargeStand", user.org.orgChargeStand);
                            dwr.util.setValue("orderDataWay", user.org.orgDataWay);
                            if (user.org.orgType == 1) {
                                dwr.util.setValue("loanBankOrgId", user.org.orgId);
                                dwr.util.setValue("loanBankOrgName", user.org.orgFullName);
                            }
                            closeDiv("searchDiv");
                        }
                        cell = row.insertCell();
                        cell.innerText = user.userMobile;
//                    cell = row.insertCell();
//                    cell.innerText = user.org.orgName;
//                    cell = row.insertCell();
//                    cell.innerText = user.org.orgType;
//                    cell = row.insertCell();
//                    cell.innerText = user.org.orgChargeWay;
//                    cell = row.insertCell();
//                    cell.innerText = user.org.orgChargeStand;
//                    cell = row.insertCell();
//                    cell.innerText = user.org.orgDataWay;
                    }
                }
            });
        }
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
                            dwr.util.setValue("orderChargeWay", org.orgChargeWay);
                            dwr.util.setValue("orderChargeStand", org.orgChargeStand);
                            dwr.util.setValue("orderDataWay", org.orgDataWay);
                            dwr.util.setValue("expressAddress", org.orgAddress);
                            if (org.orgType == 1) {
                                dwr.util.setValue("loanBankOrgId", org.orgId);
                                dwr.util.setValue("loanBankOrgName", org.orgFullName);
                            }
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

    <%--function showOrgDiv(obj, orgParentId, orgId, orgName){--%>
        <%--$("orgDiv").style.display="block";--%>
        <%--$("orgDiv").style.left = getLeft(obj) + "px";--%>
        <%--$("orgDiv").style.top = getTop(obj) + 38 + "px";--%>
        <%--$("orgFrame").src = "${ctx}/common/tree_org.jsp?orgId=" + orgParentId;--%>
        <%--$("setOrgButton").onclick = function () {--%>
            <%--var node = window.frames['orgFrame'].getCurrentOrg();--%>
            <%--dwr.util.setValue(orgId, node.uuid);--%>
            <%--dwr.util.setValue(orgName, node.text);--%>
            <%--if (orgId == "reporterOrgId") {--%>
                <%--setReporterOrg();--%>
                <%--if(orgParentId == "8a8a800f3d15f1bf013d3eded32503c3") {--%>
                    <%--dwr.util.setValue("loanBankOrgId", node.uuid);--%>
                    <%--dwr.util.setValue("loanBankOrgName", node.text);--%>
                <%--}--%>
            <%--}--%>
            <%--closeDiv("orgDiv");--%>
        <%--}--%>
    <%--}--%>
    function closeDiv(divId){
        $(divId).style.display="none";
    }

    var base64Codes = "";
    function preview(input) {
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
                        base64Codes = base64Codes.replace(this.src.split(",")[1] + ",", "");
                    }
                }
                $("orderImagesPreviewDiv").appendChild(img);
                base64Codes += img.src.split(",")[1] + ",";
            };
        }
    }

    function insertOrder() {
        if(base64Codes.length > 0) {
            base64Codes = base64Codes.substring(0, base64Codes.length - 1);
        }
        var order = dwr.util.getFormValues("orderForm");
        order.createUserId = "${userId}";
        if("${orderId}".length > 0) {
            var orderState = order.orderState;
            orderState = (orderState == -1 || orderState == -4 ? order * -1 : orderState);
            order.orderState = orderState;
            OrderService.updateOrder(order, "00", base64Codes, function (o) {
                location = "${ctx}/bpm/order_list0.jsp";
            });
        } else {
            var orderExpress = new OrderExpress();
            orderExpress.expressType = dwr.util.getValue("expressType");
            orderExpress.expressAddress = dwr.util.getValue("expressAddress");
            orderExpress.expressNum = dwr.util.getValue("expressNum");
            OrderService.insertOrder(order, orderExpress, base64Codes, function (o) {
                location = "${ctx}/bpm/order_list0.jsp";
            });
        }
        return false;
    }

    function insertOrderExpress() {
        var orderExpress = new OrderExpress();
        orderExpress.expressType = dwr.util.getValue("expressType");
        orderExpress.expressAddress = dwr.util.getValue("expressAddress");
        orderExpress.expressNum = dwr.util.getValue("expressNum");
        orderExpress.orderId = dwr.util.getValue("orderId");
        OrderService.insertOrderExpress(orderExpress, function (result) {
            expressXTable.goPage(1);
        });
    }

    function deleteOrderExpress(expressId) {
        var orderExpress = new OrderExpress();
        orderExpress.expressId = expressId;
        OrderService.deleteOrderExpress(orderExpress, function (result) {
            expressXTable.goPage(1);
        });
    }

</script>