package service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.BoardVO;
import domain.PagingVO;
import repository.BoardDAO;
import repository.BoardDAOImple;

public class BoardServiceImple implements BoardService {

	private static final Logger log = LoggerFactory.getLogger(BoardServiceImple.class);
	private BoardDAO bdao;
	
	
	
	public BoardServiceImple() {
		bdao = new BoardDAOImple();
	}



	@Override
	public int insert(BoardVO bvo) {
		return bdao.insert(bvo);
	}



	@Override
	public List<BoardVO> getList(PagingVO pgvo) {
		return bdao.getList(pgvo);
	}



	@Override
	public BoardVO selectOne(int bno) {
		return bdao.selectOne(bno);
	}



	@Override
	public int update(BoardVO bvo) {
		return bdao.update(bvo);
	}



	@Override
	public int delete(int bno) {
		//게시글을 지우기 전에 댓글을 삭제하고 글 지우기
		CommentServiceImple csv = new CommentServiceImple();
		int isOk = csv.removaAll(bno);
		log.info("comment removeAll >>>{}",isOk);
		return bdao.delete(bno);
	}



	@Override
	public List<BoardVO> getList(String id) {
		// TODO Auto-generated method stub
		return bdao.getList(id);
	}



	@Override
	public int getTotal(PagingVO pgvo) {
		return bdao.getTotal(pgvo);
	}



	@Override
	public String getFileName(int bno) {
		return bdao.getFileName(bno);
	}



	@Override
	public int viewsUpdate(int bno) {
		
		return bdao.viewsUpdate(bno);
	}
}
