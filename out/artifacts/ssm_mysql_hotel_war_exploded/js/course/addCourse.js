
var $;
var $form;
var form;
layui.config({
    base:"/js/"
}).use(['form','layer','jquery'],function () {
    var layer=parent.layer===undefined?layui.layer:parent.layer,
        laypage=layui.laypage;
    $=layui.jquery;
    form=layui.form;
    //自定义验证规则 这里相当于重写 那么jsp中的lay-verify="pass" "repass"将采用下面的规则


    form.on("submit(addCourse)",function (data) {
        var index=top.layer.msg('数据提交中，请稍候。',{icon:16,time:false,shade:0.8});
        var msg;
        $.ajax({
            type: "post",
            url:ctx+"/course/insCourse",
            data:data.field,
            dataType:"json",
            success:function (d) {
                if(d.code==0)
                {
                    msg="添加成功!";
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
            top.layer.close(index);//点击提交后2秒关闭上面的弹出框
            top.layer.msg(msg); //弹出新的信息提示框
            layer.closeAll("iframe"); //关闭iframe层 比如我们打开的 编辑管理员的这个窗口
            parent.location.reload();//其父窗口是 管理员列表 刷新 重新加载
            /*
            //下面这个延时 有时候执行不了
            setTimeout(function () {  //添加一个 延时 否则接着刷新 看不到提示的信息
                //刷新父页面
                parent.location.reload();
            },1000);
            */
        },2000);

       // setTimeout(function () {

         //   parent.location.reload();//其父窗口是 管理员列表 刷新 重新加载

      //  },2500);

        return false;
    })
});


