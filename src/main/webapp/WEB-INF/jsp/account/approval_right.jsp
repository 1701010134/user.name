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
  <!-- 网页右边  借贷业务 -->
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="dis3">

    <!-- 菜单按钮 -->
  <div id="page-content-wrapper">
    <button type="button" class="hamburger is-closed btn btn-default glyphicon glyphicon-remove" data-toggle="offcanvas">
      <span class="hamb-top"></span>
      <span class="hamb-middle"></span>
      <span class="hamb-bottom"></span>
    </button>
   </div>
   
 <h2 class="page-header">借贷管理</h2>
 <!-- 搜索表单，可以录入账号，姓名，页码和每行页数 -->
 <div id="navbar" class="navbar-collapse collapse">
 <form class="navbar-form navbar-right" action="${pageContext.request.contextPath}/approval/selectApprovalAccounts">
    <input type="text" id="approvalsearch_no" name="no2" value="${queryParam2.no2}" class="form-control" placeholder="账号.."/>
    <input type="text" id="approvalsearch_name" name="name2" value="${queryParam2.name2}" class="form-control" placeholder="姓名.."/>
     <button type="submit" class="btn btn-default btn-sg search2">
     <span class="glyphicon glyphicon-search" aria-hiddden="true"></span>
     </button>
  </form>
 </div>
 
   <!-- 添加按钮，点击会打开模态对话框addModal -->
   <button type="button" class="btn btn-default btn-sg" data-toggle="modal" data-target="#addApprovalModal">
   <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
   </button>
   <!-- 账户信息列表 -->
   <div class="table-responsive" >
     <!-- 按行显示账户信息的表格 -->
   <table class="table table-striped" data-toggle="table" id="approval_table">
  <thead>
    <tr>
      <th data-field="id2">ID<th>
      <th data-field="no2">NO</th>
      <th data-field="name2">NAME</th>
      <th data-field="loan">LOAN</th>
      <th data-field="status">STATUS</th>
     </tr>
  </thead>
     </table>
      </div>
      
<!-- 新增借款账户Model -->
 <!-- tabindex=-1代表此元素禁止使用键盘上的tab键对其导航，就是按tab键的时候，会跳过这个div
role=“dialog”代表这是一个对话框
aria-labelledby：是残障人士使用屏幕阅读器时，会读取的内容
aria-hidden:是使用屏幕阅读器时，忽略该元素值 -->
 <div class="modal fadel" id="addApprovalModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span>
        </button>
          <h4 class="modal-title" id="myApprovalModalLabel">新增借贷</h4>
      </div>
       <div class="modal-body">
         <form class="form-horizontal" id="new_approvalaccount_form">
           <div class="form-group">
             <label for="no2" class="col-sm-2 control-label">账号</label>
               <div class="col-sm-10">
                 <input type="text" class="form-control" id="no2" name="no2" placeholde="请输入账号" onChange="checkNewApprovalNo()">
               </div>
           </div>
         <div class="form-group">
           <label for="name2" class="col-sm-2 control-label">姓名</label>
           <div class="col-sm-10">
             <input type="text" class="form-control" id="name2" name="name2" placeholder="请输入名字">
           </div>
         </div>
         <div class="form-group">
           <label for="loan" class="col-sm-2 control-label">借款</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="loan" name="loan" placeholder="请输入余额">
             </div>
         </div>
         <div class="form-group">
           <label for="status" class="col-sm-2 control-label">审核状态</label>
             <div class="col-sm-10">
               <input type="text" class="form-control" id="status" name="status" placeholder="请输入审核状态">
             </div>
         </div>
         </form>
       </div>
         <div class="modal-footer">
		      <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		      <button type="button" class="btn btn-primary" onclick="createApprovalAccount()">新增</button>
   		 </div>
    </div>
  </div> 
 </div>
 <!-- 修改借款账户modal -->
 <div class="modal fade" id="updateApprovalModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" >
   <div class="modal-dialog" role="document">
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times</span> 
         </button>
         <h4 class="modal-title" id="updateApprovalModalLabel">编辑账户</h4>
       </div>
       <div class="modal-body">
        <form class="form-horizontal" id="update_approvalaccount_form">
          <input type="hidden" id="edit_approvalid" name="id2"/>
            <div class="form-group">
              <label for="edit_approvalno" class="col-sm-2 control-label">账号</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_approvalno" name="no2" onChange="checkEditApprovalNo()"/>
              </div>
            </div>
            <div class="form-group">
              <label for="edit_approvalname" class="col-sm-2 control-label">姓名</label>
              <div class="col-sm-10">
              <input type="text" class="form-control" id="edit_approvalname" name="name2">
              </div>
            </div>
            <div class="form-group">
              <label for="edit_approvalbalance" class="col-sm-2 control-label">借款</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_approvalloan" name="loan">
              </div>
            </div>
            <div class="form-group">
              <label for="edit_approvalstatus" class="col-sm-2 control-label">审核状态</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="edit_approvalstatus" name="status">
              </div>
            </div>
        </form>
       </div>
       <div class="modal-footer">
         <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
         <button type="button" class="btn btn-primary" onclick="updateApprovalAccount()">修改</button>
       </div>
     </div>
   </div>
 </div>
</div>
</body>
</html>