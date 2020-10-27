<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="./layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="./layuiadmin/style/login.css" media="all">
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>管理员登录</h2>
            <p>车辆信息后台管理系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
                        </div>
                    </div>
                </div>
            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <a href="Forget.jsp" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;"></a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit"onclick="Login()">登 入</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号登入</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="Register.jsp" class="layadmin-user-jump-change layadmin-link"></a>
            </div>
        </div>
    </div>

    <div class="layui-trans layadmin-user-login-footer">

        <p>© 2018 <a href="http://www.layui.com/" target="_blank">layui.com</a></p>
        <p>
            <span><a href="http://www.layui.com/admin/#get" target="_blank">获取授权</a></span>
            <span><a href="http://www.layui.com/admin/pro/" target="_blank">在线演示</a></span>
            <span><a href="http://www.layui.com/admin/" target="_blank">前往官网</a></span>
        </p>
    </div>

    <!--<div class="ladmin-user-login-theme">
      <script type="text/html" template>
        <ul>
          <li data-theme=""><img src="{{ layui.setter.base }}style/res/bg-none.jpg"></li>
          <li data-theme="#03152A" style="background-color: #03152A;"></li>
          <li data-theme="#2E241B" style="background-color: #2E241B;"></li>
          <li data-theme="#50314F" style="background-color: #50314F;"></li>
          <li data-theme="#344058" style="background-color: #344058;"></li>
          <li data-theme="#20222A" style="background-color: #20222A;"></li>
        </ul>
      </script>
    </div>-->

</div>
<script src="./jslogin/jquery-1.11.1.min.js"></script>
<script src="./layuiadmin/layui/layui.js"></script>
<script>
    function Login(){
        var data={
            "account":$("#LAY-user-login-username").val(),
            "password":$("#LAY-user-login-password").val(),
            "vercode":$("#LAY-user-login-vercode").val()
        }
        if(data.vercode=="")
        {
            alert("请先输入全部信息");
        }
        else {
            var url= "http://localhost:8081/back/ServletServlet";
            $.ajax({
                type:"get",
                url:url,
                data:data,
                cache:false,
                async:false,
                success: function (data,textStatus, jqXHR)
                {
                    password=$("#LAY-user-login-password").val();
                    if(data[3].rows.item.length==0)
                    {
                        alert("该管理员账号不存在");
                    }else if(data[3].rows.item[0].Spassword!=password)
                    {
                        alert("管理员账号密码不正确");
                        window.location.href="http://localhost:8081/back/";
                    }else  if(data[3].rows.item[0].Spassword==password)
                    {
                        var data={
                            "account":$("#LAY-user-login-username").val(),
                            "password":$("#LAY-user-login-password").val()
                        }
                        var url= "http://localhost:8081/back/session";
                        $.ajax({
                            type:"get",
                            url:url,
                            data:data,
                            cache:false,
                            async:false,
                            success: function (data,textStatus, jqXHR)
                            {
                                console.log("登录成功,并且记录在session中");
                            },error:function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(typeof(errorThrown));
                            }
                        });
                        window.location.href="back.jsp";
                    }
                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(typeof(errorThrown));
                }
            });
        }
    }
    layui.config({
        base: './layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function(){
        var $ = layui.$
            ,setter = layui.setter
            ,admin = layui.admin
            ,form = layui.form
    });
</script>
</body>
</html>





