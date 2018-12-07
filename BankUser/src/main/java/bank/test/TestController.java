package bank.test;

import org.aspectj.lang.annotation.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import bank.controller.UserController;
import junit.framework.TestCase;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:aplicationContext.xml","classpath:springmvc-config.xml"})
public class TestController extends TestCase{
@Autowired
private UserController userController;
private MockMvc mockMvc;

@Before(value = "")
public void setup(){
	mockMvc=MockMvcBuilders.standaloneSetup(userController).build();
}
@Test 
public void testUserController()throws Exception{
	ResultActions resultActions =
			this.mockMvc.perform(MockMvcRequestBuilders.post("/signOn").param("no", "admin").param("password", "12"));
    MvcResult mvcResult=resultActions.andReturn();;
    		System.out.println(mvcResult.getResponse().getForwardedUrl());
    		System.out.println(mvcResult.getResponse().getRedirectedUrl());
    		System.out.println(mvcResult.getResponse().getStatus());
}

}
