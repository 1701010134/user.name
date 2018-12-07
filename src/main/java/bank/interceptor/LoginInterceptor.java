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
		//��ȡ����URI
		String uri=request.getRequestURI();
		System.out.println(uri);
		//���˵�¼�����⣬����uri��Ҫ���ش���
		if(uri.indexOf("/signOn")>=0){
			return true;
		}
		//�ж�session���Ƿ����û����ݣ�����У��򷵻�true
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user!=null){
			return true;
		}
		request.setAttribute("msg", "����û�е�¼�����ȵ�¼");
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
