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
    
    //����account�еĲ�ѯ�����õ���ѯ���
	public List<Account> selectAccounts(Account account) {
		// TODO Auto-generated method stub
		return accountDao.selectAccounts(account);
	}
	
	//����account�еĲ�ѯ�����õ���ѯ����ƶ���ҳ�����ݣ�����pageIndexҳ��ÿҳ��ʾpageSize�еĵ�һ��ҳ������
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
