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
    <link rel="stylesheet" href="${ctx}/css/xtable.css"/>
    <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
    <script type="text/javascript" src="${ctx}/dwr/interface/OrderService.js"></script>
    <script type="text/javascript" src="${ctx}/js/loading.js"></script>
</head>
<body>
<form id="orderForm" name="orderForm" style="text-align: left; border: 0px;" onsubmit="return insertOrderRemark()">
    <input type="hidden" id="orderId" name="orderId" value="${orderId}" />
    <table cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td width="10%">实际用途</td>
            <td width="40%">
                <input type="checkbox" id="remarkUse1" name="remarkUse" value="住宅" onchange="checkRemarkUse1(this)">
                <label for="remarkUse1">住宅</label>
                <input type="checkbox" id="remarkUse2" name="remarkUse" value="办公" onchange="checkRemarkUse2(this)">
                <label for="remarkUse2">办公</label>
                <input type="checkbox" id="remarkUse3" name="remarkUse" value="商业" onchange="checkRemarkUse3(this)">
                <label for="remarkUse3">商业</label>
            </td>
            <td width="10%">使用现状</td>
            <td width="40%">
                <select id="remarkSyxz" name="remarkSyxz" onchange="selectRemarkSyxz(this)" required>
                    <option value="">请选择</option>
                    <option value="自用">自用</option>
                    <option value="出租">出租</option>
                    <option value="空置">空置</option>
                    <option value="装修中">装修中</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>产权类别</td>
            <td>
                <select id="remarkCqlb" name="remarkCqlb" onchange="selectRemarkCqlb(this)" required>
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
            </td>
            <td>打通</td>
            <td>
                <input type="text" id="remarkDt" name="remarkDt" placeholder="相邻房间" maxlength="10" onchange="$('remark0301').value=this.value">
            </td>
        </tr>
    </table>
    <table border="1" cellspacing="0" cellpadding="5" style="font-size: 15px;">
        <tr>
            <td width="10">01</td>
            <td>改造、自我内部打通</td>
            <td width="10">
                <input type="checkbox" id="remark01" name="remark01" onchange="check(this)" checked>
            </td>
            <td>
                原户型为
                <input type="text" id="remark0101" name="remark0101" maxlength="100" placeholder="" style="width: 150px;">
                ，现
                <input type="text" id="remark0102" name="remark0102" maxlength="100" placeholder="" style="width: 150px;">
                ，现户型为
                <input type="text" id="remark0103" name="remark0103" maxlength="100" placeholder="" style="width: 600px;">
            </td>
        </tr>
        <tr>
            <td width="10">02</td>
            <td>景观备注</td>
            <td width="10">
                <input type="checkbox" id="remark02" name="remark02" onchange="check(this)" checked>
            </td>
            <td>
                估价对象可观
                <input type="text" id="remark0201" name="remark0201" maxlength="100" placeholder="" style="width: 150px;">
            </td>
        </tr>
        <tr>
            <td width="10">03</td>
            <td>相邻房间打通</td>
            <td width="10">
                <input type="checkbox" id="remark03" name="remark03" onchange="check(this)" checked>
            </td>
            <td>
                截至价值时点，估价对象现与相邻房间
                <input type="text" id="remark0301" name="remark0301" maxlength="20" placeholder="" style="width: 150px;">
                共
                <input type="number" id="remark0302" name="remark0302" min="0" max="100" maxlength="3" placeholder="" style="width: 150px;">
                间打通整体
                <select id="remark0303" name="remark0303" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="自用">自用</option>
                    <option value="出租">出租</option>
                    <option value="空置">空置</option>
                    <option value="装修中">装修中</option>
                </select>
                作
                <input type="checkbox" id="remark030401" name="remark0304" value="住宅">
                <label for="remark030401">住宅</label>
                <input type="checkbox" id="remark030402" name="remark0304" value="办公">
                <label for="remark030402">办公</label>
                <input type="checkbox" id="remark030403" name="remark0304" value="商业">
                <label for="remark030403">商业</label>
                ，整体使用价值较高，单独使用降低其价值，独立使用性一般。本次评估以估价对象能恢复原状、独立变现为假设前提。
            </td>
        </tr>
        <tr>
            <td width="10">04</td>
            <td>使用现状</td>
            <td width="10">
                <input type="checkbox" id="remark04" name="remark04" onchange="check(this)" checked>
            </td>
            <td>
                截至估价时点，估价对象
                <select id="remark0401" name="remark0401" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="自用">自用</option>
                    <option value="出租">出租</option>
                    <option value="空置">空置</option>
                    <option value="装修中">装修中</option>
                </select>
            </td>
        </tr>
        <tr>
            <td width="10">05</td>
            <td>实际用途</td>
            <td width="10">
                <input type="checkbox" id="remark05" name="remark05" onchange="check(this)" checked>
            </td>
            <td>
                截至价值时点，估价对象
                <select id="remark0501" name="remark0501" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="自用">自用</option>
                    <option value="出租">出租</option>
                    <option value="空置">空置</option>
                    <option value="装修中">装修中</option>
                </select>
                作
                <input type="checkbox" id="remark050201" name="remark0502" value="住宅">
                <label for="remark050201">住宅</label>
                <input type="checkbox" id="remark050202" name="remark0502" value="办公">
                <label for="remark050202">办公</label>
                <input type="checkbox" id="remark050203" name="remark0502" value="商业">
                <label for="remark050203">商业</label>
            </td>
        </tr>
        <tr>
            <td width="10">06</td>
            <td>出租相关备注</td>
            <td width="10">
                <input type="checkbox" id="remark06" name="remark06" onchange="check(this)" checked>
            </td>
            <td>
                截至价值时点，估价对象出租，根据《城市房地产抵押管理办法》中的有关规定，对出租的房地产抵押的，应将抵押情况告知承租方。
            </td>
        </tr>
        <tr>
            <td width="10">07</td>
            <td>建成年代/房屋结构/总层数/所在层数备注</td>
            <td width="10">
                <input type="checkbox" id="remark07" name="remark07" onchange="check(this)" checked>
            </td>
            <td>
                该估价对象
                <input type="checkbox" id="remark070101" name="remark0701" value="建成年代">
                <label for="remark070101">建成年代</label>
                <input type="checkbox" id="remark070102" name="remark0701" value="房屋结构">
                <label for="remark070102">房屋结构</label>
                <input type="checkbox" id="remark070103" name="remark0701" value="总层数">
                <label for="remark070103">总层数</label>
                <input type="checkbox" id="remark070104" name="remark0701" value="所在层数">
                <label for="remark070104">所在层数</label>
                来源于实地查勘。
            </td>
        </tr>
        <tr>
            <td width="10">08</td>
            <td>建成年代/房屋结构/总层数/所在层数备注</td>
            <td width="10">
                <input type="checkbox" id="remark08" name="remark08" onchange="check(this)" checked>
            </td>
            <td>
                该估价对象建成年代来源于第三方证明。
            </td>
        </tr>
        <tr>
            <td width="10">09</td>
            <td>建成年代/房屋结构/总层数/所在层数备注</td>
            <td width="10">
                <input type="checkbox" id="remark09" name="remark09" onchange="check(this)" checked>
            </td>
            <td>
                由于估价委托人原因，未能提供房屋登记表，该估价对象
                <input type="checkbox" id="remark090101" name="remark0901" value="建成年代">
                <label for="remark090101">建成年代</label>
                <input type="checkbox" id="remark090102" name="remark0901" value="房屋结构">
                <label for="remark090102">房屋结构</label>
                <input type="checkbox" id="remark090103" name="remark0901" value="总层数">
                <label for="remark090103">总层数</label>
                <input type="checkbox" id="remark090104" name="remark0901" value="所在层数">
                <label for="remark090104">所在层数</label>
                来源于实地查勘。
            </td>
        </tr>
        <tr>
            <td width="10">10</td>
            <td>楼层不一致</td>
            <td width="10">
                <input type="checkbox" id="remark10" name="remark10" onchange="check(this)" checked>
            </td>
            <td>
                <select id="remark1001" name="remark1001" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                主页记载房屋总层数为
                <input type="text" id="remark1002" name="remark1002" maxlength="10" placeholder=""style="width: 150px;">
                层，房屋登记表页记载房屋总层数为
                <input type="text" id="remark1003" name="remark1003" maxlength="10" placeholder="" style="width: 150px;">
                层，此次评估以房屋登记表页记载为准，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">11</td>
            <td>结构不一致</td>
            <td width="10">
                <input type="checkbox" id="remark11" name="remark11" onchange="check(this)" checked>
            </td>
            <td>
                <select id="remark1101" name="remark1101" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                主页记载结构为
                <input type="text" id="remark1102" name="remark1102" maxlength="10" placeholder="" style="width: 150px;">
                ，房屋登记表页记载结构为
                <input type="text" id="remark1103" name="remark1103" maxlength="10" placeholder="" style="width: 150px;">
                ，此次评估以房屋登记表页记载为准，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">12</td>
            <td>地址不一致</td>
            <td width="10">
                <input type="checkbox" id="remark12" name="remark12" onchange="check(this)" checked>
            </td>
            <td>
                查勘地址：
                <input type="text" id="remark1201" name="remark1201" maxlength="100" placeholder="" style="width: 150px;">
                ，与
                <select id="remark1202" name="remark1202" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                证载地址：
                <input type="text" id="remark1203" name="remark1203" maxlength="100" placeholder="" style="width: 150px;">
                不符，经核实两者为同一物业地址，证明见附件。
            </td>
        </tr>
        <tr>
            <td width="10">13</td>
            <td>满五备注</td>
            <td width="10">
                <input type="checkbox" id="remark13" name="remark13" onchange="check(this)" checked>
            </td>
            <td>
                <select id="remark1301" name="remark1301" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                    <option value="《中华人名共和国契税完税证》">《中华人名共和国契税完税证》</option>
                    <option value="《中华人民共和国契税核定通知书》">《中华人民共和国契税核定通知书》</option>
                    <option value="原《房屋所有权证》">原《房屋所有权证》</option>
                </select>
                填发日期为
                <input type="date" id="remark1302" name="remark1302" placeholder="" style="width: 150px;" onkeypress="return false">
                ，截至价值时点已满五年。
            </td>
        </tr>
        <tr>
            <td width="10">14</td>
            <td>满五备注</td>
            <td width="10">
                <input type="checkbox" id="remark14" name="remark14" onchange="check(this)" checked>
            </td>
            <td>
                《商品房买卖合同》签订日期为
                <input type="date" id="remark1401" name="remark1401" placeholder="" style="width: 150px;" onkeypress="return false">
                ，截至价值时点已满5年。
            </td>
        </tr>
        <tr>
            <td width="10">15</td>
            <td>无楼牌号备注</td>
            <td width="10">
                <input type="checkbox" id="remark15" name="remark15" onchange="check(this)" checked>
            </td>
            <td>
                经估价方现场确认，查勘物业即为
                <select id="remark1501" name="remark1501" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                证载物业；
                <select id="remark1502" name="remark1502" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="未见楼牌号">未见楼牌号</option>
                    <option value="楼牌号脱落">楼牌号脱落</option>
                    <option value="楼牌号部分脱落">楼牌号部分脱落</option>
                </select>
                ，证明见附件。
            </td>
        </tr>
        <tr>
            <td width="10">16</td>
            <td>无楼牌号备注</td>
            <td width="10">
                <input type="checkbox" id="remark16" name="remark16" onchange="check(this)" checked>
            </td>
            <td>
                经估价方现场确认，查勘物业即为
                <select id="remark1601" name="remark1601" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                证载物业；
                <select id="remark1602" name="remark1602" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="楼牌号模糊">楼牌号模糊</option>
                    <option value="楼牌号遮挡">楼牌号遮挡</option>
                </select>
                ，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">17</td>
            <td>无单元门号/入户门号备注</td>
            <td width="10">
                <input type="checkbox" id="remark17" name="remark17" onchange="check(this)" checked>
            </td>
            <td>
                经估价方现场确认，查勘物业即为
                <select id="remark1701" name="remark1701" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                证载物业；
                <input type="checkbox" id="remark170201" name="remark1702" value="未见单元门号">
                <label for="remark170201">未见单元门号</label>
                <input type="checkbox" id="remark170202" name="remark1702" value="未见正规单元门号">
                <label for="remark170202">未见正规单元门号</label>
                <input type="checkbox" id="remark170203" name="remark1702" value="单元门号模糊">
                <label for="remark170203">单元门号模糊</label>
                <input type="checkbox" id="remark170204" name="remark1702" value="单元门号脱落">
                <label for="remark170204">单元门号脱落</label>
                <input type="checkbox" id="remark170205" name="remark1702" value="单元门号部分脱落">
                <label for="remark170205">单元门号部分脱落</label>
                <input type="checkbox" id="remark170206" name="remark1702" value="单元门号遮挡">
                <label for="remark170206">单元门号遮挡</label>
                <input type="checkbox" id="remark170207" name="remark1702" value="入户门上未见门牌标识">
                <label for="remark170207">入户门上未见门牌标识</label>
                <input type="checkbox" id="remark170208" name="remark1702" value="未见正规门牌标识">
                <label for="remark170208">未见正规门牌标识</label>
                <input type="checkbox" id="remark170209" name="remark1702" value="入户门号模糊">
                <label for="remark170209">入户门号模糊</label>
                <input type="checkbox" id="remark170210" name="remark1702" value="入户门号脱落">
                <label for="remark170210">入户门号脱落</label>
                <input type="checkbox" id="remark170211" name="remark1702" value="入户门号部分脱落">
                <label for="remark170211">入户门号部分脱落</label>
                <input type="checkbox" id="remark170212" name="remark1702" value="入户门号遮挡">
                <label for="remark170212">入户门号遮挡</label>，证明见附件。
            </td>
        </tr>
        <tr>
            <td width="10">18</td>
            <td>无单元门号/入户门号备注</td>
            <td width="10">
                <input type="checkbox" id="remark18" name="remark18" onchange="check(this)" checked>
            </td>
            <td>
                经估价方现场确认，查勘物业即为
                <select id="remark1801" name="remark1801" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                证载物业；
                <input type="checkbox" id="remark180201" name="remark1802" value="未见单元门号">
                <label for="remark180201">未见单元门号</label>
                <input type="checkbox" id="remark180202" name="remark1802" value="未见正规单元门号">
                <label for="remark180202">未见正规单元门号</label>
                <input type="checkbox" id="remark180203" name="remark1802" value="单元门号模糊">
                <label for="remark180203">单元门号模糊</label>
                <input type="checkbox" id="remark180204" name="remark1802" value="单元门号脱落">
                <label for="remark180204">单元门号脱落</label>
                <input type="checkbox" id="remark180205" name="remark1802" value="单元门号部分脱落">
                <label for="remark180205">单元门号部分脱落</label>
                <input type="checkbox" id="remark180206" name="remark1802" value="单元门号遮挡">
                <label for="remark180206">单元门号遮挡</label>
                <input type="checkbox" id="remark180207" name="remark1802" value="入户门上未见门牌标识">
                <label for="remark180207">入户门上未见门牌标识</label>
                <input type="checkbox" id="remark180208" name="remark1802" value="未见正规门牌标识">
                <label for="remark180208">未见正规门牌标识</label>
                <input type="checkbox" id="remark180209" name="remark1802" value="入户门号模糊">
                <label for="remark180209">入户门号模糊</label>
                <input type="checkbox" id="remark180210" name="remark1802" value="入户门号脱落">
                <label for="remark180210">入户门号脱落</label>
                <input type="checkbox" id="remark180211" name="remark1802" value="入户门号部分脱落">
                <label for="remark180211">入户门号部分脱落</label>
                <input type="checkbox" id="remark180212" name="remark1802" value="入户门号遮挡">
                <label for="remark180212">入户门号遮挡</label>
                ，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">19</td>
            <td>loft备注</td>
            <td width="10">
                <input type="checkbox" id="remark19" name="remark19" onchange="check(this)" checked>
            </td>
            <td>
                该估价对象层高
                <input type="text" id="remark1901" name="remark1901" maxlength="20" placeholder="" style="width: 150px;">
                m，内部已做夹层，实际使用面积为
                <input type="text" id="remark1902" name="remark1902" maxlength="20" placeholder="" style="width: 150px;">
                m²，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">20</td>
            <td>赠送花园、露台、阁楼、地下室备注</td>
            <td width="10">
                <input type="checkbox" id="remark20" name="remark20" onchange="check(this)" checked>
            </td>
            <td>
                该估价对象赠送
                <input type="text" id="remark2001" name="remark2001" maxlength="100" placeholder="" style="width: 150px;">
                ，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">21</td>
            <td>自建、加建备注</td>
            <td width="10">
                <input type="checkbox" id="remark21" name="remark21" onchange="check(this)" checked>
            </td>
            <td>
                该估价对象加建
                <input type="text" id="remark2101" name="remark2101" maxlength="100" placeholder="" style="width: 150px;">
                ,提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">22</td>
            <td>一房两本备注</td>
            <td width="10">
                <input type="checkbox" id="remark22" name="remark22" onchange="check(this)" checked>
            </td>
            <td>
                1、估价对象
                <input type="text" id="remark2201" name="remark2201" maxlength="50" placeholder="" style="width: 150px;">
                与相邻物业
                <input type="text" id="remark2202" name="remark2202" maxlength="50" placeholder="" style="width: 150px;">
                结构相连，组合成一套完整的房地产，不可分割，两套物业共用一套图片，且共用入户门
                <input type="text" id="remark2203" name="remark2203" maxlength="20" placeholder="" style="width: 150px;">
                。2、
                <input type="text" id="remark2204" name="remark2204" maxlength="50" placeholder="" style="width: 150px;">
                和
                <input type="text" id="remark2205" name="remark2205" maxlength="50" placeholder="" style="width: 150px;">
                分别对应一个房屋所有权证，且房屋所有权人
                <input type="text" id="remark2206" name="remark2206" maxlength="20" placeholder="" style="width: 150px;">
                3、该房地产比一般房地产在交易（抵押、转让、租赁）过程中有更大风险，提请报告使用人注意。4.本次评估评估结果以
                <input type="text" id="remark2207" name="remark2207" maxlength="50" placeholder="" style="width: 150px;">
                和
                <input type="text" id="remark2208" name="remark2208" maxlength="50" placeholder="" style="width: 150px;">
                两者不可分割、共同变现，（且将来如遇变现情况，房屋所有权人均同意处分
                <input type="text" id="remark2209" name="remark2209" maxlength="50" placeholder="" style="width: 150px;">
                和
                <input type="text" id="remark2210" name="remark2210" maxlength="50" placeholder="" style="width: 150px;">
                ）为假设前提。5、可比案例选择为两套物业面积之和相似案例，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td width="10">23</td>
            <td>抵押权</td>
            <td width="10">
                <input type="checkbox" id="remark23" name="remark23" onchange="check(this)" checked>
            </td>
            <td>
                据估价人员调查及估价委托人提供的资料，估价对象设定有抵押权。截至价值时点，该项权利尚未注销，本次估价应在政府相关管理部门进行解押登记后，方可作为抵押物进行抵押贷款，本次评估未考虑抵押权对估价结果的影响。
            </td>
        </tr>
        <tr>
            <td width="10">24</td>
            <td>法定优先受偿款</td>
            <td width="10">
                <input type="checkbox" id="remark24" name="remark24" onchange="check(this)" checked>
            </td>
            <td>
                根据估价人员调查及委托人提供的资料，截至价值时点，未发现估价对象存在法定优先受偿款。
            </td>
        </tr>
        <tr>
            <td width="10">25</td>
            <td>房屋所有权人为未成年人，但监护人资料提供不全的</td>
            <td width="10">
                <input type="checkbox" id="remark25" name="remark25" onchange="check(this)" checked>
            </td>
            <td>
                （1）根据委托人提供
                <input type="text" id="remark2501" name="remark2501" maxlength="20" placeholder="" style="width: 150px;">
                显示，
                <input type="text" id="remark2502" name="remark2502" maxlength="20" placeholder="" style="width: 150px;">
                为其监护人之一，我公司已经尽到调查责任，委托人未能提供其他有关监护人的资料；本次评估为按揭而评估抵押价值，以估价对象能正常办理过户手续为假设前提。（2）根据房屋登记办法第十四条：未成年人的房屋，应当由其监护人代为申请登记。监护人代为申请未成年人房屋登记的，应当提交证明监护人身份的材料；因处分未成年人房屋申请登记的，还应当提供为未成年人利益的书面保证。
            </td>
        </tr>
        <tr>
            <td width="10">26</td>
            <td>超过建筑物耐用年限</td>
            <td width="10">
                <input type="checkbox" id="remark26" name="remark26" onchange="check(this)" checked>
            </td>
            <td>
                根据建设部相关规定，估价对象已超过建筑物耐用年限
                <input type="number" id="remark2601" name="remark2601" min="1" max="100" step="0.01" maxlength="3" placeholder="" style="width: 150px;">
                年，根据现场查勘及估价委托人介绍，使用及维护状况较好，可以继续使用。
            </td>
        </tr>
        <tr>
            <td width="10">27</td>
            <td>未提供附记页</td>
            <td width="10">
                <input type="checkbox" id="remark27" name="remark27" onchange="check(this)" checked>
            </td>
            <td>
                由于估价委托人原因，未能提供
                <select id="remark2701" name="remark2701" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                附记页，我方估价人员与估价委托人沟通核实，
                <select id="remark2702" name="remark2702" style="width: 150px;">
                    <option value="">请选择</option>
                    <option value="《房屋所有权证》">《房屋所有权证》</option>
                    <option value="《不动产权证书》">《不动产权证书》</option>
                </select>
                附记页未有他项权利等其它信息记载，此次评估以附记页无权属信息等他项权利为假设前提，提请估价报告使用者注意。
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <button type="submit" style="width: 100%;">保存</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript">
    if("${orderId}".length > 0) {
        var orderRemark = new OrderRemark();
        orderRemark.orderId = "${orderId}";
        OrderService.selectOrderRemarkList(orderRemark, function (list) {
            if (list.length > 0) {
                orderRemark = list[0];
                dwr.util.setValues(orderRemark);
                dwr.util.setValue("remarkUse", orderRemark.remarkUse.split(","));
                dwr.util.setValue("remark0304", orderRemark.remark0304.split(","));
                dwr.util.setValue("remark0502", orderRemark.remark0502.split(","));
                dwr.util.setValue("remark0701", orderRemark.remark0701.split(","));
                dwr.util.setValue("remark0901", orderRemark.remark0901.split(","));
                dwr.util.setValue("remark1702", orderRemark.remark1702.split(","));
                dwr.util.setValue("remark1802", orderRemark.remark1802.split(","));
//                dwr.util.setValue("remarkSyxz", orderRemark.remarkSyxz);
//                dwr.util.setValue("remarkCqlb", orderRemark.remarkCqlb);
//                dwr.util.setValue("remarkDt", orderRemark.remarkDt);
            } else {
                var orderSpec = new OrderSpec();
                orderSpec.orderId = "${orderId}";
                OrderService.selectOrderSpecList(orderSpec, function (list) {
                    if(list.length > 0) {
                        orderSpec = list[0];
                        if (orderSpec.specUse != null) {
                            dwr.util.setValue("remarkUse", orderSpec.specUse.split(","));
                            dwr.util.setValue("remark0304", orderSpec.specUse.split(","));
                            dwr.util.setValue("remark0502", orderSpec.specUse.split(","));
                        }
                        dwr.util.setValue("remarkSyxz", orderSpec.specSyxz);
                        dwr.util.setValue("remark0303", orderSpec.specSyxz);
                        dwr.util.setValue("remark0401", orderSpec.specSyxz);
                        dwr.util.setValue("remark0501", orderSpec.specSyxz);
                        dwr.util.setValue("remarkDt", orderSpec.specDt);
                        dwr.util.setValue("remark0301", orderSpec.specDt);
                        dwr.util.setValue("remark0101", orderSpec.specYhx);
                        dwr.util.setValue("remark0102", orderSpec.specGzfs);
                    }
                });
                var orderHouse = new OrderHouse();
                orderHouse.orderId = "${orderId}";
                OrderService.selectOrderHouseList(orderHouse, function (list) {
                    if (list.length > 0) {
                        orderHouse = list[0];
                        dwr.util.setValue("remark0103", orderHouse.template41Column418);
                    }
                });
                var orderData = new OrderData();
                orderData.orderId = "${orderId}";
                OrderService.selectOrderDataList(orderData, function (list) {
                    if (list.length > 0) {
                        orderData = list[0];
                        dwr.util.setValue("remark1203", orderData.dataHouseAddress);
                        dwr.util.setValue("remark2201", orderData.dataHouseAddress);
                        dwr.util.setValue("remark2204", orderData.dataHouseAddress);
                        dwr.util.setValue("remark2207", orderData.dataHouseAddress);
                        dwr.util.setValue("remark2209", orderData.dataHouseAddress);
                    }
                });
            }
        });
    }
    function check(checkbox) {
        var checked = checkbox.checked;
        if (checked) {
            var childNodes = checkbox.parentElement.nextElementSibling.childNodes;
            var len = childNodes.length;
            for (var i = 0; i < len; i++) {
                if (childNodes[i].tagName == "INPUT" || childNodes[i].tagName == "SELECT") {
                    childNodes[i].disabled = false;
                }
            }
        } else {
            var childNodes = checkbox.parentElement.nextElementSibling.childNodes;
            var len = childNodes.length;
            for (var i = 0; i < len; i++) {
                if (childNodes[i].tagName == "INPUT" || childNodes[i].tagName == "SELECT") {
                    if (childNodes[i].type == "checkbox") {
//                        childNodes[i].checked = false;
                    } else {
//                        childNodes[i].value = "";
                    }
                    childNodes[i].disabled = true;
                }
            }
        }
    }
    function checkRemarkUse1(checkbox) {
        var checked = checkbox.checked;
        $("remark030401").checked = checked;
        $("remark050201").checked = checked;
    }
    function checkRemarkUse2(checkbox) {
        var checked = checkbox.checked;
        $("remark030402").checked = checked;
        $("remark050202").checked = checked;
    }
    function checkRemarkUse3(checkbox) {
        var checked = checkbox.checked;
        $("remark030403").checked = checked;
        $("remark050203").checked = checked;
    }
    function selectRemarkSyxz(select) {
        dwr.util.setValue("remark0303", dwr.util.getValue(select.id));
        dwr.util.setValue("remark0401", dwr.util.getValue(select.id));
        dwr.util.setValue("remark0501", dwr.util.getValue(select.id));
    }
    function selectRemarkCqlb(select) {
        dwr.util.setValue("remark1001", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1101", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1202", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1501", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1601", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1701", dwr.util.getValue(select.id));
        dwr.util.setValue("remark1801", dwr.util.getValue(select.id));
        dwr.util.setValue("remark2701", dwr.util.getValue(select.id));
        dwr.util.setValue("remark2702", dwr.util.getValue(select.id));
    }
    function insertOrderRemark() {
        var orderRemark = dwr.util.getFormValues("orderForm");
        orderRemark.remarkUse = orderRemark.remarkUse.join(",");
        orderRemark.remark0304 = orderRemark.remark0304.join(",");
        orderRemark.remark0502 = orderRemark.remark0502.join(",");
        orderRemark.remark0701 = orderRemark.remark0701.join(",");
        orderRemark.remark0901 = orderRemark.remark0901.join(",");
        orderRemark.remark1702 = orderRemark.remark1702.join(",");
        orderRemark.remark1802 = orderRemark.remark1802.join(",");
        OrderService.insertOrderRemark(orderRemark, function () {
            alert("保存成功");
        });
        return false;
    }
</script>