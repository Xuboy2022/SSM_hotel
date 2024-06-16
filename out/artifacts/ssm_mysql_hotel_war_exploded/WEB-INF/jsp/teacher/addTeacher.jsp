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
        <label class="layui-form-label ">教师姓名</label>
        <div class="layui-input-block">
            <input type="text" id="teacherName" class="layui-input"
                   lay-verify="required" placeholder="请输入教师姓名" name="teacherName" value="">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女" checked>
                <input type="radio" name="sex" value="2" title="保密">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-block">
            <input type="text" id="birthday" class="layui-input" autocomplete="off"
                   name="birthday" lay-verify="date" placeholder="yyyy-MM-dd"
            >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">学历选择</label>
        <div class="layui-input-inline">
            <select name="grade">
                <option value="1" selected>本科</option>
                <option value="2" selected>研究生</option>
                <option value="3" selected>博士</option>
                <option value="4" selected>博士后</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职称选择</label>
        <div class="layui-input-inline">
            <select name="rank">
                <option value="1" selected>副教授</option>
                <option value="2" selected>教授</option>
                <option value="3" selected>副高</option>
                <option value="4" selected>正高</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入职日期</label>
        <div class="layui-input-block">
            <input type="text" id="jobDate" class="layui-input" autocomplete="off"
                   name="jobDate" lay-verify="date" placeholder="yyyy-MM-dd"
            >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label ">所属院系</label>
        <div class="layui-input-block">
            <input type="text" id="college" class="layui-input"
                   lay-verify="required" placeholder="请输入所属院系" name="college" value="">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addTeacher">立即保存</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/teacher/addTeacher.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>