package bank.service;

import bank.model.User;

public interface UserService {
	//通过账号和密码查询用户
User findUser(String no,String password);
}
