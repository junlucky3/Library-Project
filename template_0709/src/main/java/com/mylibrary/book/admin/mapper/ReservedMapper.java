package com.mylibrary.book.admin.mapper;

import java.util.List;
import java.util.Map;

import com.mylibrary.book.admin.vo.ReservedVO;

public interface ReservedMapper {
	public List<ReservedVO> showAll();	  //목록보기
	public ReservedVO getReserved(int resid);	// 특정레코드보기
	public void insertReserved(ReservedVO vo); //쓰기
	public int updateReserved(int resid);  //수정
	public int deleteReserved(String resid);  //삭제
	public void deleteReservedByEmail(String resemail);
	public List<Map<String,String>> showReserveList();
}
