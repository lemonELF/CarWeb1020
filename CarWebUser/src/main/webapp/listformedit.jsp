<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layuiAdmin 文章管理 iframe 框</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="./layuiadmin/layui/css/layui.css" media="all">
</head>


<body>
<div class="layui-form" lay-filter="layuiadmin-app-form-list" id="layuiadmin-app-form-list" style="padding: 20px 30px 0 0;">
    <div class="layui-card-header layuiadmin-card-header-auto">
        <form class="layui-form">
            <div class="layui-form-item">

                <div class="layui-inline">
                    <label class="layui-form-label">账户：</label>
                    <div class="layui-input-inline">
                        <input  name="account" id="account" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">车辆编号：</label>
                    <div class="layui-input-inline">
                        <input  name="CarId" id="model" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">保养日期：</label>
                    <div class="layui-input-inline">
                        <input type="text" class="layui-input" id="test1"  name="recentCareDay" autocomplete="off"/>
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">保养次数：</label>
                    <div class="layui-input-inline">
                        <input  name="CareTime" id="reptime" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-inline">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="./layuiadmin/layui/layui.js"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function (data) {
            console.log(data.field);
            $.ajax({
                type:"get",
                url: '/Welcome/RepUpdServlet?title=&description=&channelid=',
                data: data.field,
                success: function (data) {
                    alert("插入成功");
                    layer.msg("提交成功")
                }
            });
        });
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#test1' //指定元素
            ,trigger: 'click' //采用click弹出
            ,zIndex: 99999999
        });
    });
</script>
</body>
</html>