<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/session.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
        <script type="text/javascript" src="${ctx}/js/echarts.common.min.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/engine.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/util.js"></script>
        <script type="text/javascript" src="${ctx}/dwr/interface/OrgService.js"></script>
        <script type="text/javascript" src="${ctx}/js/loading.js"></script>
        <style>
        body {
            #margin-left: 0px;
            #margin-top: 0px;
            #margin-right: 0px;
            #margin-bottom: 0px;
        }
        .auto_hidden {
            width:204px;border-top: 1px solid #333;
            border-bottom: 1px solid #333;
            border-left: 1px solid #333;
            border-right: 1px solid #333;
            position:absolute;
            display:none;
        }
        .auto_show {
            width:204px;
            border-top: 1px solid #333;
            border-bottom: 1px solid #333;
            border-left: 1px solid #333;
            border-right: 1px solid #333;
            position:absolute;
            z-index:9999; /* 设置对象的层叠顺序 */
            display:block;
        }
        .auto_onmouseover{
            font-size:24pt;
            color:#000000;
            background-color:#f5f5f5;
            width:100%;

        }
        .auto_onmouseout{
            font-size:24pt;
            color:#000000;
            width:100%;
            background-color:#ffffff;
        }
        </style>
    </head>
<body>
<h1 align="center">自动完成函数(Autocomplete Function)</h1>
    <div align="center">
        <input type="search" placeholder="地址" style="width:95%;height:50px;font-size:24pt;" id="keyword" onkeyup="autoComplete.start(event)">
    </div>
    <div class="auto_hidden" id="autoSearchDiv"><!--自动完成 DIV--></div>
    <br/><br/><br/>
    <center>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width: 600px;height:400px;"></div>
    </center>
</body>
</html>
<SCRIPT language="javascript">
    var $ = function (id) {
        return "string" == typeof id ? document.getElementById(id) : id;
    }
    var Bind = function(object, fun) {
        return function() {
            return fun.apply(object, arguments);
        }
    }
    function AutoComplete(obj, autoObj){
        this.obj = $(obj);        //输入框
        this.autoObj = $(autoObj);//DIV的根节点
        this.index = -1;          //当前选中的DIV的索引
        this.search_value = "";   //保存当前搜索的字符
    }
    AutoComplete.prototype = {
        //初始化DIV的位置
        init: function(){
            this.autoObj.style.left = this.obj.offsetLeft + "px";
            this.autoObj.style.top  = this.obj.offsetTop + this.obj.offsetHeight + "px";
            this.autoObj.style.width = this.obj.offsetWidth - 2 + "px";//减去边框的长度2px   
        },
        //删除自动完成需要的所有DIV
        deleteDIV: function(){
            while(this.autoObj.hasChildNodes()){
                this.autoObj.removeChild(this.autoObj.firstChild);
            }
            this.autoObj.className = "auto_hidden";
        },
        //设置值
        setValue: function(_this){
            return function(){
                setAddress(this.orgId, this.orgFullName);
                _this.autoObj.className = "auto_hidden";
            }       
        },
        //模拟鼠标移动至DIV时，DIV高亮
        autoOnmouseover: function(_this,_div_index){
            return function(){
                _this.index = _div_index;
                var length  =  _this.autoObj.children.length;
                for(var j = 0; j < length; j++){
                    if(j != _this.index ){       
                        _this.autoObj.childNodes[j].className = 'auto_onmouseout';
                    }else{
                        _this.autoObj.childNodes[j].className = 'auto_onmouseover';
                    }
                }
            }
        },
        //更改classname
        changeClassname: function(length){
            for(var i = 0; i < length; i++){
                if(i != this.index ){       
                    this.autoObj.childNodes[i].className = 'auto_onmouseout';
                }else{
                    this.autoObj.childNodes[i].className = 'auto_onmouseover';
                    this.key = this.autoObj.childNodes[i].orgId;
                    this.value = this.autoObj.childNodes[i].orgFullName;
                    setAddress(null, this.autoObj.childNodes[i].orgFullName);
                }
            }
        }
        ,
        //响应键盘
        pressKey: function(event){
            var length = this.autoObj.children.length;
            //光标键"↓"
            if(event.keyCode == 40){
                ++this.index;
                if(this.index > length){
                    this.index = 0;
                }else if(this.index == length){
                    this.obj.value = this.search_value;
                }
                this.changeClassname(length);
            }
            //光标键"↑"
            else if(event.keyCode == 38){
                this.index--;
                if(this.index < -1){
                    this.index = length - 1;
                }else if(this.index == -1){
                    this.obj.value = this.search_value;
                }
                this.changeClassname(length);
            }
            //回车键
            else if(event.keyCode == 13){
                this.autoObj.className = "auto_hidden";
                this.index = -1;
                if(this.autoObj.childNodes.length > 0){
                    if(this.key != null) {
                        setAddress(this.key, this.value);
                        this.key = null;
                    } else {
                        setAddress(this.autoObj.childNodes[0].orgId, this.autoObj.childNodes[0].orgFullName);
                    }
                }
                else{
                    setAddress(null, null);
                }
            }else{
                this.index = -1;
            }
        },
        //程序入口
        start: function(event){
            if(event.keyCode != 13&&event.keyCode != 38&&event.keyCode != 40){
                this.init();
                this.deleteDIV();
                this.search_value = this.obj.value;
                //valueArr.sort();
                if(this.obj.value.replace(/(^\s*)|(\s*$)/g,'') == ""){ return; }//值为空，退出
                search(this.obj.value);
            }
            this.pressKey(event);
            window.onresize = Bind(this,function(){this.init();});
        }
    }

    function setAddress(id, name){
        if(name != null) {
            document.getElementById("keyword").value = name;
            if(id != null) {
                alert(id + name);
                myChart.setOption(option);
            }
        } else {
            alert("数据不存在");
        }
    }

    function search(keyword){
        OrgService.queryCrmOrg(keyword, callbackSearch);
    }

    function callbackSearch(array){
        try{
            var reg = new RegExp("(" + autoComplete.obj.value + ")","i");
        }
        catch (e){
            return;
        }
        var divIndex = 0;//记录创建的DIV的索引
        for(var i = 0; i < array.length; i++){
            var div = document.createElement("div");
            div.className = "auto_onmouseout";
            div.id = array[i].orgId;
            div.name = array[i].orgFullName;
            div.onclick = autoComplete.setValue(autoComplete);
            div.onmouseover = autoComplete.autoOnmouseover(autoComplete, i);
            div.innerHTML = array[i].orgFullName.replace(reg,"<strong style='color:#ff0033'>$1</strong>");//搜索到的字符粗体显示
            autoComplete.autoObj.appendChild(div);
            autoComplete.autoObj.className = "auto_show";
            divIndex++;
        }
    }
</SCRIPT>
<SCRIPT>
    var autoComplete = new AutoComplete('keyword', 'autoSearchDiv');
</SCRIPT>
<SCRIPT language="javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    option = {
        title: {
            text: '未来一周气温变化',
            subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['最高气温','最低气温']
        },
        toolbox: {
            show: true,
            feature: {
                dataZoom: {
                    yAxisIndex: 'none'
                },
                dataView: {readOnly: false},
                magicType: {type: ['line', 'bar']},
                restore: {},
                saveAsImage: {}
            }
        },
        xAxis:  {
            type: 'category',
            boundaryGap: false,
            data: ['周一','周二','周三','周四','周五','周六','周日']
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} °C'
            }
        },
        dataZoom: [
            {
                type: 'slider',
                xAxisIndex: 0,
                start: 0,
                end: 100
            },
            {
                type: 'inside',
                xAxisIndex: 0,
                start: 0,
                end: 100
            },
            {
                type: 'slider',
                yAxisIndex: 0,
                start: 0,
                end: 100
            },
            {
                type: 'inside',
                yAxisIndex: 0,
                start: 0,
                end: 100
            }
        ],
        series: [
            {
                name:'最高气温',
                type:'line',
                data:[11, 11, 15, 13, 12, 13, 10],
                markPoint: {
                    data: [
                        {type: 'max', name: '最大值'},
                        {type: 'min', name: '最小值'}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'}
                    ]
                }
            },
            {
                name:'最低气温',
                type:'line',
                data:[1, -2, 2, 5, 3, 2, 0],
                markPoint: {
                    data: [
                        {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                    ]
                },
                markLine: {
                    data: [
                        {type: 'average', name: '平均值'},
                        [{
                            symbol: 'none',
                            x: '90%',
                            yAxis: 'max'
                        }, {
                            symbol: 'circle',
                            label: {
                                normal: {
                                    position: 'start',
                                    formatter: '最大值'
                                }
                            },
                            type: 'max',
                            name: '最高点'
                        }]
                    ]
                }
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    //myChart.setOption(option);
</SCRIPT>
