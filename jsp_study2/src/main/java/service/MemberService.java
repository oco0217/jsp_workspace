package service;

import java.util.List;

import domain.MemberVO;

public interface MemberService {

	MemberVO loginInfo(String id);

	List<MemberVO> getList();

	int lastLogin(String id);

	int update(MemberVO mvo);

	int delete(String id);

	int insert(MemberVO mvo);


}
