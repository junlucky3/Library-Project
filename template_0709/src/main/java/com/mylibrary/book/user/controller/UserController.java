package com.mylibrary.book.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mylibrary.book.admin.dao.badmin.BadminDAO;
import com.mylibrary.book.admin.service.borrowed.BorrowedService;
import com.mylibrary.book.admin.service.reserved.ReservedService;
import com.mylibrary.book.admin.vo.BadminVO;
import com.mylibrary.book.library.service.BbooklistService;
import com.mylibrary.book.library.service.UserNoticeService;
import com.mylibrary.book.user.dao.UserDAO;
import com.mylibrary.book.user.service.ShaEncoder;

@Controller // 컨트롤러 빈
@RequestMapping("/user")
public class UserController {

	@Inject
	ShaEncoder shaEncoder; // 암호화 빈

	@Inject
	UserDAO userDao;

	@Inject
	BbooklistService bbooklistService;

	@Inject
	UserNoticeService userNoticeService;

	@Inject
	BadminDAO badminDAO;
	
	@Inject
	BorrowedService borrowedService;
	
	@Inject
	ReservedService reservedService;

	// index 페이지로 이동
	@RequestMapping("/index")
	public String home(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		if (session.getAttribute("email") != null) {
			if (badminDAO.showAll().contains(new BadminVO((String) session.getAttribute("email"))))
				session.setAttribute("role", "admin");
			else
				session.setAttribute("role", "gen");
		}

		model.addAttribute("bbooklist", bbooklistService.selectCount());
		model.addAttribute("bnotice", userNoticeService.boardNotice());
		System.out.println(userNoticeService.boardNotice().size());

		return "library/index"; // home.jsp로 이동

	}

	// 에러 페이지로 이동
	@RequestMapping("/error") // 시작 페이지
	public String error(Model model) {
		return "library/404"; // home.jsp로 이동
	}

	// contact 페이지로 이동
	@RequestMapping("/contact") // 시작 페이지
	public String contact(Model model) {
		return "library/contact"; // home.jsp로 이동
	}

	// service 페이지로 이동 -> about 페이지
	@RequestMapping("/about") // 시작 페이지
	public String about(Model model) {
		return "library/services"; // home.jsp로 이동
	}

	// 책 리스트로 이동
	@RequestMapping("/bookList") // 시작 페이지
	public String bookList(Model model) {
		return "library/books-media-list-view"; // home.jsp로 이동
	}

	// 책 디테일 페이지로 이동
	@RequestMapping("/bookDetail") // 시작 페이지
	public String bookDetail(Model model) {
		return "library/books-media-detail-v2"; // home.jsp로 이동
	}

	// 희망도서 페이지로 이동
	@RequestMapping("/hopeBook") // 시작 페이지
	public String hopeBook(Model model) {
		return "library/hopebook"; // home.jsp로 이동
	}

	// 공지사항 리스트 페이지로 이동
	@RequestMapping("/eventList") // 시작 페이지
	public String eventList(Model model) {
		return "library/news-events-list-view"; // home.jsp로 이동
	}

	// 공지사항 detail 페이지로 이동
	@RequestMapping("/eventDetail") // 시작 페이지
	public String eventDetail(Model model) {
		return "library/news-events-detail"; // home.jsp로 이동
	}

	// 로그인 페이지로 이동
	@RequestMapping("/login")
	public String login() {
		return "library/signin";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/join")
	public String join() {
		return "library/signup";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/email")
	public String email() {
		return "library/EMAIL-pwdrequest";
	}

	@RequestMapping("/mypage")
	public String mypage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		Map<String, Object> user = userDao.selectUserNoAs(email);
		System.out.println(user);
		request.setAttribute("user", user);
		
		List<Map<String,String>> bss = borrowedService.showLendingList();
		List<Map<String,String>> rss = reservedService.showReserveList();
		
//		if(temp.get(0).containsKey("EMAIL")) System.out.println("email key is contained !!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		request.setAttribute("rentlist", bss);
		request.setAttribute("reslist",rss);
		return "library/mypage";
	}

	// 회원가입 처리
	@RequestMapping("/insertUser")
	public String insertUser(@RequestParam String email, @RequestParam String passwd, @RequestParam String passwdre,
			@RequestParam String name, @RequestParam String birth, @RequestParam String phone,
			@RequestParam String address, @RequestParam String authority, HttpServletResponse response) {

		// 비밀번호 암호화
		if (!(passwd.equals(passwdre)) || (userDao.selectUser(email) != null)) {
//			System.out.println("password가 다르거나 이미 존재하는 이메일입니다.");
			System.out.println("This email is already register, or your password does not match! Please try again!");
//			try {
//				response.sendRedirect("join");
//				return;
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			return "join";
		}
		String dbpw = shaEncoder.saltEncoding(passwd, email);
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", dbpw);
		map.put("name", name);
		map.put("birth", birth);
		map.put("phone", phone);
		map.put("address", address);
		map.put("authority", authority);
		// affected rows, 영향을 받은 행의 수가 리턴됨
		int result = userDao.insertUser(map);

//		try {
//			PrintWriter pwr = response.getWriter();
//			pwr.write("<script language=javascript>alert('Registered successfully!'); location.href='login';</script>");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return "library/signin"; // login.jsp로 이동
	}
}
