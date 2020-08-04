package com.mylibrary.book.admin.service.borrowed;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylibrary.book.admin.mapper.BorrowedMapper;
import com.mylibrary.book.admin.vo.BorrowedVO;

@Service
public class BorrowedServiceImpl implements BorrowedService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BorrowedVO> showAll() {
		BorrowedMapper borrowedMapper = sqlSession.getMapper(BorrowedMapper.class);
		return borrowedMapper.selectAll();
	}

	@Override
	public void borrowedDelete(String rentid) {
		BorrowedMapper borrowedMapper = sqlSession.getMapper(BorrowedMapper.class);
		borrowedMapper.borrowedDelete(rentid);
	}

	@Override
	public void borrowedDeleteByEmail(String renemail) {
		BorrowedMapper borrowedMapper = sqlSession.getMapper(BorrowedMapper.class);
		borrowedMapper.borrowedDeleteByEmail(renemail);
	}
	
	public List<Map<String,String>> showLendingList(){
		BorrowedMapper borrowedMapper = sqlSession.getMapper(BorrowedMapper.class);
		Set s = borrowedMapper.showLendingList().get(0).keySet();
		Iterator iter = s.iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		
//		System.out.println(borrowedMapper.showLendingList().get(0).);
		return borrowedMapper.showLendingList();
	}
}
