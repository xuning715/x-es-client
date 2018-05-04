function validate(_form){
			//对form进行校验，字段的数据有效性校验通过后方能提交
			var validator = new SimpleValidator(_form);
			if(!validator.render()) {
				//获取可能有的验证提示信息
				var waring = validator.getWarning();
				validator.focus();
				waring = waring.replace(/<br>/gi,'\r');
				alert(stringReplace(waring));
				return false;
			}else{
			    return true;
			}
		}
		
		 function stringReplace(str){
		    return str.replace(/<\/?[^>]+>/gi, '');
		  }
	
		//控制在输入框后输出信息的显示
		function insertWarningInfo(_id, _info){
			var elmInput = $(_id);
			if(!elmInput) {
				return;
			}
			//else
			var sInfoPanelId = 'validate_infopanel_' + _id;
			var elmInfoPanel = $(sInfoPanelId);
			_info = _info || '';
			if(!elmInfoPanel) {
				//new Insertion.After(elmInput, '<span class="validate_infopanel" id="' + sInfoPanelId + '">' + _info + '</span>');
				return;
			}
			//else
			Element.update(elmInfoPanel, _info);
		}
		
		
		
/**
* 简单验证组件 SimpleValidator.js
* @author: gronlet (gongfuchang)
* @date: 2009-1-15
* @version: 1.02
* @copyright(C) all rights reserved
*/
if(!Class) {//消除prototype的影响
	var Class = {
		create: function() {
			return function() {
				this.initialize.apply(this, arguments);
			}
		}
	}
}
//定义SimpleValidator
var SimpleValidator = Class.create();
SimpleValidator.prototype = {
	form: null,
	redered: false,
	report: null,
	firstInvalidElm: null,
	initialize: function(_form){
		this.setForm(_form);
	},
	warning: null,
	warningInfo: [],
	getForm : function(){
		return this.form;
	},
	/**
	* 设置要校验的Form元素
	* @param _form 要校验的Form元素
	*/
	setForm : function(_form){
		if(!_form || typeof(_form) != 'object') {
			alert('没有传入[form]参数作为需要校验的表单对象！');
			return false;
		}
		//else
		this.form = _form;
		this.redered = false;
	},
	/**
	 * 执行校验
	 * @return 校验通过返回 true, 否则为 false
	 */ 
	render : function(){
		//1 优先从参数中获取
		var form = this.form;
		//2 校验是否为空

		//3 开始获取不同类型的字段元素: INPUT, TEXTAREA, SELECT
		var inputArray = $A(form.getElementsByTagName("INPUT"));
		var textAreaArray = $A(form.getElementsByTagName("TEXTAREA"));
		var selectArray = $A(form.getElementsByTagName("SELECT"));

		//4 开始校验
		//4.1 准备一些辅助变量
		var warning = '';
		var warningInfo = [];
		var bHasInvalidElm = false; //Flag, 
		var allControls = inputArray.concat(textAreaArray, selectArray);
		//4.2 排除Hidden和Readonly元素
		var arrTemp = [];
		for (var i = 0; i < allControls.length; i++){
			var elm = allControls[i];
			if(!Element.visible(elm)){
				continue;
			}
			//else
			arrTemp.push(elm);
		}
		allControls = arrTemp;
		
		//4.3 逐个校验
		var elmFirstInvalid = null;
		var nInvalidCount = 0;
		for (var i = 0; i < allControls.length; i++){
			var elm = allControls[i];
			var validInfo = ValidationHelper.valid(elm);
			 // 校验通过!
			var id = elm.id || elm.name;
			if(!validInfo) {
				if(id) {
					warningInfo.push({
						'id': elm.id || elm.name,
						'info': null
					});
				}
				
				continue;
			}

			//else 校验失败
			if(bHasInvalidElm == false) {
				elmFirstInvalid = elm;
			}
			bHasInvalidElm = true;
			warning += (++nInvalidCount) + '.' + validInfo + "<br>";

			//进一步记录信息
			if(id) {
				warningInfo.push({
					'id': elm.id || elm.name,
					'info': validInfo
				});
			}
		}
		//4.4 善后处理：的确含有校验没通过的控件
		if(bHasInvalidElm){
			this.firstInvalidElm = elmFirstInvalid;
			this.warning = warning;

			//可进一步自行处理校验信息
			this.warningInfo = warningInfo;

			//TODO 有可能需要主动设置focus
		}

		//5 设置状态并返回
		this.redered = true;

		//返回
		return !bHasInvalidElm;
	},
	/**
	 * 获取校验的警告信息
	 * @return 校验的警告信息，完全校验通过后返回 null
	 */
	getWarning : function(){
		if(!this.redered) {
			return null;
		}
		//TODO 进行格式化
		return this.warning;
	},
	
	/**
	 * 获取校验的警告信息组成的对象数据，例如 
	 * <code>[{id: 'fullname', info: '请在[姓名]中填入合适的值！'}]</code>
	 *
	 * @return 校验的警告信息组成的对象数据，完全校验通过后返回 []
	 */
	getWarningInfo : function(){
		if(!this.redered) {
			return [];
		}
		return this.warningInfo || [];
	},

	/**
	 * 校验通过时，聚焦到第一个校验不通过的字段元素
	 */
	focus : function(){
		var elmFirstInvalid = this.__getFirstField();
		if(!elmFirstInvalid.select) {
			return;
		}
		//else
		elmFirstInvalid.select();
		elmFirstInvalid.focus();
	},

	__getFirstField : function(){
		return this.firstInvalidElm;
	}
}
//+++++++++++++++++++++++定义一些可能没有的辅助方法+++++++++++++++++++++
//=======从 prototype 中脱离==============
if(!window.Prototype) {//消除prototype的影响
	var Abstract = new Object();

	Object.extend = function(destination, source) {
	  for (property in source) {
		destination[property] = source[property];
	  }
	  return destination;
	}

	var $A = Array.from = function(iterable) {
	  if (!iterable) return [];
	  if (iterable.toArray) {
		return iterable.toArray();
	  } else {
		var results = [];
		for (var i = 0; i < iterable.length; i++)
		  results.push(iterable[i]);
		return results;
	  }
	}

	if (!window.Element) {
	  var Element = new Object();
	}

	Object.extend(Element, {
	  visible: function(element) {
		if (typeof element == 'string'){element = document.getElementById(element);}
		return element.style.display != 'none';
	  }
	 }
	);
}
//=====================
Object.extend(Element, {
	readonly : function(element){
		var readonly = element.getAttribute('readonly', 2);
		return (readonly && readonly != 0);
	}
});
Object.extend(String.prototype, {
	lTrim : function () {
		return this.replace(/^\s*/, "");
	},
	rTrim : function () {
		return this.replace(/\s*$/, "");
	},
	trim : function () {
		return this.rTrim().lTrim();
	},
	getLength : function(){
		var str = this;
		var totallength = 0;
		for (var i=0; i < str.length; i++){
			var intCode = str.charCodeAt(i);
			if (intCode >= 0 && intCode <= 128) {
				totallength += 1;	//非中文单个字符长度加 1
			}else {
				totallength += 2;	//中文字符长度则加 2
			}
		}
		return totallength;
	}
});

//++++++++++++++++++++++++++++++++++++++++++++
var isconfig = 1;
var ValidationHelper = {
	valid : function(elm){
		if(!elm) {
			return null;
		}
		//else
		var pattern		=  elm.getAttribute('pattern', 2);
		var required	=  elm.getAttribute('required', 2);
		var name		=  elm.getAttribute('placeholder', 2);
		var dateFormate =  elm.getAttribute('date_format', 2);
		isconfig	=  elm.getAttribute('isconfig', 2) == '1';
		var val			=  dwr.util.getValue(elm.name);
		//TODO 支持length
		if(!name) {
			return null;
		}
		if(!pattern) {
			pattern = 'string';
		}
		//是否必填
		var fieldDesc = this.renderField(name);
		
		if(isconfig && required && val.length == 0) {
			return fieldDesc;
			return false;
		}else if(isconfig && required && !val){
			return fieldDesc + '合适的值！';
			return false;
		}else if(!isconfig && required && val.length == 0){
			return fieldDesc + '合适的值！';
			return false;
		}else if(!isconfig && required && !val){
			return fieldDesc + '合适的值！';
			return false;
		}

		if(!required && val.length == 0) {
			return null;
		}
		if(!required && !val) {
			return null;
		}

		//else
		var validatorIns = null;
		switch(pattern.toLowerCase()){
			case "int":
			case "integer":
				validatorIns = new IntegerValidator();
				break;
			case "plus":
				validatorIns = new PlusValidator();
				break;
			case "phone":
				validatorIns = new PhoneValidator();
				break;
			case "float":
				validatorIns = new FloatValidator();
				break;
			case "date":
				validatorIns = new DateValidator(dateFormate);
				break;
			case "url":
				validatorIns = new URLValidator();
				break;
			case "string":
				validatorIns = new StringValidator();
				break;			
			case "ip":
				validatorIns = new IPV4Validator();//TODO
				break;
			case "email":
				validatorIns = new EmailValidator();
				break;
			case "qq":
				validatorIns = new QQValidator();
				break;
			case "select_value":
				validatorIns = new SelectInfoValidator();
				break;
			case "common_char":
				validatorIns = new CommonCharValidator();
				break;
			default:
				eval("validatorIns = new Custom_" + pattern.toLowerCase() + "_Validator(val)");
		}
		//先进行必要的检查：如果先前检查没通过，则不需要再进行格式验证
		//result = (result ? '\n\n' : '') + 
		var beforeInfo = validatorIns.checkBefore(elm);
		if(beforeInfo) {
			return beforeInfo;
		}

		//else
		var result = validatorIns.render(val);
		if(!result) {
			//后续检查：如果格式验证通过了，则再后期检查
			var afterInfo = validatorIns.checkAfter(elm);
			if(afterInfo) {
				return beforeInfo;
			}
			//else
			return null;
		}
		//else
		return fieldDesc + result;
	},
	renderField: function(_val){
		if(isconfig){
		    return '<span class="validator_highlight">' + (_val || '') + '</span>';
		}else{
		    return '请在[<span class="validator_highlight">' + (_val || '') + '</span>]中填入';
		}
	}
}
//TODO 抽象
var AbstractValidator = Class.create();
AbstractValidator.prototype = {
	initialize : function() {
			
	},
	render : function(_val){
		if(!_val) {
			return null;
		}
		if(!this.format) {
			return null;
		}
		//else
		if(!_val.match(this.format)){
			return this.getWarning();
		}
		
	},
	getWarning : function(){
		return '';
	},
	/**
	* 验证前的检查：最长/最短，最大最小
	*/
	checkBefore : function(_elm){
		var result = this.__checkMaxLen(_elm);
		if(!result) {
			result = this.__checkMinLen(_elm);
		}
		if(!result){
			result = this.__checkMin(_elm);
			if(!result){
				result = this.__checkMax(_elm);
			}
		}
		//else
		return result;
	},
	__checkMaxLen : function(_elm){
		var elm = _elm;
		if(!elm) {
			return null;
		}
		//else
		var nMaxLen = elm.getAttribute('maxLen', 2);
		if(isNaN(nMaxLen)){
			return null;
		}
		var sCode = elm.value.trim();
		var nLen = sCode.getLength();
		if(nLen ==0 ){
			return null;
		}
		if(nLen > parseInt(nMaxLen)){
			return '您输入的[<span class="validator_highlight">' + elm.placeholder + '</span>]长度[<b>' + nLen + '</b>]大于限定最长 [<span class="validator_highlight">' + nMaxLen + '</span>] (每个汉字长度为2)！<br>';
		}
		//else
		return null;
	},
	__checkMinLen : function(_elm){
		var elm = _elm;
		if(!elm) {
			return null;
		}
		//else
		var nMinLen = elm.getAttribute('minLen', 2);
		
		if(isNaN(nMinLen)){
			return null;
		}
		var sCode = elm.value.trim();
		var nLen = sCode.getLength();
		if(nLen ==0 ){
			return null;
		}
		if(nLen < parseInt(nMinLen)){
			return '您输入的[<span class="validator_highlight">' + elm.placeholder + '</span>]长度[<b>' + nLen + '</b>]小于限定最短 [<span class="validator_highlight">' + nMinLen + '</span>] (每个汉字长度为2)！<br>';
		}
		//else
		return null;
	},
	/*
	* 后续检查：默认不实现
	*/
	checkAfter : function(_elm){
		return null;
	},
	__checkMax : function(_elm){
	var elm = _elm;
		if(!elm) {
			return null;
		}
		//else
		var nMaxLen = elm.getAttribute('maxValue', 2);
		
		if(isNaN(nMaxLen) || nMaxLen == null){
			return null;
		}
		if(parseInt(_elm.value) >= parseInt(nMaxLen)){
			return '您输入的[<span class="validator_highlight">' + elm.placeholder + '</span>]大小[<b>' + _elm.value + '</b>]大于或者等于限定的最大值 [<span class="validator_highlight">' + nMaxLen + '</span>] ！<br>';
		}
		//else
		return null;
	},
	
	
	__checkMin: function(_elm){
		var elm = _elm;
		if(!elm) {
			return null;
		}
		//else
		var nMinLen = elm.getAttribute('minValue', 2);
		
		if(isNaN(nMinLen)|| nMinLen == null){
			return null;
		}
		
		if(_elm.value <= nMinLen){
			return '您输入的[<span class="validator_highlight">' + elm.placeholder + '</span>]大小[<b>' + _elm.value + '</b>]小于或者等于限定的最小值 [<span class="validator_highlight">' + nMinLen + '</span>] ！<br>';
		}
		//else
		return null;
	}
};
var IntegerValidator = Class.create();
Object.extend(IntegerValidator.prototype, AbstractValidator.prototype);
Object.extend(IntegerValidator.prototype, {
	format: new RegExp('^-?\\d+(e[\+-]?\\d+)?$', "i"),
	
	getWarning : function(){
		return '整数(例如200, -123, 0)';
	}
});

var PlusValidator = Class.create();
Object.extend(PlusValidator.prototype, AbstractValidator.prototype);
Object.extend(PlusValidator.prototype, {
	format: new RegExp('[1-9]|([1-9]\d+)$', "i"),
	
	getWarning : function(){
		return '<span>';
	}
});

var PhoneValidator = Class.create();
Object.extend(PhoneValidator.prototype, AbstractValidator.prototype);
Object.extend(PhoneValidator.prototype, {
	dateRegExp : /^(13[0-9]|15[0|3|6|7|8|9]|18[8|9|6])\d{8}$/,
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}
		return null;
	},
	__isValid : function(stringValue){
		var matchs = this.dateRegExp.test(stringValue);
		if(!matchs){
		   this.warning = "<span>";
		}
	}
});


var FloatValidator = Class.create();
Object.extend(FloatValidator.prototype, AbstractValidator.prototype);
Object.extend(FloatValidator.prototype, {
	
	dateRegExp : /^-?\d+\.?\d{0,2}$/,
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}
		return null;
	},
	
	__isValid : function(stringValue){
		var matchs = this.dateRegExp.test(stringValue);
		if(!matchs){
		   this.warning = "浮点数(最多只能带两位小数的数值，例如200.2, 123.2, 12)";
		}
	}
	
});

var QQValidator = Class.create();
Object.extend(QQValidator.prototype, AbstractValidator.prototype);
Object.extend(QQValidator.prototype, {
	dateRegExp : /^\d{5,10}$/,
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}
		return null;
	},
	__isValid : function(stringValue){
		var matchs = this.dateRegExp.test(stringValue);
		if(!matchs){
		   this.warning = "正确的qq号码";
		}
	}
});

var SelectInfoValidator = Class.create();
Object.extend(SelectInfoValidator.prototype, AbstractValidator.prototype);
Object.extend(SelectInfoValidator.prototype, {
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}
		return null;
	},
	__isValid : function(stringValue){
		if(stringValue.length < 1 || stringValue == 0){
		   this.warning = "正确的选项";
		}
	}
});


var StringValidator = Class.create();
Object.extend(StringValidator.prototype, AbstractValidator.prototype);
Object.extend(StringValidator.prototype, {
	render : function(_val){
		//TODO 应支持Length校验
		return null;
	}
	/*
	dateRegExp : /\s+/g,
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}
		return null;
	},
	__isValid : function(stringValue){
		var matchs = this.dateRegExp.test(stringValue);
		if(matchs){
		   this.warning = "不能包含空格的字符串";
		}
	}
	*/
});

var CommonCharValidator = Class.create();
Object.extend(CommonCharValidator.prototype, AbstractValidator.prototype);
Object.extend(CommonCharValidator.prototype, {
	format : /^\w*$/,

	getWarning : function(){
		return '普通字符(包括下划线，例如john, _marry)';
	}
});

var URLValidator = Class.create();
Object.extend(URLValidator.prototype, AbstractValidator.prototype);
Object.extend(URLValidator.prototype, {
	format : /^(http|https):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+)(:(\d+))?(\/)?/i,		  
	
	getWarning : function(){
		return '正确的URL格式：http(s)://[站点](:[端口])/(子目录)';
	}
});

var IPV4Validator = Class.create();
Object.extend(IPV4Validator.prototype, AbstractValidator.prototype);
Object.extend(IPV4Validator.prototype, {
	//TODO
});

var EmailValidator = Class.create();
Object.extend(EmailValidator.prototype, AbstractValidator.prototype);
Object.extend(EmailValidator.prototype, {
	render : function(_val){
		if(!_val) {
			return null;
		}
		if(!this.__isEmailAddress(_val)){
			return this.getWarning();
		}
		
		//else
		return null;
	},
	getWarning : function(){
		return '正确的Email格式如 gronlet@haoyisheng.com';
	},
	__isEmailAddress : function(emailStr){
		if (emailStr.length == 0) {
		   return true;
		}
		var emailPat=/^(.+)@(.+)$/;
		var specialChars="\\(\\)<>@,;:\\\\\\\"\\.\\[\\]";
		var validChars="\[^\\s" + specialChars + "\]";
		var quotedUser="(\"[^\"]*\")";
		var ipDomainPat=/^(\d{1,3})[.](\d{1,3})[.](\d{1,3})[.](\d{1,3})$/;
		var atom=validChars + '+';
		var word="(" + atom + "|" + quotedUser + ")";
		var userPat=new RegExp("^" + word + "(\\." + word + ")*$");
		var domainPat=new RegExp("^" + atom + "(\\." + atom + ")*$");
		var matchArray=emailStr.match(emailPat);
		if (matchArray == null) {
		   return false;
		}
		var user=matchArray[1];
		var domain=matchArray[2];
		if (user.match(userPat) == null) {
		   return false;
		}
		var IPArray = domain.match(ipDomainPat);
		if (IPArray != null) {
		   for (var i = 1; i <= 4; i++) {
			  if (IPArray[i] > 255) {
				 return false;
			  }
		   }
		   return true;
		}
		var domainArray=domain.match(domainPat);
		if (domainArray == null) {
		   return false;
		}
		var atomPat=new RegExp(atom,"g");
		var domArr=domain.match(atomPat);
		var len=domArr.length;
		if ((domArr[domArr.length-1].length < 2) ||
		   (domArr[domArr.length-1].length > 3)) {
		   return false;
		}
		if (len < 2) {
		   return false;
		}
		return true;
	}
});

var DateValidator = Class.create();
Object.extend(DateValidator.prototype, AbstractValidator.prototype);
Object.extend(DateValidator.prototype, {
	formatRegExp : /^(yy|yyyy)(-|\/)(m{1,2})(\2)(d{1,2})(\W+(h{1,2})(:)(m{1,2})((\8)(s{0,2}))?)?$/,
	dateRegExp : /^(\d{2}|\d{4})(-|\/)(\d{1,2})(\2)(\d{1,2})(\W+(\d{1,2})(:)(\d{1,2})((\8)(\d{0,2}))?)?$/,
	dateFormate: 'yyyy-mm-dd hh:mm:ss',
	formatMatchs: null,
	warning: null,
	initialize : function(_DateFormat) {
		if(_DateFormat && _DateFormat.length != 0) {
			this.dateFormate = 	_DateFormat.toLowerCase();
			this.formatMatchs = this.dateFormate.match(this.formatRegExp);
			if(!this.formatMatchs){
				alert("日期格式设置错误：" + this.dateFormate);
			}
		}
	},
	render : function(_val){
		if(!this.__isValid(_val)) {
			return this.warning;
		}

		return null;
	},
	__isValid : function(_val){
		var matchs = _val.match(this.dateRegExp);
		if(!matchs){
			this.warning = "匹配限定格式[" + this.dateFormate + ']的日期/时间';   
			return false;
		}
		var year = parseInt(matchs[1], 10);
		var month = parseInt(matchs[3], 10);
		var day = parseInt(matchs[5], 10);

		var hour = parseInt(matchs[7], 10);
		var minute = parseInt(matchs[9], 10);
		var second = parseInt(matchs[12], 10);
		//alert([_val, this.dateFormate, matchs[2], this.formatMatchs[2], year, month, day, hour, minute, second]);
		//为了不区分月份和日期2位数和个位数的区别（即2008-8-8等同于2008-09-08）
		var nValLen = _val.length;
		var nFormatLen = this.dateFormate.length;
		if(nValLen < nFormatLen) {
			nValLen += (month > 10) ? 0 : 1;
			nValLen += (day > 10) ? 0 : 1;
		}
		//alert([nValLen , nFormatLen])
		if(nValLen < nFormatLen
				|| matchs[2] != this.formatMatchs[2]){
			this.warning = "匹配限定格式[" + this.dateFormate + ']的日期/时间';   
			return false;
		}
		if(month < 1 || month > 12){
			this.warning = "月份应该为1到12的整数";   
			return false;
		}
		if (day < 1 || day > 31){
			this.warning = "每个月的天数应该为1到31的整数"+day; 
			return false;
		}
		if ((month==4 || month==6 || month==9 || month==11) && day==31){   
			this.warning = "该月不存在31号";   
			return false;   
		}   
		if (month==2){   
			var isleap=(year % 4==0 && (year % 100 !=0 || year % 400==0));   
			if (day>29){   
				this.warning = "2月最多有29天";   
				return false;   
			}   
			if ((day==29) && (!isleap)){   
				this.warning = "闰年2月才有29天";   
				return false;   
			}   
		}
		if(hour && hour<0 || hour>23){   
			this.warning = "小时应该是0到23的整数";   
			return false;   
		}   
		if(minute && minute<0 || minute>59){   
			this.warning = "分应该是0到59的整数";   
			return false;   
		}   
		if(second && second<0 || second>59){   
			this.warning = "秒应该是0到59的整数";   
			return false;   
		}		
		return true;
	}
});
