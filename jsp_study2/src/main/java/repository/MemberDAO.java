package repository;

import java.util.List;

import domain.MemberVO;

public interface MemberDAO {

	MemberVO loginInfo(String id);

	List<MemberVO> getList();

	int lastLogin(String id);

	int update(MemberVO mvo);

	int delete(String id);

	int insert(MemberVO mvo);


}
