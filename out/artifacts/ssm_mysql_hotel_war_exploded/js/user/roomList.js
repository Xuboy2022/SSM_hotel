/**
 * 简单来说： == 代表相同， ===代表严格相同, 为啥这么说呢，

 这么理解： 当进行双等号比较时候： 先检查两个操作数数据类型，
 如果相同， 则进行===比较， 如果不同， 则愿意为你进行一次类型转换，
 转换成相同类型后再进行比较， 而===比较时， 如果类型不同，直接就是false.
 *
 * */

layui.config({
    base:"/js/"
}).use(['form','layer','jquery','laypage','table','laytpl'],function () {
    var form=layui.form,table=layui.table;
    layer=parent.layer===undefined ? layui.layer:parent.layer;
        laypage=layui.laypage;
    $=layui.jquery;

    //表格数据
    table.render({
        id: 'roomList',//设定容器唯一 id。id 是对表格的数据操作方法上是必要的传递条件，它是表格容器的索引，
        elem: '#roomList',//指定原始 table 容器的选择器或 DOM，方法渲染方式必填
        url:ctx+'/room/getRoomList', //数据接口 默认会自动传递两个参数：?page=1&limit=30 page 代表当前页码、limit 代//表
        // 每页数据量  该参数可通过 添加一个request参数自定义 下面有limit：10 所以发送的是 1 10

        cellMinWidth:80,
        // toolbar:true, //开启表格头部工具栏区域，
        // toolbar: true 仅开启工具栏，开启后 有打印输出功能
        //但是 导出excel功能不完善 所以不开启了
        limit:10, //每页显示的条数
        limits:[10,20,30,40], //每页条数的选择项
        cols:[[ //设置表头 值是一个二维数组
            {field:'room_num',title:'房间编号',sort:true,width:80,align:'center'}, //允许排序
            {field:'photo_path',title:'房间图片',align:'center',width:110,templet: "#imgtmp"},
            {field:'area',title:'房间面积 /㎡',align:'center'},
            {field:'price',title:'每晚价格/元',align:'center'},
            {field:'catalog',title:'房间类别',align:'center',templet: '<div>{{d.roomCatalog.catalog}}</div>'},
            {field:'status',title:'房间状态',templet:'#statusTpl',align:'center'},//templet 自定义列模板 #sexTpl是绑定的选择器
            // {field: 'courseName', title : '教授课程', width:160,templet: '<div>{{d.courseList[0].courseName}}</div>>'},
            {field:'intro',title:'房间简介',align:'center'},
            {title:'查看评论及预订',toolbar:'#barEdit', align:'center'}
        ]],
        page:true //开启分页
    });

    //监听工具条
    table.on('tool(test)',function (obj)
     { //test 是 table 原始容器的属性 lay-filter="对应的值
        var data=obj.data ;//data获得当前行数据
        if(obj.event==='comment') //评论详情
        {
            layer.open({ //发送请求 controller返回一个jsp页面 加载在这个open的弹出窗口中
                type:2,
                title:"查看房间评论",
                area:['420px','580px'],
                content:ctx+"/user/comments/"+data.room_info_id  // 发送的是/admin/editAdmin/4
            })
        }
        else if(obj.event==='reservation') //预定
        {
            layer.open({ //发送请求 controller返回一个jsp页面 加载在这个open的弹出窗口中
                type:2,
                title:"填写预订信息",
                area:['420px','580px'],
                content:ctx+"/user/reservation/"+data.room_num+"/"+data.room_info_id  // 发送的是/admin/editAdmin/4
            })
        }
    });
});


// 格式化时间
function formatTime(datetime, fmt) {
    if (datetime == null || datetime == 0) {
        return "";
    }
    if (parseInt(datetime) == datetime) {
        if (datetime.length == 10) {
            datetime = parseInt(datetime) * 1000;
        } else if (datetime.length == 13) {
            datetime = parseInt(datetime);
        }
    }
    datetime = new Date(datetime);
    var o = {
        "M+" : datetime.getMonth() + 1, // 月份
        "d+" : datetime.getDate(), // 日
        "h+" : datetime.getHours(), // 小时
        "m+" : datetime.getMinutes(), // 分
        "s+" : datetime.getSeconds(), // 秒
        "q+" : Math.floor((datetime.getMonth() + 3) / 3), // 季度
        "S" : datetime.getMilliseconds()
        // 毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (datetime.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for ( var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1,
                (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
                    .substr(("" + o[k]).length)));
    return fmt;
}
