package bank.service;

import bank.model.User;

public interface UserService {
	//ͨ���˺ź������ѯ�û�
User findUser(String no,String password);
}
