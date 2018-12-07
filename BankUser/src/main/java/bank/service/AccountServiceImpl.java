package bank.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import bank.dao.AccountDao;
import bank.model.Account;

@Service("accountService")
public class AccountServiceImpl implements AccountService{
    @Autowired
	private AccountDao accountDao;
    
    //根据account中的查询条件得到查询结果
	public List<Account> selectAccounts(Account account) {
		// TODO Auto-generated method stub
		return accountDao.selectAccounts(account);
	}
	
	//根据account中的查询条件得到查询结果制定分页的内容：即第pageIndex页，每页显示pageSize行的第一个页面内容
	public PageInfo<Account> getPage(Account account, Integer pageIndex, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageIndex,pageSize);
		List<Account> values=accountDao.selectAccounts(account);
		PageInfo<Account> page=new PageInfo<Account>(values);
		return page;
	}

	public int insertAccount(Account account) {
		// TODO Auto-generated method stub
		return accountDao.insertAccount(account);
	}

	public Account getAccountByNo(String no) {
		// TODO Auto-generated method stub
		return accountDao.getAccountByNo(no);
	}

	public Account getAccountByid(int id) {
		// TODO Auto-generated method stub
		return accountDao.getAccountByid(id);
	}

	public int updateAccount(Account account) {
		// TODO Auto-generated method stub
		return accountDao.updateAccount(account);
	}

	public int deleteAccountById(int id) {
		// TODO Auto-generated method stub
		return accountDao.deleteAccountById(id);
	}

}
