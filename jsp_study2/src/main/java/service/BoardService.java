package service;

import java.util.List;

import domain.BoardVO;
import domain.PagingVO;

public interface BoardService {

	int insert(BoardVO bvo);

	List<BoardVO> getList(PagingVO pgvo);

	BoardVO selectOne(int bno);

	int update(BoardVO bvo);

	int delete(int bno);

	List<BoardVO> getList(String id);

	int getTotal(PagingVO pgvo);

	String getFileName(int bno);

	int viewsUpdate(int bno);


}
