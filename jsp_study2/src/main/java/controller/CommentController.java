package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.CommentVO;
import service.CommentSerivce;
import service.CommentServiceImple;


@WebServlet("/cmt/*")
public class CommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(CommentController.class);
	private CommentSerivce csv;
	private int isOk;
       

    public CommentController() {
    	csv = new CommentServiceImple();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비동기 통신은 데이터를 요청한 곳으로 바로 결과를 보내주는 방식
		//RequestDispather 와 destPage 가 필요가 없음 , content Type 도 설정할 필요가 없어진다.
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String url = request.getRequestURI();
		String path = url.substring(url.lastIndexOf("/")+1);
		log.info(">>>>>> cmt path > {}",path);
		
		switch (path) {
		case "post":
			try {
				log.info("post case check 1");
				//js에서 보낸 데이터를 읽어들이는 작업
				//js(Object) -> controller(String)
				//{...}
				StringBuffer sb = new StringBuffer();
				String line = "";
				BufferedReader br = request.getReader(); //여기에 댓글 객체가 들어가있음.
				while((line = br.readLine()) != null) {
					sb.append(line);
				}
				log.info(">>>>sb>>{}",sb.toString());
				//이 값을 객체로 생성
				JSONParser parser = new JSONParser();
				JSONObject jsonObj  = (JSONObject)parser.parse(sb.toString());
				
				//key를 이용하여 value를 추출
				int bno = Integer.parseInt(jsonObj.get("bno").toString());
				String writer = jsonObj.get("writer").toString();
				String content = jsonObj.get("content").toString();
				
				CommentVO cvo = new CommentVO(bno,writer,content);
				int isOk = csv.post(cvo);
				log.info("isOk>>>>" + (isOk>0?"성공":"실패"));
				
				
				//결과 데이터 전송 => 화면으로 전송(response 객체의 body에 기록)
				PrintWriter out = response.getWriter();
				out.print(isOk);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "list": 
			try {
				int bno = Integer.parseInt(request.getParameter("bno"));
				log.info(">>>> parameter bno>>"+bno);
				List <CommentVO> list = csv.getList(bno);
				log.info("CommentList>>>>>{}",list);	
				
				//list => json 변환 후 보내기
				//[{...},{...},{...}] : [] JSONArray
				//{...} : JSONObject
				
				JSONArray jsonObjList = new JSONArray();
				JSONObject [] jsonObjArr = new JSONObject[list.size()]; 
				for(int i=0; i<list.size(); i++) {
					jsonObjArr[i] = new JSONObject();
					jsonObjArr[i].put("cno", list.get(i).getCno());
					jsonObjArr[i].put("bno", list.get(i).getBno());
					jsonObjArr[i].put("writer", list.get(i).getWriter());
					jsonObjArr[i].put("content", list.get(i).getContent());
					jsonObjArr[i].put("regdate", list.get(i).getRegdate());
					
					jsonObjList.add(jsonObjArr[i]);
					
					
				}
				
				//`[{...},{...},{...}]` => Obj를 String 변환하여 전송
				String jsonData = jsonObjList.toJSONString();
				
				PrintWriter out = response.getWriter();
				out.print(jsonData);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "modify" :
			try {
				StringBuffer sb = new StringBuffer();
				String line = "";
				BufferedReader br = request.getReader();
				while((line = br.readLine()) != null) {
					sb.append(line);	
				}
				
				JSONParser parser = new JSONParser();
				JSONObject jsonObj = (JSONObject)parser.parse(sb.toString());
				
				int cno = Integer.parseInt(jsonObj.get("cno").toString());
				String content = jsonObj.get("content").toString();
				
				CommentVO cvo = new CommentVO(cno,content);
				
				isOk = csv.modify(cvo);
				
				log.info("수정isOk>>>>" + (isOk>0?"성공":"실패"));
				
				
				//결과 데이터 전송 => 화면으로 전송(response 객체의 body에 기록)
				PrintWriter out = response.getWriter();
				out.print(isOk);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "remove" :
			try {
				int cno = Integer.parseInt(request.getParameter("cno"));
				int isOk = csv.remove(cno);
				
				log.info("comment remove >>{}",(isOk>0?"성공":"실패"));
				
				PrintWriter out = response.getWriter();
				out.print(isOk);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request, response);
	}

}
