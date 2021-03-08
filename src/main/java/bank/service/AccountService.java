package bank.service;

import java.util.List;
import com.github.pagehelper.PageInfo;
import bank.model.Account;

public interface AccountService {
	//����account�еĲ�ѯ�����õ���ѯ���
List<Account> selectAccounts();

//����account�еĲ�ѯ�����õ���ѯ����ƶ���ҳ�����ݣ�����pageIndexҳ��ÿҳ��ʾpageSize�еĵ�һ��ҳ������
PageInfo<Account> getPage(Account account,Integer pageIndex,Integer pageSize);

int insertAccount(Account account);

Account getAccountByNo(String no);

Account getAccountByid(int id);

int updateAccount(Account account);

int deleteAccountById(int id);

}
