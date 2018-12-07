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
		System.out.println("UserContorller��signOn������");
		if(user!=null){
			session.setAttribute("user", user);
			//response.sendRedirect("account/selectAccounts");
		    return "redirect:account/selectAccounts";
		}
		
		model.addAttribute("msg","�˺��������");
		return "login";
	
		}
	@RequestMapping("/signOut")
	public String signOut(HttpSession session){
		//���session
		session.invalidate();
		//���ص�¼ҳ��
		return "login";
	}
}
