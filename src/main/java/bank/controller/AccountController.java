package bank.controller;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("/account")
public class AccountController{
	@Autowired(required=true)
	private AccountService accountService;
	@Autowired
	private ApprovalService approvalService;
	@RequestMapping("/selectAccounts")
	public String selectAccounts(@RequestParam(required=false,defaultValue="1")int page,@RequestParam(required=false,defaultValue="1")int page2,
			@RequestParam(required=false,defaultValue="5")int rows,@RequestParam(required=false,defaultValue="5")int rows2,
			Account account,Approval approval,Model model,HttpServletRequest request){
		PageInfo<Account> pageInfo = accountService.getPage(account,page,rows);
		System.out.println("AccountController的select被调用");
		request.setAttribute("queryParam", account);
		request.setAttribute("pageInfo",pageInfo);
		request.setAttribute("pageurl","/account/PageInfo");
		request.setAttribute("page",page);
	    request.setAttribute("rows",rows);
		System.out.println("id="+account.getId()+"balance="+account.getBalance()+account.toString());
		PageInfo<Approval> pageInfo2 = approvalService.getPage2(approval,page2,rows2);
		request.setAttribute("queryParam2", approval);
		request.setAttribute("pageInfo2",pageInfo2);
		request.setAttribute("pageurl2","/approval/selectApprovalAccounts");
		request.setAttribute("page2",page2);
		request.setAttribute("rows2",rows2);
		return "account/account_list";
	}
	@RequestMapping("/initAccount")
	@ResponseBody
	public List<Account> initAccount(Account account){
                   List<Account> l = accountService.selectAccounts();
                   JSONArray json = JSONArray.fromObject(l);
                   System.out.println("json="+json);
				return json;
		}
	
	@RequestMapping(value="/insertAccount",method=RequestMethod.POST)
	@ResponseBody
	public String insertAccount(Account account){
		System.out.println(account.toString());
		int rows=accountService.insertAccount(account);
		if(rows>0){
			return "OK";
		}else{
		    return "FALL";
		}
	}
	
	@RequestMapping(value="/getAccountByNo",method=RequestMethod.POST)
	@ResponseBody
	public String getAccountByNo(String no){
		System.out.println(no+":getAccountByNo");
		Account account=accountService.getAccountByNo(no);
		System.out.println(account+":getAccountByNo");
		if(account!=null){
			return "OK";
		}else{
		    return "FALL";
		}
	}
	
	@RequestMapping("/getAccountByid")
	@ResponseBody
	public Account getAccountByid(int id){
		Account account=accountService.getAccountByid(id);
		return account;
	}	
	@RequestMapping(value="/updateAccount",method=RequestMethod.POST)
	@ResponseBody
	public Account updateAccount(Account account){
		int rows=accountService.updateAccount(account);
		if(rows>0){
			return account;
		}else{
		    return null;
		}
		
	}

	
	@RequestMapping(value="/deleteAccount",method=RequestMethod.POST)
	@ResponseBody
	public String deleteAccount(int id){
		System.out.println(id);
		int rows=accountService.deleteAccountById(id);
		if(rows>0){
			return "OK";
		}else{
		    return "FALL";
		}
	}
	
}

