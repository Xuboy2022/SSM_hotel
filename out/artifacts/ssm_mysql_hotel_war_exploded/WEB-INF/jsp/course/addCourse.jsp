<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>添加课程</title>
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
    <div class="layui-form-item">
        <label class="layui-form-label ">课程名称</label>
        <div class="layui-input-block">
            <input type="text" id="courseName" class="layui-input"
                   lay-verify="required" placeholder="请输入课程名称" name="courseName" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">授课老师</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" id="teacherName" class="layui-input"
                   lay-verify="required" placeholder="请输入授课老师" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课地点</label>
        <div class="layui-input-block">
            <input type="text" name="place" id="place" class="layui-input"
                   lay-verify="required" placeholder="请输入上课地点" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">课程类型</label>
        <div class="layui-input-block">
            <input type="text" name="lessonType" class="layui-input"
                   lay-verify="required" placeholder="请输入课程类型" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程学分</label>
        <div class="layui-input-block">
            <input type="text" name="credit" class="layui-input"
                   lay-verify="required" placeholder="请输入课程学分" value=""">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addCourse">立即提交</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/course/addCourse.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>