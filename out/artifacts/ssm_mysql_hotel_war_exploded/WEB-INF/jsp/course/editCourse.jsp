<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>编辑课程</title>
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
    <input type="hidden" name="id" value="${course.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label ">课程名称</label>
        <div class="layui-input-block">
            <input type="text" id="courseName" class="layui-input"
                   lay-verify="required" placeholder="请输入课程名称" name="courseName" value="${course.courseName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">授课老师</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" id="teacherName" class="layui-input"
                   lay-verify="required" placeholder="请输入授课老师" value="${course.teacherName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">上课地点</label>
        <div class="layui-input-block">
            <input type="text" name="place" id="place" class="layui-input"
                   lay-verify="required" placeholder="请输入上课地点" value="${course.place}">
        </div>
    </div>

    <!--在layui.all中预定义了很多格式  如果上面的lay-verify="required" 那么只是验证非空
        如果写成 lay-verify="email" 那么输入的邮箱没有@ 就会报错
        如果写成 lay-verify="phone" 那么输入的手机号 位数不对 会报错
        layui.all中定义email phone的验证规则 还有很多.....
    -->
    <div class="layui-form-item">
        <label class="layui-form-label">课程类型</label>
        <div class="layui-input-block">
            <input type="text" name="lessonType" class="layui-input"
                   lay-verify="required" placeholder="请输入课程类型" value="${course.lessonType}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程学分</label>
        <div class="layui-input-block">
            <input type="text" name="credit" class="layui-input"
                   lay-verify="required" placeholder="请输入课程学分" value="${course.credit}">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updCourse">立即保存</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/course/editCourse.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>