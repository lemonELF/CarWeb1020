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
<body>


<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>注册账号</h2>
            <p>创建账号并加入我们</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-email" for="LAY-user-login-email"></label>
                <input type="text" name="email" id="LAY-user-login-email" lay-verify="email" placeholder="邮箱" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="layui-row">
                    <div class="layui-col-xs7">
                        <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
                        <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
                    </div>
                    <div class="layui-col-xs5">
                        <div style="margin-left: 10px;">
                            <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid" id="LAY-user-getsmscode"
                            onclick="VerifiCode()">获取验证码</button>
                        </div>
                    </div>
                </div>
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
                <input type="checkbox" name="agreement" lay-skin="primary" title="同意用户协议" checked>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit"onclick="Register()">注 册</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <label>社交账号注册</label>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
                <a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

                <a href="UserLogin.jsp" class="layadmin-user-jump-change layadmin-link layui-hide-xs">用已有帐号登入</a>
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
    ccode="";
    function VerifiCode() {
        //var email= document.getElementById(LAY-user-login-email);
        data={
                "email" :$("#LAY-user-login-email").val()
        }
        if(data.email==null)
        {
            alert("请先输入邮箱");
        }else {
            //console.log(email);
            url = "http://localhost:8080/Welcome/verservlet";
            $.ajax({
                type: "get",
                url: url,
                data: data,
                cahce: false,
                async: false,
                success: function (data, textStatus, jqXHR) {
                    if (data.result == "yes") {
                        alert("验证码已发送");
                        ccode=data.code;
                        console.log(data.code);
                    }
                    else {
                        alert("发送失败");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(typeof(errorThrown));
                }

            });
        }
    }
    //var email= document.getElementById();
    //var password=document.getElementById(LAY-user-login-password);
    //var vercode=document.getElementById(LAY-user-login-vercode);
    var vercode=ccode;
    function Register(){
        data={
            "email" :$("#LAY-user-login-email").val(),
            "password":$("#LAY-user-login-password").val(),
            "vercode":$("#LAY-user-login-vercode").val(),
            "repass":$("#LAY-user-login-repass").val()
        }
        if(data.password==""||data.email==""||data.vercode==""||data.repass=="")
        {
            alert("请输入完整的信息");
        }
        else if(data.vercode!=ccode)
        {
            alert("验证码不正确");
        }
        else {
            var url="http://localhost:8080/Welcome/ServletServlet";
            $.ajax({
                type:"get",
                url:url,
                data:data,
                cache:false,
                async:false,
                success: function (data) {
                    email=$("#LAY-user-login-email").val();
                    console.log(data[3].rows.item.length);
                    if(data[3].rows.item.length>0)
                    {
                        if(data[3].rows.item[0].account==email)
                        {
                            alert("该邮箱已经被注册。");
                        }
                    }
                    else
                    {
                        data1={
                            "email" :$("#LAY-user-login-email").val(),
                            "password":$("#LAY-user-login-password").val(),
                        }
                        var url = "http://localhost:8080/Welcome/LInsertServlet";
                        $.ajax({
                            type:"get",
                            url:url,
                            data:data1,
                            cache:false,
                            async:false,
                            success: function (data,textStatus, jqXHR)
                            {
                                alert("注册成功，请登录");
                                window.location.href="http://localhost:8080/Welcome/UserLogin.jsp";
                            },
                            error:function (XMLHttpRequest, textStatus, errorThrown) {
                                alert(typeof(errorThrown));
                            }
                        });
                    }

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