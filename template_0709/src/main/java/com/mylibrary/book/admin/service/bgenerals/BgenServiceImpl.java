package com.mylibrary.book.admin.service.bgenerals;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.code.ssm.api.ParameterValueKeyProvider;
import com.google.code.ssm.api.ReadThroughAssignCache;
import com.google.code.ssm.api.ReadThroughSingleCache;
import com.mylibrary.book.admin.mapper.BgenMapper;
import com.mylibrary.book.admin.vo.BgenVO;

@Service
public class BgenServiceImpl implements BgenService{
	@Autowired
	SqlSession sqlSession;

	@Override
	@ReadThroughAssignCache(namespace="bgen", assignedKey="list")
	public List<BgenVO> showAll() {
		BgenMapper bgenMapper = sqlSession.getMapper(BgenMapper.class);
		return bgenMapper.selectAll();
	}

	@Override
	@ReadThroughSingleCache(namespace="bgen")
	public BgenVO getBgen(@ParameterValueKeyProvider String email) {
		BgenMapper bgenMapper = sqlSession.getMapper(BgenMapper.class);
		
		List<BgenVO> lst = bgenMapper.selectAll();
		for(int i=0;i<lst.size();i++) {
			if(lst.get(i).getEmail().equals(email)) {
				return lst.get(i);
			}
		}
		System.out.println("Error at -- getBgen() -- in BgenService");
		return null;
	}

	@Override
	public void modifyUserInfo(BgenVO vo) {
		sqlSession.getMapper(BgenMapper.class).updateBgen(vo);
		System.out.println("update user info successfully");
	}

	@Override
	public void deleteUserInfo(String email) {
		sqlSession.getMapper(BgenMapper.class).deleteBgen(email);
		System.out.println("delete user info successfully");
	}

	@Override
	public int userCount() {
		return sqlSession.getMapper(BgenMapper.class).userCount();
	}
	
	
}
