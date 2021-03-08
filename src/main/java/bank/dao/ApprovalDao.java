package bank.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import bank.model.Approval;


public interface ApprovalDao {
List<Approval> selectApprovalAccounts(Approval approval);

	int insertApprovalAccount(Approval approval);

	Approval getApprovalAccountByNo(String no2);

	Approval getApprovalAccountByid(int id2);

	int updateApprovalAccount(Approval approval);

	int deleteApprovalAccountById(int id2);
	
	Integer[] getApprovalAccountstatus(Integer status);

	int setApprovalAccountstatus(@Param("id2")int id2,@Param("status")int status);
	
	int selectApprovalAccountstatus(@Param("id2")int id2);

}
