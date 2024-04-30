package repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import orm.DatabaseBuilder;


public class CommentDAOImple implements CommentDAO {
	
	private static final Logger log = LoggerFactory.getLogger(CommentDAOImple.class);
	private SqlSession sql;
	
	public CommentDAOImple() {
		new DatabaseBuilder();
		
		sql = DatabaseBuilder.getFactory().openSession();
	}

	@Override
	public int post(CommentVO cvo) {
		log.info("post dao check 3");
		int isOk = sql.insert("CommentMapper.post",cvo);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public List<CommentVO> getList(int bno) {
		return sql.selectList("CommentMapper.list",bno);
	}

	@Override
	public int remove(int cno) {
		int isOk = sql.delete("CommentMapper.delete",cno);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int modify(CommentVO cvo) {
		int isOk = sql.update("CommentMapper.update",cvo);
		if(isOk>0) {
			sql.commit();
		}
		return isOk;
	}

	@Override
	public int removeAll(int bno) {
		int isOk = sql.delete("CommentMapper.all",bno);
		if(isOk>=0) {
			sql.commit();
		}
		return isOk;
	}
	
	

}
