package com.mylibrary.book.admin.mapper;

import java.util.List;
import java.util.Map;

import com.mylibrary.book.admin.vo.BorrowedVO;

public interface BorrowedMapper {
	
	public List<BorrowedVO> selectAll();
	public void borrowedDelete(String rentid);
	public void borrowedDeleteByEmail(String renemail);
	public List<Map<String,String>> showLendingList();
}
