<%--
  Created by IntelliJ IDEA.
  User: pankx
  Date: 2020/3/27
  Time: 3:01 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<% request.setAttribute("APP_PATH",request.getContextPath());%>
<html>
<head>
    <title>用户列表</title>
<%--    引入jquery--%>
    <script src="${APP_PATH}/static/js/jquery-3.4.1.min.js" type="text/javascript"></script>
<%--    引入bootstrap--%>
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-12"><h1>用户列表</h1></div>
        </div>
        <!--右侧按钮-->
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-offset-10">
                <button class="btn btn-primary">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>

        <!--用户列表信息-->
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-hover" id="user_table">
                    <thead>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>姓别</th>
                        <th>邮箱</th>
                        <th>用户类型</th>
                        <th>操作</th>
                    </thead>
                    <tbody><!--此处显示动态处理的用户信息--></tbody>
                </table>
            </div>
        </div>
        <!--分页-->
        <div class="row">
            <!--分页信息-->
            <div class="col-sm-6" id="page_msg"></div>
            <!--分页导航条-->
            <div class="col-sm-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //页面加载完成发送ajax请求到服务器获取数据
        $(function(){
            get_emps(1);
        });
        //发送ajax请求方法
        function get_emps (pn){
            $.ajax({
                url:"${APP_PATH}/user",
                data:"pn="+ pn,
                type:"GET",
                success:function(data){
                    console.log(data);
                    //解析数据到table
                    user_table(data);
                    //处理显示分布的信息
                    page_msg(data);

                }
            });
        }
        //解析数据到table
        function user_table(data){
            //清空tbody内容再添加
            $("#user_table tbody").empty();
            var users = data.reldata.pageinfo.list;
            console.log(users);
            //遍历返回的数据并解析显示到table
            $.each(users,function(index,item){
                //用户id单元格
                var useridTd = $("<td></td>").append(item.userId);
                //用户名单元格
                var userNameTd = $("<td></td>").append(item.userName);
                //用户姓别单元格
                var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
                //用户邮箱单元格
                var emailTd = $("<td></td>").append(item.email);
                //用户类型单元格
                var uTypeTd = $("<td></td>").append(item.uType.utypeName);
                //编辑按钮
                var edit_btn = $("<button></button>").addClass("btn btn-primary btn-sm").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
                //删除按钮
                var del_btn = $("<button></button>").addClass("btn btn-danger btn-sm").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                var btnTd = $("<td></td>").append(edit_btn).append(" ").append(del_btn);
                $("<tr></tr>").append(useridTd).append(userNameTd).append(genderTd).append(emailTd).append(uTypeTd).append(btnTd).appendTo($("#user_table tbody"));
            });
        }
        //处理分布信息
        function page_msg(data){
            var pageInfo = data.reldata.pageinfo;
            $("#page_msg").append("当前第"+pageInfo.pageNum+"页，总"+pageInfo.pages+"页，总"+pageInfo.total+"记录")
        }
    </script>

</body>
</html>
