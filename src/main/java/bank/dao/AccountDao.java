package bank.dao;

import java.util.List;
import bank.model.Account;

public interface AccountDao {
List<Account> selectAccounts(Account account);

int insertAccount(Account account);

Account getAccountByNo(String no);

Account getAccountByid(int id);

int updateAccount(Account account);

int deleteAccountById(int id);
}
