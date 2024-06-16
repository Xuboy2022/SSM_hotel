
var $;
var $form;
var form;
layui.config({
    base:"/js/"
}).use(['form','layer','jquery','laydate'],function () {
    var layer=parent.layer===undefined?layui.layer:parent.layer,
        laypage=layui.laypage;
    $=layui.jquery;
    form=layui.form;
    var laydate=layui.laydate;
    var nowTime = new Date().valueOf();

    laydate.render(
        {
            elem:'#check_in_time',
            min : nowTime,
            type:'datetime',//可选择：年、月、日、时、分、秒
        }
    );


    form.on("submit(reservation)",function (data) {
        var index=top.layer.msg('数据提交中，请稍候。',{icon:16,time:false,shade:0.8});
        var msg;
        $.ajax({
            type: "post",
            url:ctx+"/user/insReservation",
            data:data.field,
            dataType:"json",
            success:function (d) {
                if(d.code==0)
                {
                    msg="预定成功!";
                }
                else
                {
                    msg=d.msg;
                }
            },
            error:function (jqXHR, textStatus, errorThrown) {
                layer.alert("获取数据失败! 先检查sql 及 Tomcat Localhost Log 的输出");
            }


        });

        setTimeout(function () {
            top.layer.close(index);

            top.layer.msg(msg,{shift:-1,time:1500},function () {
                layer.closeAll("iframe");
                parent.location.reload();
            });


        },2000);  //在点击提交后2秒执行 setTimeout中的function函数

        return false;
    })
});


