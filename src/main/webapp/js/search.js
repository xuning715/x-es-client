    var Bind = function(object, fun) {
        return function() {
            return fun.apply(object, arguments);
        }
    }

    function AutoComplete(input, div){
        this.input = $(input);        //输入框
        this.div = $(div);//DIV的根节点
        this.index = -1;          //当前选中的DIV的索引
        this.search_value = "";   //保存当前搜索的字符
    }

	AutoComplete.prototype = {
		//初始化DIV的位置
		init: function(){
			this.div.style.left = this.input.offsetLeft + "px";
			this.div.style.top  = this.input.offsetTop + this.input.offsetHeight + "px";
			this.div.style.width = this.input.offsetWidth - 2 + "px";//减去边框的长度2px
		},

		//删除自动完成需要的所有DIV
		deleteDIV: function(){
			while (this.div.children.length > 0) {
				this.div.removeChild(this.div.childNodes[0]);
			}
			this.div.className = "auto_hidden";
		},

		hiddenDIV: function(){
			this.div.className = "auto_hidden";
		},

		addDiv: function (list) {
			this.deleteDIV();
			if (list.length > 0) {
				var reg = new RegExp("(" + autoComplete.input.value + ")", "i");
				for (var i = 0; i < list.length; i++) {
					var div = document.createElement("div");
					div.className = "auto_onmouseout";
					div.onmouseover = this.autoOnmouseover(this, i);
					div.onclick = this.setValue(this, list[i]);
					div.innerHTML = getSearchHtml(list[i]).replace(reg, "<strong style='color:#ff0033'>$1</strong>");//搜索到的字符粗体显示
					this.div.appendChild(div);
				}
				this.list = list;
				this.div.className = "auto_show";
			}
		},

		//设置值
		setValue: function(_this, obj){
			return function() {
				_this.div.className = "auto_hidden";
				setObj(obj);
			}
		},

		//模拟鼠标移动至DIV时，DIV高亮
		autoOnmouseover: function(_this, _div_index){
			return function(){
				_this.index = _div_index;
				var length = _this.div.children.length;
				_this.changeClassname(length);
			}
		},

		//更改classname
		changeClassname: function(length){
			for(var i = 0; i < length; i++){
				if(i != this.index ){
					this.div.childNodes[i].className = 'auto_onmouseout';
				}else{
					this.div.childNodes[i].className = 'auto_onmouseover';
				}
			}
		},

		//响应键盘
		pressKey: function(event){
			var length = this.div.children.length;
			//光标键"↓"
			if(event.keyCode == 40){
				this.index++;
				if(this.index >= length){
					this.index = 0;
				}
//                this.input.value = this.search_value;
				this.changeClassname(length);
			}
			//光标键"↑"
			else if(event.keyCode == 38){
				this.index--;
				if(this.index <= -1){
					this.index = length - 1;
				}
//                this.input.value = this.search_value;
				this.changeClassname(length);
			}
			//回车键
			else if(event.keyCode == 13){
				if(this.index > -1){
					this.setValue(this, this.list[this.index]);
				} else {
					this.setValue(this, null);
				}
				this.div.className = "auto_hidden";
				this.index = -1;
			} else {
				this.index = -1;
			}
		},
		//程序入口
		start: function(event){
			if(event.keyCode != 13 && event.keyCode != 38 && event.keyCode != 40){
				this.init();
				this.deleteDIV();
				this.search_value = this.input.value;
				//valueArr.sort();
				if(this.input.value.replace(/(^\s*)|(\s*$)/g,'') == ""){ return; }//值为空，退出
				search(this.input.value);
			}
			this.pressKey(event);
			window.onresize = Bind(this,function(){this.init();});
		}
	}

