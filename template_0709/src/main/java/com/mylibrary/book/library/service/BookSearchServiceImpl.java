package com.mylibrary.book.library.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.code.ssm.api.ReadThroughAssignCache;
import com.mylibrary.book.admin.vo.BooklistVO;
import com.mylibrary.book.library.mapper.BbooklistMapper;

@Service
public class BookSearchServiceImpl implements BookSearchService {

	@Autowired
	private SqlSession sqlSession;


	@Override
	@ReadThroughAssignCache(namespace="library", assignedKey="searchlist") 
	public List<BooklistVO> showList() {
		BbooklistMapper bbooklistMapper = sqlSession.getMapper(BbooklistMapper.class);
		return bbooklistMapper.bshowList();
	}
	
	@Override
	public List<BooklistVO> searchBook(String title) {
		List<BooklistVO> ret = new ArrayList<BooklistVO>();
		long bfTime = System.currentTimeMillis();
		List<BooklistVO> temp = showList();
		long afTime = System.currentTimeMillis();
		System.out.println("searchBook : " + (afTime-bfTime) + "miliseconds");
		for(BooklistVO bsv:temp) if(bsv.getTitle().contains(title)) ret.add(bsv);
		return ret;
	}
	

}
