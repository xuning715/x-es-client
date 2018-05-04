/*----------------------------------------------------------------------------\
|                                Table Sort                                   |
|-----------------------------------------------------------------------------|
|                         Created by Erik Arvidsson                           |
|                  (http://webfx.eae.net/contact.html#erik)                   |
|                      For WebFX (http://webfx.eae.net/)                      |
|-----------------------------------------------------------------------------|
| A DOM 1 based script that allows an ordinary HTML table to be sortable.     |
|-----------------------------------------------------------------------------|
|                  Copyright (c) 1998 - 2002 Erik Arvidsson                   |
|-----------------------------------------------------------------------------|
| This software is provided "as is", without warranty of any kind, express or |
| implied, including  but not limited  to the warranties of  merchantability, |
| fitness for a particular purpose and noninfringement. In no event shall the |
| authors or  copyright  holders be  liable for any claim,  damages or  other |
| liability, whether  in an  action of  contract, tort  or otherwise, arising |
| from,  out of  or in  connection with  the software or  the  use  or  other |
| dealings in the software.                                                   |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| This  software is  available under the  three different licenses  mentioned |
| below.  To use this software you must chose, and qualify, for one of those. |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| The WebFX Non-Commercial License          http://webfx.eae.net/license.html |
| Permits  anyone the right to use the  software in a  non-commercial context |
| free of charge.                                                             |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| The WebFX Commercial license           http://webfx.eae.net/commercial.html |
| Permits the  license holder the right to use  the software in a  commercial |
| context. Such license must be specifically obtained, however it's valid for |
| any number of  implementations of the licensed software.                    |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| GPL - The GNU General Public License    http://www.gnu.org/licenses/gpl.txt |
| Permits anyone the right to use and modify the software without limitations |
| as long as proper  credits are given  and the original  and modified source |
| code are included. Requires  that the final product, software derivate from |
| the original  source or any  software  utilizing a GPL  component, such  as |
| this, is also licensed under the GPL license.                               |
|-----------------------------------------------------------------------------|
| 1998-??-?? | First version                                                  |
|-----------------------------------------------------------------------------|
| Created 1998-??-?? | All changes are in the log above. | Updated 2001-??-?? |
\----------------------------------------------------------------------------*/

var xTableCssFilePath="..\/css\/xtable.css";
document.write("<style>@import url("+xTableCssFilePath+");</style>");

var dom = (document.getElementsByTagName) ? true : false;
var ie5 = (document.getElementsByTagName && document.all) ? true : false;
var arrowUp, arrowDown;

if (ie5 || dom)
initSortTable();
Array.prototype.remove = function(dx){
	if(isNaN(dx)||dx>this.length){return false ;}
	for(var i = 0,n=0;i<this.length;i++){
		if(this[i]!=this[dx]){
			this[n++] = this[i]
		}
	}
	this.length -= 1 ; 
}
function initSortTable() {
    arrowUp = document.createElement("SPAN");
    arrowUp.className = "triangle-up";

    arrowDown = document.createElement("SPAN");
    arrowDown.className = "triangle-down";
}

function sortTable(tableNode, nCol, bDesc, sType) {
    var tBody = tableNode.tBodies[0];
    var trs = tBody.rows;
    var trl= trs.length;
    var a = new Array();

    for (var i = 0; i < trl; i++) {
        a[i] = trs[i];
    }

    var start = new Date;
    window.status = "Sorting data...";
    a.sort(compareByColumn(nCol,bDesc,sType));
    window.status = "Sorting data done";

    for (var i = 0; i < trl; i++) {
        tBody.appendChild(a[i]);
        if(i % 2 == 0){
            a[i].style.backgroundColor = "#FFFFFF";
        }
        else{
            a[i].style.backgroundColor = "#F4F9FD";
        }
        window.status = "Updating row " + (i + 1) + " of " + trl + " (Time spent: " + (new Date - start) + "ms)";
    }

    // check for onsort
    if (typeof tableNode.onsort == "string")
    tableNode.onsort = new Function("", tableNode.onsort);
    if (typeof tableNode.onsort == "function")
    tableNode.onsort();
}

function CaseInsensitiveString(s) {
    return String(s).toUpperCase();
}

function parseDate(s) {
    return Date.parse(s.replace(/\-/g, '/'));
}

/* alternative to number function
 * This one is slower but can handle non numerical characters in
 * the string allow strings like the follow (as well as a lot more)
 * to be used:
 *    "1,000,000"
 *    "1 000 000"
 *    "100cm"
 */

 function toNumber(s) {
     return Number(s.replace(/[^0-9\.]/g, ""));
 }

function compareByColumn(nCol, bDescending, sType) {
    var c = nCol;
    var d = bDescending;
    var fTypeCast = String;

    if (sType == "number")
    fTypeCast = Number;
    else if (sType == "date")
    fTypeCast = parseDate;
    else if (sType == "CaseInsensitiveString")
    fTypeCast = CaseInsensitiveString;

    return function (n1, n2) {
        if (sType == "number" || sType == "date"){
            if (fTypeCast(getInnerText(n1.cells[c])) < fTypeCast(getInnerText(n2.cells[c])))
            return d ? -1 : +1;
            if (fTypeCast(getInnerText(n1.cells[c])) > fTypeCast(getInnerText(n2.cells[c])))
            return d ? +1 : -1;
        }
        else{
            if(bDescending){
                return getInnerText(n1.cells[c]).localeCompare(getInnerText(n2.cells[c]));
            }
            else{
                return getInnerText(n2.cells[c]).localeCompare(getInnerText(n1.cells[c]));
            }
        }
        return 0;
    };
}

function sortColumnWithHold(e) {
    // find table element
    var el = ie5 ? e.srcElement : e.target;
    var table = getParent(el, "TABLE");

    // backup old cursor and onclick
    var oldCursor = table.style.cursor;
    var oldClick = table.onclick;

    // change cursor and onclick
    table.style.cursor = "wait";
    table.onclick = null;

    // the event object is destroyed after this thread but we only need
    // the srcElement and/or the target
    var fakeEvent = {srcElement : e.srcElement, target : e.target};

    // call sortColumn in a new thread to allow the ui thread to be updated
    // with the cursor/onclick
    window.setTimeout(function () {
        sortColumn(fakeEvent);
        // once done resore cursor and onclick
        table.style.cursor = oldCursor;
        table.onclick = oldClick;
    }, 100);
}

function sortColumn(e) {
    var tmp = e.target ? e.target : e.srcElement;
    var tHeadParent = getParent(tmp, "THEAD");
    var el = getParent(tmp, "TD");

    if (tHeadParent == null)
    return;

    if (el != null) {
        var p = el.parentNode;
        var i;

        // typecast to Boolean
        el._descending = !Boolean(el._descending);

        if (tHeadParent.arrow != null) {
            if(tHeadParent.arrow.parentNode != null){
                if (tHeadParent.arrow.parentNode != el) {
                    tHeadParent.arrow.parentNode._descending = null;	//reset sort order
                }
                tHeadParent.arrow.parentNode.removeChild(tHeadParent.arrow);
            }
        }

        if (el._descending)
        tHeadParent.arrow = arrowUp.cloneNode(true);
        else
        tHeadParent.arrow = arrowDown.cloneNode(true);

        el.appendChild(tHeadParent.arrow);



        // get the index of the td
        var cells = p.cells;
        var l = cells.length;
        for (i = 0; i < l; i++) {
            if (cells[i] == el) break;
        }

        var table = getParent(el, "TABLE");
        // can't fail

        sortTable(table,i,el._descending, el.getAttribute("type"));
    }
}

function getInnerText(el) {
    if (ie5) return el.innerText;	//Not needed but it is faster

    var str = "";

    var cs = el.childNodes;
    var l = cs.length;
    for (var i = 0; i < l; i++) {
        switch (cs[i].nodeType) {
            case 1: //ELEMENT_NODE
            str += getInnerText(cs[i]);
            break;
            case 3:	//TEXT_NODE
            str += cs[i].nodeValue;
            break;
        }
    }
    return str;
}

function getParent(el, pTagName) {
    if (el == null) return null;
    else if (el.nodeType == 1 && el.tagName.toLowerCase() == pTagName.toLowerCase())	// Gecko bug, supposed to be uppercase
    return el;
    else
    return getParent(el.parentNode, pTagName);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//thead构造函数
function XThead(value, type, sort, colspan, rowspan, br){
    this.value = value;
    this.type = type;
    this.sort = sort;
    var html = "<TD style='text-align:center' " + (colspan && colspan > 1 ? "colspan='" + colspan + "' " : "") + (rowspan && rowspan > 1 ? "rowspan='" + rowspan + "' " : "") + (((type && type != "string" && type != "number") || sort == false) ? "" : " onclick='sortColumn(event)' nowrap ");
    if(!type){
        html += ">" + value;
    } else if(type == "string"){
        html += ">" + value;
    } else if(type == "number"){
        html += " type='number'>" + value;
    } else if(type == "checkbox"){
        html += " style='width:30px;'><INPUT id='allXCheckBox' type='checkbox' onclick='checkXCheckBox(this)'>";
    } else if(type == "radio"){
        html += " style='width:30px;'>" + value;
    }
    html += "</TD>";
    if(br){
        html += "</TR><TR>";
    }
    this.html = html;
}

//全选所有的checkbox
function checkXCheckBox(checkbox){
    var cellIndex = checkbox.parentNode.cellIndex;
    var tbody = checkbox.parentNode.parentNode.parentNode.nextSibling;
    for(var i = 0; i < tbody.rows.length; i++){
        if(tbody.rows[i].cells[cellIndex].childNodes[0] && tbody.rows[i].cells[0].childNodes[0].checked != null){
            tbody.rows[i].cells[cellIndex].childNodes[0].checked = checkbox.checked;
        }
    }
}

//表体构造函数
function XTbody(xtableId, value, type, script, model, align){
    var html = "";
    if(!type){
        value = (value == null || value == "null" || (value + "").replace(/\s/gi, "").length == 0 ? "" : value);
        html += value;
    } else if(type == "string"){
        value = (value == null || value == "null" || (value + "").replace(/\s/gi, "").length == 0 ? "" : value);
        html += value;
    } else if(type == "number"){
        value = (value == null || value == "null" || (value + "").replace(/\s/gi, "").length == 0 ? "" : value);
        html += value;
    } else if(type == "checkbox"){
        html += "<INPUT type='checkbox' name='" + xtableId + "XCheckBox' value='" + value + "'" + (script ? script : "") + ">";
    } else if(type == "radio"){
        html += "<INPUT type='radio' name='" + xtableId + "XRadio' value='" + value + "'" + (script ? script : "") + ">";
    }
    if(model){
        this.model = model;
    }
    this.align = "left";
    if(align){
        this.align = align;
    }
    if(type == "checkbox" || type == "radio"){
        this.align = "center";
    }
    this.html = html.replace(/null/gi, "");
}

function XTable(id, theadArray, pagination){
    this.id = id;
    this.currentPage = 1;
    this.prePage = 0;
    this.nextPage = 2;
    this.totalPage = 1;
    this.pageSize = 10;
    var xtable = this;
    var html = "<TABLE width='100%' id='" + id + "XTable'>";
    html += "<THEAD id='" + id + "XThead' class='xThead'>";
    html += "<TR>";
    for(var i = 0; i < theadArray.length; i++){
        html += theadArray[i].html;
    }
    html += "</TR>";
    html += "</THEAD>";
    html += "<TBODY id='" + id + "XTbody' class='xTbody'>";
    // html += "<TR><TD colspan='" + theadArray.length + "' style='height:50px'></TD></TR>";
    html += "</TBODY>";
    if(!pagination){
        html += "<TFOOT class='xTfoot'>";
        html += "<TR>";
        html += "<TD id='" + id + "XPaginationTable' colspan='" + theadArray.length + "' style='text-align: center;border-top-width:0;'>";
        html += "<img id='" + id + "XFirstPage' src='../images/xtable/xtable_first.gif' alt='首页' border=0 style='vertical-align:middle' />&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<img id='" + id + "XPrePage' src='../images/xtable/xtable_prev.gif' alt='上一页' border=0 style='vertical-align:middle' />&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<select id='" + id + "XCurrentPage' style='vertical-align:middle; width: 55px; height: 20px; font-size: 12px;'></select>&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<img id='" + id + "XNextPage' src='../images/xtable/xtable_next.gif' alt='下一页' border=0 style='vertical-align:middle' />&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<img id='" + id + "XLastPage' src='../images/xtable/xtable_last.gif' alt='末页' border=0 style='vertical-align:middle' />&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<select id='" + id + "XPageSize' style='vertical-align:middle; width: 55px; height: 20px; font-size: 12px;'><option value=10 selected>10/页</option><option value=20>20/页</option><option value=50>50/页</option></select>&nbsp;&nbsp;&nbsp;&nbsp;";
        html += "<span style='vertical-align:middle'>共</span><span id='" + id + "XTotalNum' style='vertical-align:middle'></span><span style='vertical-align:middle'>条</span>";
        html += "</TD>";
        html += "</TR>";
        html += "</TFOOT>";
    }
    html += "</TABLE>";
    document.write(html);
    if(!pagination){
        document.getElementById(id + "XFirstPage").onmousedown = function(){
            xtable.goPage(1);
        }
        document.getElementById(id + "XPrePage").onmousedown = function(){
            xtable.goPage(xtable.prePage);
        }
        document.getElementById(id + "XNextPage").onmousedown = function(){
            xtable.goPage(xtable.nextPage);
        }
        document.getElementById(id + "XLastPage").onmousedown = function(){
            xtable.goPage(xtable.totalPage);
        }
        document.getElementById(id + "XCurrentPage").onchange = function(){
            xtable.goPage(this.value);
        }
        document.getElementById(id + "XPageSize").onchange = function(){
            xtable.pageSize = this.value;
            xtable.setTotalPage(xtable.totalNum);
        }
    }
}

//设置总页数
XTable.prototype.setTotalPage = function (totalNum){
    this.totalNum = totalNum;
    document.getElementById(this.id + "XTotalNum").innerText = totalNum;
    if(this.pageSize == null){
        var xPageSize = document.getElementById(this.id + "XPageSize");
        this.pageSize = xPageSize.options[xPageSize.selectedIndex].value;
    }
    this.totalPage = Math.ceil(totalNum == 0 ? 1 : totalNum / this.pageSize);
    var select = document.getElementById(this.id + "XCurrentPage");
    select.options.length = 0;
    for(var i = 1; i <= this.totalPage; i++){
        select.options.add(new Option(i + "/" + this.totalPage, i));
    }
    this.goPage(1);
}

/**
 * 返回页数
 * @param totalNum 数据总量
 * @param totalNum 每页数量
 * @return int
 */
 function getTotalPage(totalNum, pageSize) {
     return Math.ceil(totalNum / pageSize);
 }

//跳转到那一页
XTable.prototype.goPage = function(page){
    if(page < 1){
        alert("已到第一页");
        return false;
    }
    if(page > this.totalPage){
        alert("已到最后一页");
        return false;
    }
    this.currentPage = parseInt(page);
    this.prePage = this.currentPage - 1;
    this.nextPage = this.currentPage + 1;
    var xCurrentPageSelect = document.getElementById(this.id + "XCurrentPage");
    if(xCurrentPageSelect){
        xCurrentPageSelect.value = this.currentPage;
    }
    this.getXList(page);
    var allXCheckBox = document.getElementById("allXCheckBox");
    if(allXCheckBox){
        allXCheckBox.checked = false;
    }
    return true;
}

//清空thead所有行
XTable.prototype.setThead = function(theadArray){
    e = null;
    var theadTr = document.getElementById(this.id + "XThead").rows[0];
    while(theadTr.cells.length > 0){
        theadTr.deleteCell(0);
    }
    var xPaginationTable = document.getElementById(this.id + "XPaginationTable");
    if(xPaginationTable != null){
        xPaginationTable.colSpan = theadArray.length;
    }
    for(var i = 0; i < theadArray.length; i++){
        var thead = theadArray[i];
        var theadTd = document.createElement("td");
        theadTd.style.textAlign = "center";
        theadTd.noWrap = true;
        var html = "";
        if(!thead.type){
            html += thead.value;
        } else if(thead.type == "string"){
            html += thead.value;
        } else if(thead.type == "number"){
            theadTd.type = "number";
            html += thead.value;
        } else if(thead.type == "checkbox"){
            html += "<INPUT id='allXCheckBox' type='checkbox' onclick='checkXCheckBox(this)'>";
        } else if(thead.type == "radio"){
            html += thead.value;
        }
        theadTd.innerHTML = html;
        theadTr.appendChild(theadTd);
        if((thead.type != null && thead.type != "string" && thead.type != "number") || thead.sort == false){
        }
        else{
            theadTd.onclick = function(){
                sortColumn(event);
            }
        }
    }
}

//清空tbody所有行
XTable.prototype.removeTBody = function(){
    var table = document.getElementById(this.id + "XTbody");
    if(this.currentPage >= 1 && this.currentPage <= this.totalPage){
        while(table.rows.length > 0){
            table.deleteRow(0);
        }
    }
}

//添加tbody的行
XTable.prototype.addTable = function(list){
    this.removeTBody();
    var table = document.getElementById(this.id + "XTbody");
    if(list.length > 0){
    //     var colspan = document.getElementById(this.id + "XThead").rows[0].cells.length + 10;
    //     var tr = document.createElement("tr");
    //     var td = document.createElement("td");
    //     td.colSpan = colspan;
    //     td.style.height = 50;
    //     td.style.textAlign = "center";
    //     td.innerText = "不存在相应数据";
    //     tr.appendChild(td);
    //     table.appendChild(tr);
    // }
    // else{
        for(var i = 0; i < list.length; i++){
            var tr = document.createElement("tr");
            tr.id = this.id + i ;
            if(i % 2 == 0){
                tr.style.backgroundColor = "#FFFFFF";
            }
            else{
                tr.style.backgroundColor = "#F4F9FD";
            }
            var xTbodyArray = this.XTbodyArray(list[i]);
            var html = "";
            for(var j = 0; j < xTbodyArray.length; j++){
                var td = document.createElement("td");
                td.innerHTML = xTbodyArray[j].html;
                td.style.textAlign = xTbodyArray[j].align;
                if(td.innerHTML.indexOf("radio") > -1 || td.innerHTML.indexOf("checkbox") > -1){
                    td.style.width = 30;
                }
                else if(td.innerText.length <= 10 || td.innerHTML.indexOf("<") > -1){
                    td.style.wordBreak = "keep-all";
                    td.style.wordWrap = "normal";
                    td.noWrap = true;
                }
                else if(td.innerText.length > 10){
                    td.style.wordBreak = "break-all";
                    td.style.wordWrap = "break-word";
                    td.noWrap = false;
                }
                if(xTbodyArray[j].model){
                    tr.model = xTbodyArray[j].model;
                }
                tr.appendChild(td);
            }
            table.appendChild(tr);
            /**
            tr.onmouseup = function(){
                var activeRow = table.activeRow;
                if(activeRow != null){
                    for(var i = 0; i < activeRow.cells.length; i++){
                        activeRow.cells[i].style.backgroundColor = activeRow.rowIndex % 2 == 0 ? "#DFECFD" : "#FFFFFF";
                    }
                }
                for(var i = 0; i < tr.cells.length; i++){
                    this.cells[i].style.backgroundColor = "#FDF2D7";
                }
                table.activeRow = this;
            }
            **/
        }
    }
}

//返回id对应的tbody
XTable.prototype.getXTable = function(){
    return document.getElementById(this.id + "XTable");
}

//返回id对应的tbody
XTable.prototype.getXTBody = function(){
    return document.getElementById(this.id + "XTbody");
}

//返回选中checkbox的值，以逗号分割
XTable.prototype.getCheckBoxValue = function (){
    var checkboxs = document.getElementsByName(this.id + "XCheckBox");
    var ids = "";
    if(checkboxs && checkboxs.length > 0){
        for(var i = 0; i < checkboxs.length; i++){
            if(checkboxs[i].checked){
                ids += checkboxs[i].value + ",";
            }
        }
        if(ids.length > 0){
            ids = ids.substring(0, ids.length - 1);
        }
    }
    return ids;
}

//返回未选中checkbox的值，以逗号分割
XTable.prototype.getUnCheckBoxValue = function (){
    var checkboxs = document.getElementsByName(this.id + "XCheckBox");
    var ids = "";
    if(checkboxs && checkboxs.length > 0){
        for(var i = 0; i < checkboxs.length; i++){
            if(!checkboxs[i].checked){
                ids += checkboxs[i].value + ",";
            }
        }
        if(ids.length > 0){
            ids = ids.substring(0, ids.length - 1);
        }
    }
    return ids;
}

//返回选中的checkbox对象数组
XTable.prototype.getCheckBox = function (){
    var checkboxs = document.getElementsByName(this.id + "XCheckBox");
    var array = null;
    var index = 0;
    if(checkboxs && checkboxs.length > 0){
        array = new Array();
        for(var i = 0; i < checkboxs.length; i++){
            if(checkboxs[i].checked){
                array[index] = checkboxs[i];
                index++
            }
        }
    }
    return array;
}

//设置选中的checkbox
XTable.prototype.setCheckBoxValue = function (checkBoxValues){
    var checkboxs = document.getElementsByName(this.id + "XCheckBox");
    if(checkboxs && checkboxs.length > 0){
        for(var i = 0; i < checkboxs.length; i++){
            checkboxs[i].checked = false;
        }
    }
    else{
        return false;
    }
    if(checkBoxValues.length > 0){
        var array = checkBoxValues.split(",");
        if(array != null && array.length > 0){
            for(var i = 0; i < checkboxs.length; i++){
                for(var j = 0; j < array.length; j++){
                    if(checkboxs[i].value == array[j]){
                        checkboxs[i].checked = true;
                    }
                }
            }
        }
    }
}

//返回选中的radio对象
XTable.prototype.getRadio = function (){
    var radios = document.getElementsByName(this.id + "XRadio");
    if(radios && radios.length > 0){
        for(var i = 0; i < radios.length; i++){
            if(radios[i].checked){
                return radios[i];
            }
        }
    }
    return null;
}

//返回选中radio的值
XTable.prototype.getRadioValue = function (){
    if(this.getRadio()){
        return this.getRadio().value;
    }
    else{
        return null;
    }
}

//返回选中radio的值
XTable.prototype.setRadioValue = function (radioValue){
    var radios = document.getElementsByName(this.id + "XRadio");
    if(radios && radios.length > 0){
        for(var i = 0; i < radios.length; i++){
            if(radios[i].value == radioValue){
                radios[i].click();
                break;
            }
        }
    }
}

//firefox innerText
function isIE(){ //ie?
    if (window.navigator.userAgent.toLowerCase().indexOf("msie") >= 1)
        return true;
    else
        return false;
}

if(!isIE()){
    //firefox innerText define
    HTMLElement.prototype.__defineGetter__(
        "innerText",
        function(){
            var anyString = "";
            var childS = this.childNodes;
            for(var i=0; i<childS.length; i++) {
                if(childS[i].nodeType==1)
                //anyString += childS[i].tagName=="BR" ? "\n" : childS[i].innerText;
                anyString += childS[i].innerText;
                else if(childS[i].nodeType==3)
                anyString += childS[i].nodeValue;
            }
            return anyString;
        }
    );
    HTMLElement.prototype.__defineSetter__(
        "innerText",
        function(sText){
            this.textContent=sText;
        }
    );
}
