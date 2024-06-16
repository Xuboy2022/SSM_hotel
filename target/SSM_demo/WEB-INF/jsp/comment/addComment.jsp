<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加评论</title>
    <link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
    <script>
        <%-- js全局变量  js文件中都可以直接应用这个变量--%>
        var ctx="${ctx}";
    </script>
    <script type="text/css">
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
    </script>
</head>
<body class="childrenBody">
<form class="layui-form" style="width: 80%;" id="aaf">

    <input type="hidden" id="room_info_id"  name="room_info_id" value="${roomInfo.room_info_id}"/>
    <input type="hidden" id="user_id"  name="user_id" value="${user_id}"/>

    <div class="layui-form-item">
        <label class="layui-form-label">房间号</label>
        <div class="layui-input-block">
            <input type="text" id="room_num" class="layui-input userName"
                   lay-verify="required"  disabled="disabled"
                   name="room_num" value="${roomInfo.room_num}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">评论详情</label>
        <div class="layui-input-block">
            <textarea placeholder="请填写评论" class="layui-textarea linksDesc" lay-verify="required"
                      name="content"></textarea>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addComment">立即提交</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/comment/addComment.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
