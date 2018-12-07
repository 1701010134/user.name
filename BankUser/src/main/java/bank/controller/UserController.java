package bank.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bank.model.User;
import bank.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping(value="/signOn",method=RequestMethod.POST)
	public String signOn(String no,String password,Model model,HttpSession session,HttpServletResponse response) throws IOException{
		System.out.println(no+","+password);
		User user=userService.findUser(no,password);
		System.out.println("UserContorller的signOn被调用");
		if(user!=null){
			session.setAttribute("user", user);
			//response.sendRedirect("account/selectAccounts");
		    return "redirect:account/selectAccounts";
		}
		
		model.addAttribute("msg","账号密码错误");
		return "login";
	
		}
	@RequestMapping("/signOut")
	public String signOut(HttpSession session){
		//清除session
		session.invalidate();
		//返回登录页面
		return "login";
	}
}
