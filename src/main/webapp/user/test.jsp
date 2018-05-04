<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0, user-scalable=no, width=device-width">
    <title>HTML5+CSS3超酷动态表单</title>
    <style>

        *:focus{
            outline:none; /* Prevents blue border in Webkit */
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; /*  */
        }

        #top_bit {
            width:760px;
            margin: 0 auto;
        }

        form {
            width:300px;
            margin: 20px auto;
        }

        p {
            line-height: 1.6;
        }

        input, textarea {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            background-color:#fff;
            border:1px solid #ccc;
            font-size:20px;
            width:300px;
            min-height:30px;
            display:block;
            margin-bottom:16px;
            margin-top:8px;

            -webkit-border-radius:5px;
            -moz-border-radius:5px;
            border-radius:5px;

            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
        }

        textarea {
            min-height:200px;
        }

        input:focus, textarea:focus {
            -webkit-box-shadow:0 0 25px #ccc;
            -moz-box-shadow:0 0 25px #ccc;
            box-shadow:0 0 25px #ccc;
            -webkit-transform: scale(1.05);
            -moz-transform: scale(1.05);
            transform: scale(1.05);
            border-color:rgba(82, 168, 236, 0.8);outline:0;outline:thin dotted \9;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);-moz-box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);box-shadow:inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(82,168,236,.6);
        }

        /* The interesting bit */

        input:not(:focus), textarea:not(:focus) {
            opacity:0.5;
        }

        input:required, textarea:required {
            background:url("tests/formdemo/asterisk_orange.png") no-repeat 280px 7px;
        }

        input:valid, textarea:valid {
            background:url("tests/formdemo/tick.png") no-repeat 280px 5px;
        }

        input:focus:invalid, textarea:focus:invalid {
            background:url("tests/formdemo/cancel.png") no-repeat 280px 7px;
        }

        input[type=submit] {
            padding:10px;
            background:none;
            opacity:1.0;
        }

    </style>
</head>
<body>
<div id="top_bit">

    <h1></h1>

    <img src="logo.png" />
</div>
<form action="formdemo.php" method="post">
    <label for="name">手机</label>
    <input type="tel" name="tel" required="true" placeholder="请输入手机号" />
    <input type="button" style="width:120px;font-size:12px" value="点击发送验证码" onclick="sendCode(this)" />
    <label for="name">验证码</label>
    <input type="number" name="vertificationCode"  min="0" max="9999" required="true" placeholder="验证码" />
    <label for="name">Name:</label>
    <input type="text" name="name" required="true" placeholder="Name" />

    <label for="email">Email:</label>
    <input type="email" name="email" required="true" placeholder="email@jq22.com" />

    <label for="website">Website:</label>
    <input type="url" name="website" required="true" placeholder="http://www.jq22.com" />

    <label for="number">Number:</label>
    <input type="number" name="number" min="0" max="10" step="2" required="true" placeholder="Even num < 10">

    <label for="range">Range:</label> <output id="xxx">50</output>%
    <input type="range" name="range" value="50" min="0" max="100" step="1" oninput="aaa(this)"/>
    <br/>
    <label for="message">Message:</label>
    <textarea name="message" required="true"></textarea>

    <input type="submit" value="Send Message" />

</form>
</body>
</html>
<script type="text/javascript">
    function aaa(obj){
        document.getElementById("xxx").innerHTML = obj.value;
    }
    var clock = '';
    var nums = 60;
    var btn;
    function sendCode(thisBtn){
        btn = thisBtn;
        btn.disabled = true; //将按钮置为不可点击
        btn.value = nums+'秒后可重新获取';
        clock = setInterval(doLoop, 1000); //一秒执行一次
    }
    function doLoop(){
        nums--;
        if(nums > 0){
            btn.value = nums+'秒后可重新获取';
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.value = '点击发送验证码';
            nums = 10; //重置时间
        }
    }
</script>