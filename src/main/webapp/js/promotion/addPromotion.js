/**

 jQuery的serialize()方法通过序列化表单值，创建URL编码文本字符串，
 我们就可以选择一个或多个表单元素，也可以直接选择form将其序列化，如：

 <form action="">
 First name: <input type="text" name="FirstName" value="Bill" /><br />
 Last name: <input type="text" name="LastName" value="Gates" /><br />
 </form>
 $(document).ready(function(){
    console.log($("form").serialize()); // FirstName=Bill&LastName=Gates
});
 这样，我们就可以把序列化的值传给ajax()作为url的参数，轻松使用ajax()提交form表单了，
 而不需要一个一个获取表单中的值然后传给ajax()
 */




var $;
layui.config({
    base:"/js/"
}).use(['form','layer','jquery'],function () {
    var form=layui.form,
        layer=parent.layer===undefined?layui.layer:parent.layer,
        laypage=layui.layPage;
    $=layui.jquery;
    form.on("submit(addPromotion)",function (data) {
        //弹出loading
        var index=top.layer.msg('数据提交中,请稍候',{icon:16,time:false,shade:0.8});
        setTimeout(function () {
            $.ajax({
                type: "POST",
                async:false,//当async属性的值为false时是同步的，Ajax请求将整个浏览器锁死，
                // 只有ajax请求返回结果后，才执行ajax后面的语句。当async属性的值为true时是异步的，
                // 即不会等待ajax请求返回的结果，会直接执行ajax后面的语句。
                url:ctx+"/promotion/insPromotion",
                data:$("#arf").serialize()//最上面有解释  用data.field 可以 但是只能将Role对应
                // 属性的值传过去 jsp中隐藏的m 不能传过去 即使 controller中updateRole(Role role,String m)
                //有参数m也不行  使用data:$("#arf").serialize() 可以将所有的参数传过去包括 m
                //如果非要使用data:data.field,  可以将m放在url后面 这样controller中函数取值参数也要变

            });
            top.layer.close(index);
            top.layer.msg("酒店活动添加成功", { shift: -1, time: 2000 },function () {
                parent.location.reload();  //shift: -1表示提示信息不抖动 2秒后调用回调函数
            });

        },2000);
        return false;
    })
});















