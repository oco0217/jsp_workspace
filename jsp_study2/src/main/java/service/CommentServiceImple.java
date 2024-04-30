package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import repository.CommentDAO;
import repository.CommentDAOImple;

public class CommentServiceImple implements CommentSerivce {

	private static final Logger log = LoggerFactory.getLogger(CommentServiceImple.class);
	private CommentDAO cdao;
	
	public CommentServiceImple() {
		cdao = new  CommentDAOImple();
	}

	@Override
	public int post(CommentVO cvo) {
		log.info("post service check 2");
		return cdao.post(cvo);
	}

	@Override
	public List<CommentVO> getList(int bno) {
		return cdao.getList(bno);
	}

	@Override
	public int remove(int cno) {
		log.info("remove service 성공");
		return cdao.remove(cno);
	}

	@Override
	public int modify(CommentVO cvo) {
		return cdao.modify(cvo);
	}

	public int removaAll(int bno) {
		return cdao.removeAll(bno);
	}
	
}
