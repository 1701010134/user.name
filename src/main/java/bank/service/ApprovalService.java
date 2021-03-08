package bank.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import bank.model.Account;
import bank.model.Approval;

public interface ApprovalService {
	List<Approval> selectApprovalAccounts(Approval approval);

	PageInfo<Approval> getPage2(Approval approval, Integer pageIndex2, Integer pageSize2);

	int insertApprovalAccount(Approval approval);

	Approval getApprovalAccountByNo(String no2);

	Approval getApprovalAccountByid(int id2);

	int updateApprovalAccount(Approval approval);

	int deleteApprovalAccountById(int id2);
    
	Integer[] getApprovalAccountstatus(Integer status);

	int setApprovalAccountstatus(int id2,int status);
	
	int selectApprovalAccountstatus(int id2);
}
