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
<form class="layui-form" action="" id="updateForm" style="display:none" lay-filter="update" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">题目</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入题目" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">摘要</label>
        <div class="layui-input-block">
            <input type="text" name="description" lay-verify="description" autocomplete="off" placeholder="请输入摘要" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" id="selectnameup">列表</label>
        <div class="layui-input-block">
            <select id="serviceup" name="service" lay-verify="required"  class="select">
                <option value="0" >请选择列表</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea name="content" placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
        <input type="hidden" name="images" class="image">
        <div class="layui-upload" id="imges2">
            <button type="button" class="layui-btn" id="testupdate">选择图片</button>
            <div class="layui-upload-list" style="margin:0px">
                <img class="layui-upload-img" id="demoeupdate">
                <p id="demoTextup"></p>
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="margin-top:20px">
        <label class="layui-form-label">选择时间</label>
        <input name="createtime" type="text" class="layui-input" id="testup" placeholder="请选择时间">
    </div>
    </div>
    <div class="layui-form-item" id="subb">
        <button class="layui-btn" type="button" lay-submit lay-filter="demo22" id="upsub">提交</button>
    </div>
</form>

<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    </div>
</script>

<script src="./layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;
        var pagecount;
        page();
        function page(){
            $.ajax({
                type: "get", //指定提交的类型 get对应 doGet()方法，post--->doPost()犯法
                url: 'http://localhost:8080/Welcome/CountServlet',    //传输地址的URL
                dataType:'json',
                success: function (data)
                {
                    pagecount = data.count;
                },
                error:function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(typeof(errorThrown));
                }
            });
        }
        console.log(pagecount);
        table.render({
            elem: '#test'
            ,url:'http://localhost:8080/Welcome/mycar'
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
                ,{field:'CarId', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
                ,{field:'account', title:'用户名', width:200, edit: 'text'}
                <!-- ,{field:'password', title:'密码', width:150, edit: 'text'}-->
                ,{field:'model', title:'型号', width:150, edit: 'text'}
                ,{field:'engine', title:'发动机型号', width:170,edit: 'text',}
                ,{field:'produyear', title:'出厂日期', width:100,edit: 'text',}
                ,{field:'buydate', title:'购买日期',width:180}
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
        var layer_index

        var upid;


        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            upid = data.id;
            console.log(data.imgurl)
            if(obj.event === 'del'){
                layer.confirm('确认要删除吗?', {icon: 3, title:'删除'}, function(index){
                    $.ajax({
                        url:'/Servletqcby/DeleteServlet?action=removetmp&id='+upid,
                        method:'post',
                        data:data.field,
                        dataType:'JSON',
                        success:function(res){
                            if(res.status='0'){
                                console.log(res);
                                layer.msg("删除成功");
                                table.reload('test', {
                                    url: '/Servletqcby/ContentServlet?title=&description=&channelid='
                                });
                                page();
                            }
                            else
                                layer.msg("删除失败");
                        },
                        error:function (data) {
                            layer.msg("网络错误");
                        }
                    }) ;
                    layer.close(layer_index);

                });
            } else if(obj.event === 'update'){
                form.val("update", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                    "title": data.title // "name": "value"
                    ,"description":data.description
                    ,"service": data.channelid
                    ,"content": data.content
                    ,"logins": data.logins
                    ,"images": data.imgurl
                    ,"createtime": data.createtime
                });
                $('#demoeupdate').attr('src',data.imgurl);
                layer_index= layer.open({
                    type: 1,
                    title: "修改",
                    area: ['400px', '350px'],
                    content:$("#updateForm"),
                    cancel: function(){
                        layer.close(layer_index);
                        $("#updateForm")[0].reset();
                        $('#demoeupdate').attr('src', "");
                    }
                });
                table.reload('test', {
                    url: '/Servletqcby/ContentServlet?title=&description=&channelid='
                });
            }
        });
    });
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
    <a class="layui-btn layui-btn-xs" lay-event="update" onclick="">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" onclick="">删除</a>
</script>
<script type="text/html" id="imgtemp">
    <img src="{{d.imgurl}}" style="width:60px;"/>
</script>
</body>
</html>