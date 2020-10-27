<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="./layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="./layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="./layuiadmin/style/login.css" media="all">
</head>
<body onload="getemail()">


<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>layuiAdmin</h2>
            <p>layui 官方出品的单页面后台管理模板系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-email" for="LAY-user-login-email"></label>
                <input type="text" name="email" id="LAY-user-login-email" lay-verify="email" placeholder="邮箱" class="layui-input">
            </div>
            <div class="layui-form-item">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
                <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
            </div>

            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit"onclick="getemail();updatepassword()">修改密码</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号注册</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="login.html" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
                <a href="UserLogin.jsp" class="layadmin-user-jump-change layadmin-link layui-hide-sm layui-show-xs-inline-block">登入</a>
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

</div>

<script src="./jslogin/jquery-1.11.1.min.js"></script>
<script src="./layuiadmin/layui/layui.js"></script>
<script>
    thisemail="";
    function getemail() {
        url = "http://localhost:8080/Welcome/ServletContent";
        $.ajax({
            type: "get",
            url: url,
            data: {},
            cahce: false,
            async: false,
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                //thisemail=data.email;
                //$('#LAY-user-login-email').val(data.email);
                document.getElementById("LAY-user-login-email").value = data;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(typeof(errorThrown));
            }
        });
    }



    function updatepassword(){
        data={
            "pwd":$("#LAY-user-login-password").val()
        }
        url = "http://localhost:8080/Welcome/FogetServlet";
        $.ajax({
            type: "get",
            url: url,
            data: data,
            cahce: false,
            async: false,
            success: function (data, textStatus, jqXHR) {
                if (data.data == "返回成功") {
                    alert("密码已重置");
                    window.location.href="http://localhost:8080/Welcome/UserLogin.jsp";
                }
                else {
                    alert("密码修改失败");
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(typeof(errorThrown));
            }

        });
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
            ,router = layui.router();

        form.render();

        //提交
        form.on('submit(LAY-user-reg-submit)', function(obj){
            var field = obj.field;

            //确认密码
            if(field.password !== field.repass){
                return layer.msg('两次密码输入不一致');
            }

            //是否同意用户协议
            if(!field.agreement){
                return layer.msg('你必须同意用户协议才能注册');
            }

            //请求接口
            admin.req({
                url: layui.setter.base + 'json/user/reg.js' //实际使用请改成服务端真实接口
                ,data: field
                ,done: function(res){
                    layer.msg('注册成功', {
                        offset: '15px'
                        ,icon: 1
                        ,time: 1000
                    }, function(){
                        location.hash = '/user/login'; //跳转到登入页
                    });
                }
            });

            return false;
        });
    });
</script>
</body>
</html>