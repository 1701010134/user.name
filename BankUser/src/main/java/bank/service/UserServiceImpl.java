package bank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import bank.dao.UserDao;
import bank.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
//×¢ÈëuserDao
	@Autowired
private UserDao userDao;

public User findUser(String no, String password) {
	// TODO Auto-generated method stub
	return userDao.findUser(no, password);
}

}
