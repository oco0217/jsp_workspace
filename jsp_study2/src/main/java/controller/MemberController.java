package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import domain.MemberVO;
import service.MemberService;
import service.MemberServiceImple;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/memb/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	private RequestDispatcher rdp;
	private MemberService msv;
	private String destPage;
	private int isOk;

	public MemberController() {
		msv = new MemberServiceImple();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI();
		String path = uri.substring(uri.lastIndexOf("/") + 1);

		log.info(path);

		switch (path) {

		case "join":
			destPage = "/member/join.jsp";
			break;

		case "insert":
			try {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				int age = Integer.parseInt(request.getParameter("age"));
				String phone = request.getParameter("phone");

				MemberVO mvo = new MemberVO(id, pwd, email, age, phone);

				log.info("회원가입 mvo객체>>>>>>{}", mvo);

				isOk = msv.insert(mvo);

				if (isOk > 0) {
					request.setAttribute("joinMsg", "ok");
				}

				destPage = "/index.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "login":
			try {
				String id = request.getParameter("id");
				MemberVO mvo = msv.loginInfo(id);

				log.info("mvo 객체 값{}", mvo);

				if (mvo != null) {
					HttpSession ses = request.getSession();
					ses.setAttribute("ses", mvo);
					ses.setMaxInactiveInterval(5 * 60);
					request.setAttribute("loginMsg", "true");
				}

				if (mvo == null) {
					request.setAttribute("loginMsg", "false");
				}

				destPage = "/index.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}

			break;

		case "logout":
			try {
				HttpSession ses = request.getSession();
				MemberVO mvo = (MemberVO) ses.getAttribute("ses");
				String id = mvo.getId();
				log.info("id값 추출 확인>>>>{}", id);
				isOk = msv.lastLogin(id);
				
				if(isOk>0) {
					request.setAttribute("logoutMsg", "ok");
					ses.invalidate();
				}
				
				destPage = "/index.jsp";
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "list":
			try {

				List<MemberVO> list = msv.getList();
				request.setAttribute("list", list);
				log.info("list 객체 출력 {}", list);

				destPage = "/member/list.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "modify":
			destPage = "/member/modify.jsp";
			break;

		case "update":

			try {
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				String email = request.getParameter("email");
				int age = Integer.parseInt(request.getParameter("age"));
				String phone = request.getParameter("phone");
				MemberVO mvo = new MemberVO(id, pwd, email, age, phone);

				log.info("update mvo 객체 값>>>>>{}", mvo);
				

				isOk = msv.update(mvo);

				log.info("회원정보 수정 업데이트 " + (isOk > 0 ? "성공" : "실패"));

				if (isOk > 0) {
					request.setAttribute("modifyMsg", "ok");
					HttpSession ses = request.getSession();
					ses.invalidate(); // Session invalidate
				}

				destPage = "/index.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "delete":

			try {

				HttpSession ses = request.getSession();

				String id = ((MemberVO) ses.getAttribute("ses")).getId();

				isOk = msv.delete(id);

				if (isOk > 0) {
					ses.invalidate();
					request.setAttribute("deleteMsg", "ok");
				}

				destPage = "/index.jsp";

			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		}

		rdp = request.getRequestDispatcher(destPage);
		rdp.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		service(request, response);
	}

}
