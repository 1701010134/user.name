package bank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import bank.dao.ApprovalDao;
import bank.model.Approval;
@Service("approvalService")
public class ApprovalServiceImpl implements ApprovalService{
	@Autowired
	private ApprovalDao approvalDao;
	public List<Approval> selectApprovalAccounts(Approval approval) {
		// TODO Auto-generated method stub
		return approvalDao.selectApprovalAccounts(approval);
	}

	public PageInfo<Approval> getPage2(Approval approval, Integer pageIndex2, Integer pageSize2) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageIndex2,pageSize2);
		List<Approval> values=approvalDao.selectApprovalAccounts(approval);
		PageInfo<Approval> page=new PageInfo<Approval>(values);
		return page;
	}

	public int insertApprovalAccount(Approval approval) {
		// TODO Auto-generated method stub
		return approvalDao.insertApprovalAccount(approval);
	}

	public Approval getApprovalAccountByNo(String no2) {
		// TODO Auto-generated method stub
		return approvalDao.getApprovalAccountByNo(no2);
	}

	public Approval getApprovalAccountByid(int id2) {
		// TODO Auto-generated method stub
		return approvalDao.getApprovalAccountByid(id2);
	}

	public int updateApprovalAccount(Approval approval) {
		// TODO Auto-generated method stub
		return approvalDao.updateApprovalAccount(approval);
	}

	public int deleteApprovalAccountById(int id2) {
		// TODO Auto-generated method stub
		return approvalDao.deleteApprovalAccountById(id2);
	}
	
	public Integer[] getApprovalAccountstatus(Integer status){
		return approvalDao.getApprovalAccountstatus(status);
	}
   
	public int setApprovalAccountstatus(int id2,int status){
		return approvalDao.setApprovalAccountstatus(id2,status);
	}
	public int selectApprovalAccountstatus(int id2){
		return approvalDao.selectApprovalAccountstatus(id2);
	}
}
