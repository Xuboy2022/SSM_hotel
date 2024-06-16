<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>编辑教师</title>
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
    <input type="hidden" name="id" value="${teacher.id}"/>

    <div class="layui-form-item">
        <label class="layui-form-label ">教师姓名</label>
        <div class="layui-input-block">
            <input type="text" id="teacherName" class="layui-input"
                   lay-verify="required" placeholder="请输入教师姓名" name="teacherName" value="${teacher.teacherName}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <c:if test="${teacher.sex==0}">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女" checked>
                <input type="radio" name="sex" value="2" title="保密">
            </c:if>
            <c:if test="${teacher.sex==1}">
                <input type="radio" name="sex" value="1" title="男" checked>
                <input type="radio" name="sex" value="0" title="女" >
                <input type="radio" name="sex" value="2" title="保密">
            </c:if>
            <c:if test="${teacher.sex==2}">
                <input type="radio" name="sex" value="1" title="男">
                <input type="radio" name="sex" value="0" title="女" >
                <input type="radio" name="sex" value="2" title="保密" checked>
            </c:if>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">出生日期</label>
        <div class="layui-input-block">
            <input type="text" id="birthday" class="layui-input" autocomplete="off"
                   name="birthday" lay-verify="date" placeholder="yyyy-MM-dd"
                   value="<fmt:formatDate value="${teacher.birthday}" pattern="yyyy-MM-dd"/>"
            >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">学历选择</label>
        <div class="layui-input-inline">
            <select name="grade">
                <option value="1"<c:if test="${teacher.grade==1}">selected</c:if>>本科</option>
                <option value="2"<c:if test="${teacher.grade==2}">selected</c:if>>研究生</option>
                <option value="3"<c:if test="${teacher.grade==3}">selected</c:if>>博士</option>
                <option value="4"<c:if test="${teacher.grade==4}">selected</c:if>>博士后</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职称选择</label>
        <div class="layui-input-inline">
            <select name="rank">
                <option value="1"<c:if test="${teacher.rank==1}">selected</c:if>>副教授</option>
                <option value="2"<c:if test="${teacher.rank==2}">selected</c:if>>教授</option>
                <option value="3"<c:if test="${teacher.rank==3}">selected</c:if>>副高</option>
                <option value="4"<c:if test="${teacher.rank==4}">selected</c:if>>正高</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">入职日期</label>
        <div class="layui-input-block">
            <input type="text" id="jobDate" class="layui-input" autocomplete="off"
                   name="jobDate" lay-verify="date" placeholder="yyyy-MM-dd"
                   value="<fmt:formatDate value="${teacher.jobDate}" pattern="yyyy-MM-dd"/>"
            >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label ">所属院系</label>
        <div class="layui-input-block">
            <input type="text" id="college" class="layui-input"
                   lay-verify="required" placeholder="请输入所属院系" name="college" value="${teacher.college}">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="updTeacher">立即保存</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/teacher/editTeacher.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>