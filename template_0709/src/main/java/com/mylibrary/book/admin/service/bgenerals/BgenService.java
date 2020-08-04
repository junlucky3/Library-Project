package com.mylibrary.book.admin.service.bgenerals;

import java.util.List;

import com.mylibrary.book.admin.vo.BgenVO;

public interface BgenService {
	public List<BgenVO> showAll();
	public BgenVO getBgen(String email);
	public void modifyUserInfo(BgenVO vo);
	public void deleteUserInfo(String email);
	public int userCount();
}
