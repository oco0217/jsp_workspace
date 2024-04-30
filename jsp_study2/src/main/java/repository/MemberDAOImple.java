package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import orm.DatabaseBuilder;

public class MemberDAOImple implements MemberDAO {
	
	private static final Logger log = LoggerFactory.getLogger(MemberDAOImple.class);
	private SqlSession sql;
	
	public MemberDAOImple() {
		new DatabaseBuilder();
		sql = DatabaseBuilder.getFactory().openSession();
		
	}

	@Override
	public MemberVO loginInfo(String id) {
		
		log.info("member dao Ok");
		
		return sql.selectOne("MemberMapper.loginInfo",id);
	}

	@Override
	public List<MemberVO> getList() {
		return sql.selectList("MemberMapper.list");
	}

	@Override
	public int lastLogin(String id) {
		int isOk = sql.update("MemberMapper.lastLogin",id);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int update(MemberVO mvo) {
		log.info("update DAO 성공!");
		int isOk = sql.update("MemberMapper.update",mvo);
		
		if(isOk>0) {
		sql.commit();	
		}
		return isOk;
	}

	@Override
	public int delete(String id) {
		int isOk = sql.delete("MemberMapper.delete",id);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int insert(MemberVO mvo) {
		log.info("insert DAO 성공");
		int isOk = sql.insert("MemberMapper.insert",mvo);
		if(isOk>0){
			sql.commit();
		}
		return isOk;
	}


}
