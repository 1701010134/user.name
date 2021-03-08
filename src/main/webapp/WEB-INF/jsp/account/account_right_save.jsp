<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <!-- 网页右边   账户管理页面 -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="dis2">
    <!-- 菜单按钮 -->
<div id="page-content-wrapper">
    <button type="button" class="hamburger is-closed btn btn-default glyphicon glyphicon-remove" data-toggle="offcanvas">
      <span class="hamb-top"></span>
      <span class="hamb-middle"></span>
      <span class="hamb-bottom"></span>
    </button>
   </div>
   
    <h2 class="page-header">账户管理</h2>
    <!-- 搜索表单，可以录入账号，姓名，页码和每行页数 -->
    <div id="navbar" class="navbar-collapse collapse">
    <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/account/selectAccounts">
     <input type="text" id="search_no" name="no" value="${queryParam.no}" class="form-control" placeholder="账号.."/>
     <input type="text" id="search_name" name="name" value="${queryParam.name}" class="form-control" placeholder="姓名.."/>
      <!-- <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/account/selectAccounts2"> -->
       <button type="submit" class="btn btn-default btn-sg search1" id="query_account_form">
        <span class="glyphicon glyphicon-search" aria-hiddden="true"></span>
       </button>
     </form>
   </div>
   <!-- 添加按钮，点击会打开模态对话框addModal -->
   <button type="button" class="btn btn-default btn-sg" data-toggle="modal" data-target="#addModal">
   <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
   </button>
   <!-- 账户信息列表 -->
   <div class="table-responsive" >
     <!-- 按行显示账户信息的表格 -->
   <table class="table table-striped" data-toggle="table" id="table">
  <thead>
    <tr>
      <th data-field="id">ID<th>
      <th data-field="no">NO</th>
      <th data-field="name">NAME</th>
      <th data-field="balance">BALANCE</th>
     </tr>
  </thead>
     </table>
      </div>
      
<!-- 新增账户Model -->
 <!-- tabindex=-1代表此元素禁止使用键盘上的tab键对其导航，就是按tab键的时候，会跳过这个div
role=“dialog”代表这是一个对话框
aria-labelledby：是残障人士使用屏幕阅读器时，会读取的内容
aria-hidden:是使用屏幕阅读器时，忽略该元素值 -->
 <div class="modal fadel" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span>
        </button>
          <h4 class="modal-title" id="myModalLabel">新增账号</h4>
      </div>
       <div class="modal-body">
         <form class="form-horizontal" id="new_account_form">
           <div class="form-group">
             <label for="no" class="col-sm-2 control-label">账号</label>
               <div class="col-sm-10">
                 <input type="text" class="form-control" id="no" name="no" placeholde="请输入账号" onChange="checkNewNo()">
               </div>
           </div>
         <div class="form-group">
           <label for="name" class="col-sm-2 control-label">姓名</label>
           <div class="col-sm-10">
             <input type="text" class="form-control" id="name" name="name" placeholder="请输入名字">
           </div>
         </div>
         <div class="form-group">
           <label for="account" class="col-sm-2 control-label">余额</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="balance" name="balance" placeholder="请输入余额">
             </div>
         </div>
         </form>
       </div>
         <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" onclick="createAccount()">新增</button>
   		 </div>
    </div>
  
  </div> 
 </div>
 
<!-- 修改账户modal -->
 <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel">
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span> 
         </button>
         <h4 class="modal-title" id="updateModalLabel">编辑账户</h4>
       </div>
       <div class="modal-body">
        <form class="form-horizontal" id="update_account_form">
          <input type="hidden" id="edit_id" name="id"/>
            <div class="form-group">
              <label for="edit_no" class="col-sm-2 control-label">账号</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_no" name="no" onChange="checkEditNo()"/>
              </div>
            </div>
            <div class="form-group">
              <label for="edit_name" class="col-sm-2 control-label">姓名</label>
              <div class="col-sm-10">
              <input type="text" class="form-control" id="edit_name" name="name">
              </div>
            </div>
            <div class="form-group">
              <label for="edit_balance" class="col-sm-2 control-label">余额</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_balance" name="balance">
              </div>
            </div>
        </form>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
         <button type="button" class="btn btn-primary" onclick="updateAccount()">修改</button>
       </div>
     </div>
   </div>
 </div>
</div>
</body>
</html>