<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑房间</title>
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

    <input type="hidden" id="photo_path"  name="photo_path" value="${roomInfo.photo_path}"/>
    <input type="hidden" id="room_info_id"  name="room_info_id" value="${roomInfo.room_info_id}"/>

    <div class="layui-form-item">
        <label class="layui-form-label">房间号</label>
        <div class="layui-input-block">
            <input type="text" id="room_num" class="layui-input userName"
                   lay-verify="required" placeholder="请输入房间号" name="room_num" value="${roomInfo.room_num}">
        </div>
    </div>

    <div class="layui-upload">
        <label for="room_num" class="layui-form-label">
            <span class="x-red">*</span>房间主图</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="test1">上传主图</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1" width="100px" height="100px">
                <p id="demoText"></p>
            </div>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">面积</label>
        <div class="layui-input-block">
            <input type="text" id="area" class="layui-input userName"
                   lay-verify="required" placeholder="请输入房间面积" name="area" value="${roomInfo.area}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">每晚价格</label>
        <div class="layui-input-block">
            <input type="text" id="price" class="layui-input userName"
                   lay-verify="required" placeholder="请输入每晚价格" name="price" value="${roomInfo.price}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">房间简介</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入房间简介" class="layui-textarea linksDesc" lay-verify="required"
                      name="intro">${roomInfo.intro}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">房间类型</label>
        <div class="layui-input-block">
            <select name="room_catalog_id">
                <option value="">请选择</option>
                <c:forEach items="${roomCatalogs}" var="r">
                    <c:if test="${roomInfo.room_catalog_id==r.room_catalog_id}">
                        <option value="${r.room_catalog_id}" selected>${r.catalog}</option>
                    </c:if>
                    <c:if test="${roomInfo.room_catalog_id!=r.room_catalog_id}">
                        <option value="${r.room_catalog_id}">${r.catalog}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">房间状态</label>
        <div class="layui-input-block">
            <c:if test="${roomInfo.status==0}">
                <input type="radio" name="status" value="1" title="已预订">
                <input type="radio" name="status" value="0" title="空闲" checked>
                <input type="radio" name="status" value="2" title="已入住">
            </c:if>
            <c:if test="${roomInfo.status==1}">
                <input type="radio" name="status" value="1" title="已预订" checked>
                <input type="radio" name="status" value="0" title="空闲" >
                <input type="radio" name="status" value="2" title="已入住">
            </c:if>
            <c:if test="${roomInfo.status==2}">
                <input type="radio" name="status" value="1" title="已预订">
                <input type="radio" name="status" value="0" title="空闲" >
                <input type="radio" name="status" value="2" title="已入住" checked>
            </c:if>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="editRoom">立即提交</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/room/editRoom.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>