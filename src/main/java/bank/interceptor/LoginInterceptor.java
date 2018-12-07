package bank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import bank.model.User;

public class LoginInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//获取请求URI
		String uri=request.getRequestURI();
		System.out.println(uri);
		//除了登录请求外，其他uri都要拦截处理
		if(uri.indexOf("/signOn")>=0){
			return true;
		}
		//判断session中是否有用户数据，如果有，则返回true
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user!=null){
			return true;
		}
		request.setAttribute("msg", "您还没有登录，请先登录");
		request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request,response);
		return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
