package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;


@WebServlet("/pbc")
public class PhoneController extends HttpServlet {
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//컨트롤러 테스트
		System.out.println("controller");
		
		//파라미터 action 값을 읽어서
		String action = request.getParameter("action");
		System.out.println(action);
		

		if("list".equals(action)) {
			System.out.println("리스트처리");
			//리스트 출력  처리
			PhoneDao phoneDao = new PhoneDao();
			List<PersonVo> personList = phoneDao.getPersonList();
			
			//System.out.println(personList.toString());
			
			//html --> 복잡하다 --> jsp가 편하다
			
			//데이터 전달
			request.setAttribute("pList", personList);
			
			//jsp에 포워드 시킨다.
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/list.jsp"); 
			rd.forward(request, response);
		
		} else if("wform".equals(action)) {
			System.out.println("등록 폼 처리");
			
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/writeForm.jsp");
			rd.forward(request, response);
			
		} else if("insert".equals(action)) {
			System.out.println("전화번호 저장");
			
			//파라미터 3개 값
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			//personVo묶고
			PersonVo personVo = new PersonVo(name, hp, company);
			
			//new dao --> 저장
			PhoneDao phoneDao = new PhoneDao();
			phoneDao.personInsert(personVo);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		} else if("delete".equals(action)) {
			System.out.println("삭제");
			
			//아이디 파라미터값
			int personId = Integer.parseInt(request.getParameter("personId"));
			
			//phoneDao의 delete메소드에 id 담기
			PhoneDao phoneDao = new PhoneDao();
			phoneDao.personDelete(personId);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
			
		} else if("upform".equals(action)) {
			System.out.println("수정폼");
			
			//id를 주면 id에 해당하는 person정보를 가져온다.
			//아이디 파라미터 int형으로 담기
			int personId = Integer.parseInt(request.getParameter("personId"));

			PhoneDao phoneDao = new PhoneDao();
			PersonVo personVo = phoneDao.getPerson(personId);
			
			//데이터 전달
			request.setAttribute("personVO", personVo);
			
			//jsp에 포워드
			RequestDispatcher rd = request.getRequestDispatcher("./WEB-INF/updateForm.jsp");
			rd.forward(request, response);
			
		} else if("update".equals(action)) {
			System.out.println("수정");
			
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			int personId = Integer.parseInt(request.getParameter("personId"));
			
			PersonVo personVo = new PersonVo(personId, name, hp, company);
			
			PhoneDao phoneDao = new PhoneDao();
			phoneDao.personUpdate(personVo);
			
			response.sendRedirect("/phonebook2/pbc?action=list");
		}
		
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
	}

}
