package bank.dao;

import org.apache.ibatis.annotations.Param;
import bank.model.User;

public interface UserDao {
	//ͨ���û��˺ź������ѯ�û�
User findUser(@Param("no") String no,@Param("password") String password);
}
