<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx }/css/zTreeStyle/zTreeStyle.css"  media="all" />
    <script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx }/js/jquery.ztree.all.js"></script>
    <script>
        var ctx = "${ctx}";
    </script>
</head>

<style type="text/css">
    .comment {
        padding-left:20px;
    }
    .comment_list {
        padding-left:15px;
        padding-top:20px;
        margin:0 auto;
    }
    .comment_details {
        float:left;
    }
    .comment_content {
        padding-left:65px;
        margin-top:10px;
        font-size:16px;
    }
    .comment_add_or_last {

        margin:0 auto;
        clear: both;
        height:40px;
        background: #F0F0F0;
        text-align: center;
        line-height: 40px;   //行高（与div保持同高，垂直居中写法）
    }
    .imgdiv{
        float:left;

    }
    .imgcss {
        width:50px;
        height:50px;
        border-radius: 50%;
    }
    .comment_name {
        margin-left:10px;
        color:#3D9EEA;
        font-size:15px;
        font-weight: bolder;
    }
    .layui-icon {
        font-size: 10px;
        color: grey;
    }
    .del {
        margin-left: 55px;
    }
</style>
<body >

<script>

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
            window.alert(fmt);
            return fmt;
    }


</script>

<div class="comment_list">
    <h2 > 全部评论</h2>
    <hr>
    <!--
    <div class="comment">
        <div class="imgdiv"><img class="imgcss"  src="./images/user.jpg"/></div>
        <div class="conmment_details">
            <span class="comment_name">大白 </span>     <span>22分钟前</span>
            <div class="comment_content" >  感觉林丹越来越帅了，好棒</div>
            <div class="del"> <i class="icon layui-icon"  >赞(164)</i>
                <a class="del_comment" data-id="1"> <i class="icon layui-icon" >删除</i></a>
            </div>
        </div>
        <hr>
    </div>
    <div class="comment">
        <div class="imgdiv"><img class="imgcss"  src="./images/user.jpg"/></div>
        <div class="conmment_details">
            <span class="comment_name">大白 </span>     <span>22分钟前</span>
            <div class="comment_content" >  感觉林丹越来越帅了，好棒</div>
            <div class="del"> <i class="icon layui-icon"  >赞(164)</i>
                <a class="del_comment" data-id="1"> <i class="icon layui-icon" >删除</i></a>
            </div>
        </div>
        <hr>
    </div>
    <div class="comment">
        <div class="imgdiv"><img class="imgcss"  src="./images/user.jpg"/></div>
        <div class="conmment_details">
            <span class="comment_name">大白 </span>     <span>22分钟前</span>
            <div class="comment_content" >  感觉林丹越来越帅了，好棒</div>
            <div class="del"> <i class="icon layui-icon"  >赞(164)</i>
                <a class="del_comment" data-id="1"> <i class="icon layui-icon" >删除</i></a>
            </div>
        </div>
        <hr>
    </div>
</div>



<span ><script type="text/javascript">formatTime('${comment.pub_date}',"yyyy-MM-dd hh:mm:ss");</script></span>

-->


    <c:forEach items="${commentList}" var="comment">

    <div class="comment">
        <div class="imgdiv"><img class="imgcss"  src="../../img/${comment.user.photo_path}"/></div>
        <div class="conmment_details">
            <span class="comment_name"> ${comment.user.username} </span>    
            <span>评论时间:<fmt:formatDate type="both"
                                     dateStyle="medium" timeStyle="medium"
                                     value="${comment.pub_date}"/></span>
             <div class="comment_content" > ${comment.content} </div>
        </div>
        <hr>
    </div>

    </c:forEach>







<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/comment/comment.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>