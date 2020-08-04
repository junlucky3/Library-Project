package com.mylibrary.book.admin.mapper;

import java.util.List;

import com.mylibrary.book.admin.vo.BgenVO;

public interface BgenMapper {
	public List<BgenVO> selectAll();
	public void updateBgen(BgenVO vo);
	public void deleteBgen(String email);
	public int userCount();
}
