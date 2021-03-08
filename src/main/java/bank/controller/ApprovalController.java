package bank.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.PageInfo;

import bank.model.Account;
import bank.model.Approval;
import bank.service.AccountService;
import bank.service.ApprovalService;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/approval")
public class ApprovalController {
	@Autowired(required=true)
	private AccountService accountService;
	@Autowired(required=true)
	private ApprovalService approvalService;
	@RequestMapping("/selectApprovalAccounts")
	public  ModelAndView selecApprovaltAccounts(@RequestParam(required=false,defaultValue="1")int page,@RequestParam(required=false,defaultValue="1")int page2,
			@RequestParam(required=false,defaultValue="5")int rows,@RequestParam(required=false,defaultValue="5")int rows2,
			Account account,Approval approval,Model model,HttpServletRequest request){
		PageInfo<Account> pageInfo = accountService.getPage(account,page,rows);
		System.out.println("AccountController的select被调用");
		request.setAttribute("queryParam", account);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("pageurl","/account/PageInfo");
		request.setAttribute("page",page);
	    request.setAttribute("rows",rows);
		
		PageInfo<Approval> pageInfo2 = approvalService.getPage2(approval,page2,rows2);
		request.setAttribute("queryParam2",approval);
		request.setAttribute("pageInfo2",pageInfo2);
		request.setAttribute("pageurl2","/approval/selectApprovalAccounts");
		request.setAttribute("page2",page2);
		request.setAttribute("rows2",rows2);
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("request",request);
		System.out.println("ApprovalController的select被调用\n");
		System.out.println("id="+approval.getId2()+",loan="+approval.getLoan()+approval.toString());
		//return "account/account_list";
		return new ModelAndView("account/account_list",data);
		}
	
	@RequestMapping("/initApprovals")
	@ResponseBody
	public List<Account> initApprovals(Approval approval){
                   List<Approval> l = approvalService.selectApprovalAccounts(approval);
                   JSONArray json = JSONArray.fromObject(l);
                   System.out.println("json="+json);
				return json;
		}


@RequestMapping(value="/insertApprovalAccount",method=RequestMethod.POST)
@ResponseBody
public String insertApprovalAccount(Approval approval){
	System.out.println(approval.toString());
	int rows=approvalService.insertApprovalAccount(approval);
	if(rows>0){
		return "OK";
	}else{
	    return "FALL";
	}
}

@RequestMapping(value="/getApprovalAccountByNo",method=RequestMethod.POST)
@ResponseBody
public String getApprovalByNo(String no2){
	Approval approval=approvalService.getApprovalAccountByNo(no2);
	System.out.println("进入getAccountByNo");
	if(approval!=null){
		return "OK";
	}else{
	    return "FALL";
	}
}

@RequestMapping("/getApprovalAccountByid")
@ResponseBody
public Approval getApprovalAccountByid(int id2){
	Approval approval=approvalService.getApprovalAccountByid(id2);
	System.out.println("id="+approval.getId2()+"loan="+approval.getLoan()+"staus="+approval.getStatus());
	return approval;
}	
@RequestMapping(value="/updateApprovalAccount",method=RequestMethod.POST)
@ResponseBody
public Approval updateApprovalAccount(@RequestBody Approval approval,HttpServletResponse response,HttpServletRequest request) throws IOException{
	System.out.println("updateApprovalAccount");
	int rows=approvalService.updateApprovalAccount(approval);
	if(rows>0){
		return approval;
	}else{
	    return null;
	}
	
}

@RequestMapping(value="/deleteApprovalAccount",method=RequestMethod.POST)
@ResponseBody
public String deleteApprovalAccount(int id2){
	System.out.println(id2);
	int rows2=approvalService.deleteApprovalAccountById(id2);
	if(rows2>0){
		return "OK";
	}else{
	    return "FALL";
	}
}
@RequestMapping(value="/getApprovalAccountstatus",method=RequestMethod.POST)
@ResponseBody
public Integer[] getApprovalAccountstatus(Integer status){
	
	Integer[] i = approvalService.getApprovalAccountstatus(status);
	int n = 0;
	while(n<i.length){
	System.out.println("status's ="+i[n++]);
	}
	return i;

}
@RequestMapping(value="/setApprovalAccountstatus",method=RequestMethod.POST)
@ResponseBody
public String setApprovalAccountstatus(int id2,int status,HttpServletRequest request){
	System.out.println("set status");
	int i=approvalService.setApprovalAccountstatus(id2,status);
	int i2=approvalService.selectApprovalAccountstatus(id2);
	
	System.out.println("i="+i+",i2="+i2);
	if(i>0&&i2>0){
		
		return "OK";
	}else{
	    return "FALL";
	}

}
}
