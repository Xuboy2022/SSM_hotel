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
    <script>
        var ctx = "${ctx}";
    </script>
</head>
<body class="childrenBody">
<!--blockquote就是引入一种样式-->
<blockquote class="layui-elem-quote list_search">
    <div class="layui-inline">
        <!--&#xe608就是 一个加号的图标-->
        <a class="layui-btn layui-btn-normal teacherAdd_btn"><i class="layui-icon">&#xe608;</i>添加教师 </a>
    </div>
</blockquote>
<table id="teacherList" lay-filter="test"></table>  <!--加载管理员列表数据-->
<script type="text/javascript" src="${ctx }/layui/layui.js"></script>
<script type="text/javascript" src="${ctx }/js/teacher/teacherList.js"></script>
<script type="text/javascript" src="${ctx }/js/pubilc.js"></script>
<!--
当type属性为text/html的时候，<script>片断中定义一个被JS调用的代码，
代码不会在页面上显示，在页面渲染的时候，浏览器不会读取script标签中的html代码
-->
<script type="text/html" id="sexTpl">
    {{#  if(d.sex==1){                                 }}
    <span style="color: #0000FF">男</span>
    {{#   }  else if(d.sex==0){                        }}
    <span style="color: #FF5722">女</span>
    {{#   }else {                                      }}
    <span style="color: #1AA094">保密</span>
    {{#      }                                          }}
</script>
<script type="text/html" id="gradeTpl">
    {{#  if(d.grade==1){                                 }}
    <span style="color: #0000FF">本科</span>
    {{#   }  else if(d.grade==2){                        }}
    <span style="color: #FF5722">研究生</span>
    {{#   }  else if(d.grade==3){                        }}
    <span style="color: #ad1267">博士</span>
    {{#   }  else if(d.grade==4){                        }}
    <span style="color: #Fd1267">博士后</span>
    {{#   }else {                                      }}
    <span style="color: #1AA094">保密</span>
    {{#      }                                          }}
</script>
<script type="text/html" id="rankTpl">
    {{#  if(d.rank==1){                                 }}
    <span style="color: #0000FF">副教授</span>
    {{#   }  else if(d.rank==2){                        }}
    <span style="color: #FF5722">教授</span>
    {{#   }  else if(d.rank==3){                        }}
    <span style="color: #ad1267">副高</span>
    {{#   }  else if(d.rank==4){                        }}
    <span style="color: #Fd1267">正高</span>
    {{#   }else {                                      }}
    <span style="color: #1AA094">保密</span>
    {{#      }                                          }}
</script>


<script type="text/html" id="barEdit">
    <a class="layui-btn layui-btn-sm" lay-event="edit">
        <i class="layui-icon">&#xe642;</i>
    </a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">
        <i class="layui-icon">&#xe640;</i>
    </a>
</script>
</body>
</html>