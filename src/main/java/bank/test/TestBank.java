package bank.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import bank.dao.UserDao;
import bank.model.User;
import bank.service.UserService;
import junit.framework.TestCase;

public class TestBank extends TestCase{
	ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
	@Test
public void testUserDao(){
		UserDao dao = (UserDao) context.getBean("userDao");
        User user =dao.findUser("1", "123456");
        System.out.println("testUserDao:"+user.getName());
}
	@Test 
	public void testUserService(){
		UserService service=(UserService) context.getBean("userService");
		User user =service.findUser("admin", "123456");
		System.out.println("testUserService:"+user.getName());
	}
}

