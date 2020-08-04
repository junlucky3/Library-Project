package com.mylibrary.book.admin.service.reserved;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mylibrary.book.admin.mapper.ReservedMapper;
import com.mylibrary.book.admin.vo.ReservedVO;

@Service
public class ReservedServiceImpl implements ReservedService {

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<ReservedVO> showAll() {		
		ReservedMapper reservedMapper = sqlSession.getMapper(ReservedMapper.class);
		return reservedMapper.showAll();
	}

	@Override
	public ReservedVO getReserved(int resid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReserved(ReservedVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public int updateReserved(int resid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReserved(String resid) {
		ReservedMapper reservedMapper = sqlSession.getMapper(ReservedMapper.class);
		return reservedMapper.deleteReserved(resid);
	}

	@Override
	public void deleteReservedByEmail(String resemail) {
		ReservedMapper reservedMapper = sqlSession.getMapper(ReservedMapper.class);
		reservedMapper.deleteReservedByEmail(resemail);
	}
	
	@Override
	public List<Map<String,String>> showReserveList(){
		ReservedMapper reservedMapper = sqlSession.getMapper(ReservedMapper.class);
		return reservedMapper.showReserveList();
	}
	
}
