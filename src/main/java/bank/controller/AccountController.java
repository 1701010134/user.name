package bank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import bank.model.Account;
import bank.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController{
	@Autowired(required=true)
	private AccountService accountService;
	@RequestMapping("/selectAccounts")
	public String selectAccounts(@RequestParam(required=false,defaultValue="1")int page,
			@RequestParam(required=false,defaultValue="5")int rows,
			Account account,Model model){
		System.out.println("id="+account.getId()+"balance="+account.getBalance()+account.toString());
		PageInfo<Account> pageInfo = accountService.getPage(account,page,rows);
		model.addAttribute("queryParam",account);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("pageurl","/account/selectAccounts");
		model.addAttribute("apge",page);
		model.addAttribute("rows",rows);
		System.out.println("AccountController的select被调用");
		return "account/account_list";
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
	public String updateAccount(Account account){
		int rows=accountService.updateAccount(account);
		if(rows>0){
			return "OK";
		}else{
		return "FALL";
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

