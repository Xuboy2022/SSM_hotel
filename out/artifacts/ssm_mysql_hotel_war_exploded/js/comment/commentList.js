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
        id: 'commentList',//设定容器唯一 id。id 是对表格的数据操作方法上是必要的传递条件，它是表格容器的索引，
        elem: '#commentList',//指定原始 table 容器的选择器或 DOM，方法渲染方式必填
        url:ctx+'/admin/getCommentList', //数据接口 默认会自动传递两个参数：?page=1&limit=30 page 代表当前页码、limit 代//表
        // 每页数据量  该参数可通过 添加一个request参数自定义 下面有limit：10 所以发送的是 1 10

        cellMinWidth:80,
        // toolbar:true, //开启表格头部工具栏区域，
        // toolbar: true 仅开启工具栏，开启后 有打印输出功能
        //但是 导出excel功能不完善 所以不开启了
        limit:10, //每页显示的条数
        limits:[10,20,30,40], //每页条数的选择项
        cols:[[ //设置表头 值是一个二维数组
            {field:'content',title:'评论内容',width:300,align:'center'},

            { field: 'pub_date', title : '评论时间',sort:true,width:250,templet:'<div>{{ formatTime(d.pub_date,"yyyy-MM-dd hh:mm:ss")}}</div>'},
            { field: 'room_num', title : '房间号',width:80,templet: '<div>{{d.roomInfo.room_num}}</div>'},
            { field: 'price', title : '房间价格/晚/元',width:130,templet: '<div>{{d.roomInfo.price}}</div>'},

            { field: 'username', title : '评论人', width:120,templet: '<div>{{d.user.username}}</div>'},
            {title:'删除评论',toolbar:'#barEdit', align:'center',width:120}
        ]],
        page:true //开启分页
    });

    //监听工具条
    table.on('tool(test)',function (obj)
    { //test 是 table 原始容器的属性 lay-filter="对应的值
        var data=obj.data ;//data获得当前行数据
        if(obj.event==='delete') //删除评论
        {

             layer.confirm('确定要删除这条评论吗',function (index) {
                 $.ajax({
                     url:ctx+"/admin/deleteComment/"+data.comment_id,
                     type:"POST",
                     success:function (d) {
                         if(d.code==0)
                         {
                             layer.msg("删除成功",{icon:1});
                             table.reload('commentList',{})
                         }
                         else
                         {
                             layer.msg("删除失败，请检查错误信息",{icon:5});
                         }
                     },
                     error:function () {
                         layer.msg("办理失败，检查sql及输出",{icon:5});
                     }
                 })
                 layer.close(index);
             });
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
