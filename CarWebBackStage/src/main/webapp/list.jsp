<%@ page pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <link rel="stylesheet" href="./layui/css/layui.css"  media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--编辑的form表单--%>
<form class="layui-form" action="" id="updateForm" style="display:none" lay-filter="update" enctype="multipart/form-data">
    <div class="layui-form-item" style="margin-top: 4px;">
        <label class="layui-form-label">账户</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <input type="text" name="account" lay-verify="title" autocomplete="off" placeholder="请输入账户" class="layui-input"disabled="disabled">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">车辆编号</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <input type="text" name="CarId" lay-verify="description" autocomplete="off" placeholder="请输入车辆编号" class="layui-input"disabled="disabled">
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="margin-top:20px">
        <label class="layui-form-label">保养日期</label>
        <div class="layui-input-inline">
            <input name="recentCareDay" type="text" class="layui-input" id="testup" placeholder="请选择时间">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">保养次数</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <input type="text" name="CareTime" lay-verify="description" autocomplete="off" placeholder="请输入保养次数" class="layui-input">
            </div>
        </div>
    </div>


    </div>
    <%--//保养提交--%>
    <div class="layui-form-item" id="subb">
        <button class="layui-btn" type="button" lay-submit lay-filter="demoupd" id="upsub" style="margin-left: 20px;">提交</button>
    </div>
</form>


<form class="layui-form" action="" id="updatecarForm" style="display:none" lay-filter="update" enctype="multipart/form-data">
    <div class="layui-form-item" style="margin-top: 4px;">
        <label class="layui-form-label">车辆编号</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <input type="text" name="CarId" lay-verify="description" autocomplete="off" placeholder="" class="layui-input" disabled="disabled">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">账户</label>
        <div class="layui-input-block">
            <div class="layui-input-inline">
                <input type="text" name="account" lay-verify="title" autocomplete="off" placeholder="请输入账户" class="layui-input">
            </div>
        </div>
    </div>


    </div>
    <%--//车辆信息提交--%>
    <div class="layui-form-item" id="subb">
        <button class="layui-btn" type="button" lay-submit lay-filter="carupd" id="upsub" style="margin-left: 20px;">提交</button>
    </div>
</form>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container" style="margin-top: 4px;margin-left: 4px;">
        <button class="layui-btn layuiadmin-btn-list" data-type="batchdel">删除</button>
        <button class="layui-btn layuiadmin-btn-list" data-type="add" onclick="addonclick()">添加车辆信息</button>
        <button class="layui-btn layuiadmin-btn-list" data-type="add" onclick="addonclick1()">添加保养信息</button>

        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    </div>
</script>

<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script type="text/javascript">
    layui.use('table', function(){
        var form  = layui.form;
        var table = layui.table;
        var pagecount;
        page();
        function page(){
            $.ajax({
                type: "get", //指定提交的类型 get对应 doGet()方法，post--->doPost()犯法
                url: 'http://localhost:8081/back/CountServlet',    //传输地址的URL
                dataType:'json',
                success: function (data)
                {
                    pagecount = data.count;
                    console.log(pagecount);
                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(typeof(errorThrown));
                }
            });
        }
        table.render({
            elem: '#test'
            ,url:'http://localhost:8081/back/RepServlet'
            ,method:"get"
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'account', title:'用户名', width:200, edit: 'text'}
                <!-- ,{field:'password', title:'密码', width:150, edit: 'text'}-->
                ,{field:'CarId', title:'车辆编号', width:150, edit: 'text'}
                ,{field:'model', title:'车辆型号', width:150, edit: 'text'}
                ,{field:'produyear', title:'购买年份', width:150, edit: 'text'}
                ,{field:'buydate', title:'购买日期', width:200,edit: 'text',}
                ,{field:'recentCareDay', title:'近期保养日期', width:100,edit: 'text',}
                ,{field:'CareTime', title:'保养次数', width:170,edit: 'text',}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:170}
            ]]
            ,page: true
            ,limit:10
            ,response:{
                statusName: 'status' //规定数据状态的字段名称，默认：code
                ,dataName: 'rows' //规定数据列表的字段名称，默认：data
            }
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "status": res[0].status,   //解析接口状态
                    "message":res[1].message,  //解析提示文本
                    "count": pagecount,       //解析数据长度
                    "rows": res[3].rows.item  //解析数据列表
                };
            }

        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });
        var layer_index;

        var account1;
        var upid;
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            upid = data.id;

            if(obj.event === 'del'){
                layer.confirm('确认要删除吗?', {icon: 3, title:'删除'}, function(index){
                    $.ajax({
                        url:'/back/RepDelServlet?action=removetmp&id='+data.CarId,
                        method:'get',
                        data:data.field,
                        dataType:'JSON',
                        success:function(res){
                            if(res.status='0'){
                                console.log(res);
                                layer.msg("删除成功");
                                page();
                                table.reload('test', {
                                    url:'http://localhost:8081/back/RepServlet'
                                });
                            }
                            else
                                layer.msg("删除失败");
                        },
                        error:function (data) {
                            layer.msg("网络错误");
                        }
                    }) ;
                    layer.close(layer_index);
                });//编辑保养信息
            } else if(obj.event === 'update'){
                form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "account": data.account // "name": "value"
                    ,"CarId":data.CarId
                    ,"recentCareDay": data.recentCareDay
                    ,"CareTime": data.CareTime
                });
                console.log(data.account);
                layer_index= layer.open({
                    type: 1,
                    title: "修改",
                    area: ['400px', '350px'],
                    content:$("#updateForm"),
                    cancel: function(){
                        layer.close(layer_index);
                        $("#updateForm")[0].reset();
                    }
                });
                table.reload('test', {
                });
            }
            //编辑车辆信息
            else if(obj.event === 'updateCar'){
                form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "CarId":data.CarId
                    ,"account": data.account // "name": "value"
                });
                console.log(data.account);
                layer_index= layer.open({
                    type: 1,
                    title: "修改",
                    area: ['400px', '350px'],
                    content:$("#updatecarForm"),
                    cancel: function(){
                        layer.close(layer_index);
                        $("#updatecarForm")[0].reset();
                    }
                });
                table.reload('test', {
                });
            }
        });
        form.on('submit(demoupd)', function(data){
            console.log(JSON.stringify(data.field));
            $.ajax({
                url:'/back/RepUpdServlet?id='+upid,
                method:'get',
                data:data.field,
                dataType:'JSON',
                success:function(res){
                    if(res.status='0'){
                        console.log(res);
                        layer.msg("修改成功");
                        $("#updateForm")[0].reset();
                        form.render();
                        table.reload('test', {
                        });
                        page();
                    }
                    else
                        layer.msg("修改失败");
                    $("#updateForm")[0].reset();
                    $('#demoe2').attr('src', "");
                    form.render();
                },
                error:function (data) {
                    layer.msg("网络错误");
                    $("#updateForm")[0].reset();
                    $('#demoe2').attr('src', "");
                    form.render();
                }
            }) ;
            layer.close(layer_index);
            page();
            table.reload('test', {
                url:'http://localhost:8081/back/RepServlet'
            });
        });
        form.on('submit(carupd)', function(data){
            console.log(JSON.stringify(data.field));
            $.ajax({
                url:'/back/RepUpdCarServlet?id='+upid,
                method:'get',
                data:data.field,
                dataType:'JSON',
                success:function(res){
                    if(res.status='0'){
                        console.log(res);
                        layer.msg("修改成功");
                        $("#updatecarForm")[0].reset();
                        form.render();
                        table.reload('test', {
                        });
                        page();
                    }
                    else
                        layer.msg("修改失败");
                    $("#updatecarForm")[0].reset();
                    $('#demoe2').attr('src', "");
                    form.render();
                },
                error:function (data) {
                    layer.msg("网络错误");
                    $("#updatecarForm")[0].reset();
                    $('#demoe2').attr('src', "");
                    form.render();
                }
            }) ;
            layer.close(layer_index);
            page();
            table.reload('test', {
                url:'http://localhost:8081/back/RepServlet'
            });
        });
    });
    function addonclick(){
        layer.open({
            type: 2
            ,title: '添加保养信息'
            ,content: 'listform.jsp'
            ,maxmin: true
            ,area: ['490px', '390px']
            ,yes: function(index, layero){
                //点击确认触发 iframe 内容中的按钮提交
                var submit = layero.find('iframe').contents().find("#layuiadmin-app-form-submit");
                submit.click();
            }
        });
    }

    function addonclick1(){
        layer.open({
            type: 2
            ,title: '添加车辆信息'
            ,content: 'listformCar.jsp'
            ,maxmin: true
            ,area: ['490px', '390px']
            ,yes: function(index, layero){
                //点击确认触发 iframe 内容中的按钮提交
                var submit = layero.find('iframe').contents().find("#layuiadmin-app-form-submit");
                submit.click();
            }
        });
    }






</script>

<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test5'
            ,type: 'datetime'
            ,theme: 'molv'
        });
    });
    ;
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#testup'
            ,type: 'datetime'
            ,theme: 'molv'
        });
    });
    ;
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="updateCar" onclick="">车辆</a>
    <a class="layui-btn layui-btn-xs" lay-event="update" onclick="">保养</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" onclick="">删除</a>
</script>
<script type="text/html" id="imgtemp">
    <img src="{{d.imgurl}}" style="width:60px;"/>
</script>
</body>
</html>
<%--外键就是指另外表中的主键 。 --%>