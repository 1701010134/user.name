package bank.dao;

import org.apache.ibatis.annotations.Param;
import bank.model.User;

public interface UserDao {
	//通过用户账号和密码查询用户
User findUser(@Param("no") String no,@Param("password") String password);
}
