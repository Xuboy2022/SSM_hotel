<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>预定房间</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
    <script>
        var ctx="${ctx}";
    </script>
    <!-- @meida 表示如果文档宽度小于 1240 像素 那么.layui-form-item .layui-inline的宽度等样式改变-->
    <style type="text/css">
        .layui-form-item .layui-inline {
            width: 33.333%;
            float: left;
            margin-right: 0;
        }
        @media ( max-width :1240px) {
            .layui-form-item .layui-inline {
                width: 100%;
                float: none;
            }
        }
    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width: 80%;">
    <!--管理员id 这个是 提交表单时 携带的参数-->
    <input type="hidden" name="user_id" value="${hotel_user.user_id}"/>
    <input type="hidden" name="room_info_id" value="${room_info_id}"/>

    <div class="layui-form-item">
        <label class="layui-form-label ">房间号</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" disabled="disabled" value="${room_num}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">预订人姓名</label>
        <div class="layui-input-block">
            <input type="text" name="check_in_name" id="check_in_name" class="layui-input"
                   disabled="disabled" value="${hotel_user.realname}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="check_in_phone" class="layui-input"
                   disabled="disabled" value="${hotel_user.phone}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">入住日期</label>
        <div class="layui-input-inline">
            <input type="text" id="check_in_time" name="check_in_time" class="layui-input"
                   lay-verify="required" placeholder="请选择入住日期">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">预定天数</label>
        <div class="layui-input-block">
            <input type="number" name="days" class="layui-input"
                   lay-verify="required" placeholder="请选择入住天数">
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="reservation">立即预定</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/user/reservation.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>