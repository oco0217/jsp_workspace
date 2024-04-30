package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import repository.MemberDAO;
import repository.MemberDAOImple;

public class MemberServiceImple implements MemberService {

	private static final Logger log = LoggerFactory.getLogger(MemberServiceImple.class);
	private MemberDAO mdao;
	
	public MemberServiceImple() {
		mdao = new MemberDAOImple();
	}

	@Override
	public MemberVO loginInfo(String id) {
		log.info("member service Ok");
		return mdao.loginInfo(id);
	}

	@Override
	public List<MemberVO> getList() {
		return mdao.getList();
	}

	@Override
	public int lastLogin(String id) {
		return mdao.lastLogin(id);
	}

	@Override
	public int update(MemberVO mvo) {
		log.info("Update 서비스 성공!");
		return mdao.update(mvo);
	}

	@Override
	public int delete(String id) {
		return mdao.delete(id);
	}

	@Override
	public int insert(MemberVO mvo) {
		return mdao.insert(mvo);
	}

	
}
