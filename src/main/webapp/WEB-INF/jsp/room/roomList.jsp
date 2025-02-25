<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/page/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="${ctx }/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx }/css/font_eolqem241z66flxr.css"
          media="all" />
    <link rel="stylesheet" href="${ctx }/css/list.css" media="all" />
    <link rel="stylesheet" href="${ctx }/css/main.css" media="all" />

    <script>
        var ctx = "${ctx}";
    </script>
    <style type="text/css">
        .layui-table-cell {
            font-size:14px;
            padding:0 5px;
            height: 100%;
            max-width: 100%;
            overflow:visible;
            text-overflow:inherit;
            white-space:normal;
            word-break: break-all;
        }
    </style>
    <!--这个单元格样式 可以使单元格超出部分自动换行 前提是下面 table 要用
    layui-table-cell 这个样式 -->


</head>
<body class="childrenBody"><!--这个保证内容不会铺满父窗口但是必须要加入main.css-->
<!--blockquote就是引入一种样式-->
<blockquote class="layui-elem-quote list_search">
    <div class="layui-inline">
        <!--&#xe608就是 一个加号的图标-->
        <a class="layui-btn layui-btn-normal roomAdd_btn"><i class="layui-icon">&#xe608;</i>添加房间 </a>
    </div>
</blockquote>

#***************
<blockquote class="layui-elem-quote news_search">
    <form class="layui-form">
        <div class="layui-inline">
            <div class="layui-input-inline">
                <input type="text" id="room_num" value="" placeholder="请输入房屋编号"
                       class="layui-input search_input " style="margin-left: 10px">
            </div>
            <div class="layui-input-inline">
                <input type="text" id="room_catalog_id" value="" placeholder="请输入房屋类别"
                       class="layui-input search_input " style="margin-left: 10px">
            </div>


            <div style="margin-left: 10px">
                <a style="margin-left: 10px" class="layui-btn search_btn" lay-submit="" data-type="search"
                   lay-filter="search">查询</a>
            </div>
        </div>
    </form>
</blockquote>
#***************
<table class="layui-table layui-table-cell" id="roomList" lay-filter="test"></table>  <!--加载管理员列表数据-->
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/room/roomList.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
<!--
当type属性为text/html的时候，<script>片断中定义一个被JS调用的代码，
代码不会在页面上显示，在页面渲染的时候，浏览器不会读取script标签中的html代码
-->

<script type="text/html" id="imgtmp">
    <img src="../../img/{{d.photo_path}}" />
</script>

<script type="text/html" id="statusTpl">
    {{#  if(d.status==0){                                 }}
    <span style="color: #0000ff">空闲</span>
    {{#   }  else if(d.status==1){                        }}
    <span style="color: #FF5722">已预订</span>
    {{#   }  else if(d.status==2){                        }}
    <span style="color: #ad1267">已入住</span>
    {{#   }else {                                         }}
    <span style="color: #1AA094">其他</span>
    {{#      }                                             }}
</script>

<script type="text/html" id="barEdit">
    <a class="layui-btn layui-btn-sm" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/room/roomList.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
</body>
</html>