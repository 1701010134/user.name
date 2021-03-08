package bank.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import bank.model.Account;

public interface AccountService {
	//根据account中的查询条件得到查询结果
List<Account> selectAccounts();

//根据account中的查询条件得到查询结果制定分页的内容：即第pageIndex页，每页显示pageSize行的第一个页面内容
PageInfo<Account> getPage(Account account,Integer pageIndex,Integer pageSize);

int insertAccount(Account account);

Account getAccountByNo(String no);

Account getAccountByid(int id);

int updateAccount(Account account);

int deleteAccountById(int id);

}
