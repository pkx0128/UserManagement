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
<%--编辑模态框--%>
<div class="modal fade" tabindex="-1" role="dialog" id="edit_user_model">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_user_form">
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-8" id="edit_username_div">
<%--                            <input type="text" class="form-control" id="edit_username"  name="userName" placeholder="请输入用户名"/>--%>
<%--                                <span class="help-block"></span>--%>
                            <div class="col-sm-10">
                                <p class="form-control-static"></p>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓别：</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="M" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">email：</label>
                        <div class="col-sm-8" id="edit_email_div">
                            <input type="text" class="form-control" id="edit_email"  name="email" placeholder="请输入email"/>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="utId_select">用户类型</label>
                        <div class="col-sm-4">
                            <select id="edit_utId_select" name="utId" class="form-control"><!--此处放置用户类型option--></select>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="edit_save_user">更新</button>
            </div>
        </div>
    </div>
</div>

<%--新增模态框--%>
    <div class="modal fade" tabindex="-1" role="dialog" id="add_user_model">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增用户信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_user_form">
                        <div class="form-group">
                            <label for="username" class="col-sm-2 control-label">用户名：</label>
                            <div class="col-sm-8" id="username_div">
                                <input type="text" class="form-control" id="username"  name="userName" placeholder="请输入用户名"/>
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">姓别：</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="inlineRadio1" value="M" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="inlineRadio2" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">email：</label>
                            <div class="col-sm-8" id="email_div">
                                <input type="text" class="form-control" id="email"  name="email" placeholder="请输入email"/>
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="utId_select">用户类型</label>
                            <div class="col-sm-4">
                                <select id="utId_select" name="utId" class="form-control"><!--此处放置用户类型option--></select>
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="save_user">保存</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-12"><h1>用户列表</h1></div>
        </div>
        <!--右侧按钮-->
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-offset-10">
                <button class="btn btn-primary" id="add_user_btn">新增</button>
                <button class="btn btn-danger" id="del_user_btn">删除</button>
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
            <div class="col-sm-6" id="page_nav"><!--此处为分页导航条--></div>
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
                    //构建分页导航条
                    page_nav(data);

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
                var edit_btn = $("<button></button>").attr("id","edit_btn").attr("edit_id",item.userId).addClass("btn btn-primary btn-sm").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
                //删除按钮
                var del_btn = $("<button></button>").attr("id","del_btn").attr("del_id",item.userId).addClass("btn btn-danger btn-sm").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                var btnTd = $("<td></td>").append(edit_btn).append(" ").append(del_btn);
                $("<tr></tr>").append(useridTd).append(userNameTd).append(genderTd).append(emailTd).append(uTypeTd).append(btnTd).appendTo($("#user_table tbody"));
            });
        }
        //处理分页信息
        function page_msg(data){
            //清空幸元素
            $("#page_msg").empty();
            var pageInfo = data.reldata.pageinfo;
            $("#page_msg").attr("pages_total",pageInfo.pages).append("当前第"+pageInfo.pageNum+"页，总"+pageInfo.pages+"页，总"+pageInfo.total+"记录")
        }

        //构建分布条
        function page_nav(data){
            //清空结点元素
            $("#page_nav").empty();
            var pageInfo = data.reldata.pageinfo;
            var nav = $("<nav></nav>").attr("aria-label","Page navigation");
            var ul = $("<ul></ul>").addClass("pagination");
            //首页按钮
            var firstLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"));
            //给首页按钮添加单击事件
            firstLi.click(function(){
                //发送ajax请求获取第一页的数据
                get_emps(1);
            });

            //上一页按钮
            var preLi = $("<li></li>").append($("<a></a>").attr("href","#").attr("aria-label","Previous").append($("<span></span>").attr("aria-hidden","true").append("&laquo;")));
            //当前页减1为上一页的数据
            preLi.click(function(){
                get_emps(pageInfo.pageNum - 1);
            });

            //处理是否显示首页与上一页按钮
            if(pageInfo.hasPreviousPage){
                //把构建好的首页与上一页按按钮添加到分页导航条
                ul.append(firstLi).append(preLi);
            }

            //遍历导航页码
            $.each(pageInfo.navigatepageNums,function(index,item){
                //构建页码
                var pageLi = $("<li></li>").append($("<a></a>").attr("href","#").append(item));
                //给页码添加单击事件
                pageLi.click(function(){
                    //发送ajax请求获取相应页的数据
                    get_emps(item);
                });
                //设置当前页高亮显示
                if(pageInfo.pageNum == item){
                    pageLi.addClass("active");
                }
                ul.append(pageLi);

            });

            //下一页
            var nextLi = $("<li></li>").append($("<a></a>").attr("href","#").attr("aria-label","Next").append($("<span></span>").attr("aria-hidden","true").append("&raquo;")));
            //当前页加1为下一页数据
            nextLi.click(function(){
                get_emps(pageInfo.pageNum + 1);
            });
            //末页
            var lastLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"));
            //获取末页数据
            lastLi.click(function(){
                get_emps(pageInfo.pages);
            });
            //处理是否显示下一页与末页
            if(pageInfo.hasNextPage){
                //把构建好的末页与下一页按按钮添加到分页导航条
                ul.append(nextLi).append(lastLi);
            }
            nav.append(ul).appendTo("#page_nav");
        }
        /**
         * 点击新增按钮弹出
         */
        $("#add_user_btn").click(function(){
            //重置表单
            $("#add_user_form")[0].reset();
            //清除用户名状态
            remove_class("#username");
            remove_class("#email");
            console.log("新增按钮被点");
            //获取用户类型
            get_usertype("#utId_select");
            $("#add_user_model").modal({
                backdrop:"static"
            });
        });
        /**
         * 消除表单中的校验状态信息
         */
        function remove_class(ele){
            $(ele).parent().removeClass("has-success").removeClass("has-error");
            $(ele).next("span").empty();
        }
        /**
         * 发送ajax获取用户类型信息
         */
        function get_usertype(ele){
            $(ele).empty();
            $.ajax({
                url:"${APP_PATH}/utype",
                type:"GET",
                success:function(data){
                    //{"code":100,"msg":"处理成功","reldata":{"utype":[{"utypeId":1,"utypeName":"普通用户"},{"utypeId":2,"utypeName":"VIP用户"}]}}
                    $.each(data.reldata.utype,function(index,item){
                        console.log(item.utypeName);
                        var typeOption = $("<option></option>").attr("value",item.utypeId).append(item.utypeName);
                        typeOption.appendTo(ele);
                    });
                }
            });
        }

        //提交数据时对用户名和邮箱进行认证,验证成功后提交信息到服务器
        $("#save_user").click(function(){
            if(!validata_username()){
                return false;
            }
            //校验邮箱
            if(!validata_email()){
                return false;
            }
            // alert("数据校验成功");
            saveuser();
        });
        //发送ajax请求提交数据到服务器
        function saveuser(){
            $.ajax({
                url:"${APP_PATH}/saveuser",
                type:"POST",
                data:$("#add_user_form").serialize(),
                success:function(rdata){
                    // console.log("saveuser===",rdata);
                    if(rdata.code == 100){
                        $('#add_user_model').modal('hide');
                        // 跳到最后一页$("#page_msg").attr("pages_total")为构建分页时添加的自定义属性用于保存分页的总页数
                        get_emps($("#page_msg").attr("pages_total") + 1);
                    }
                }
            });
        }

        //校验用户名
        function validata_username(){
            //校验用户名合法
            var regx = /(^[a-zA-Z0-9_-]{6,16}$)/
            if(!regx.test($("#username").val())){
                show_validata_msg("#username","error","用户名必须为6到16位字母与数字的组合");
                return false;
            }else{
                show_validata_msg("#username","success","用户名可用");
                return true;
            }
        }
        //判断是否重名
        $("#username").change(function(){
            if($("#username").val().length>=6){
                validata_username_ajax();
            }else{
                show_validata_msg("#username","error","用户名必须为6到16位字母与数字的组合");
                return false;
            }
        });

        //发送ajax请求判断用户名是否重复
        function validata_username_ajax(){
            $.ajax({
                url:"${APP_PATH}/checkusername",
                data:"userName="+$("#username").val(),
                type:"POST",
                success:function(rdata){
                    if(rdata.code == 100){
                        show_validata_msg("#username","success",rdata.reldata.v_msg);
                        return true;
                    }else if(rdata.code == 200){
                        show_validata_msg("#username","error",rdata.reldata.v_msg);
                        return false;
                    }
                }
            });
        }

        //校验邮箱
        function validata_email(){
            var regx = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            var email = $("#email").val();
            if(!regx.test(email)){
                show_validata_msg("#email","error","邮箱地址错误");
                return false;
            }else{
                show_validata_msg("#email","success","邮箱地址可用");
                return true;
            }
        }

        /**
         * 定义显示校验信息方法
         * @param ele 用于jquery选择器的标签属性
         * @param status 是否成功
         * @param msg 提示信息
         */
        function show_validata_msg(ele,status,msg){
            $(ele).next("span").empty();
            if(status == "success"){
                $(ele).parent().removeClass("has-error").addClass("has-success");
                $(ele).next("span").append(msg);
            }else if(status == "error"){
                $(ele).parent().removeClass("has-success").addClass("has-error");
                $(ele).next("span").append(msg);
            }
        }

        /**
         * 给编辑按钮添加单击事件
         */
        $(document).on("click","#edit_btn",function(){
            $("#edit_user_form")[0].reset();
            $(".form-control-static").empty();
            //获取用户数据
            get_edit_user($(this).attr("edit_id"))
            //获取用户类型数据
            get_usertype("#edit_utId_select");
            $("#edit_user_model").modal({
                backdrop:"static"
            });

        });

        /**
         * 根据id获取用户信息回显到编辑模态框
         */
        function get_edit_user(id){
            $.ajax({
                url:"${APP_PATH}/getuser/"+id,
                type:"GET",
                success:function(data){
                    var user = data.reldata.user;
                    $("#edit_save_user").attr("edit_userId",user.userId);
                    $(".form-control-static").append(user.userName);
                    $("#edit_user_form input[name=gender]").val([user.gender]);
                    $("#edit_email").val(user.email);
                    $("#edit_utId_select").val([user.utId]);
                }
            });
        }


    </script>

</body>
</html>
