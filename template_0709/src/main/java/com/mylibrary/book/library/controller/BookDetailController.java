package com.mylibrary.book.library.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.mylibrary.book.admin.service.borrowed.BorrowedService;
import com.mylibrary.book.admin.service.reserved.ReservedService;
import com.mylibrary.book.admin.vo.BorrowedVO;
import com.mylibrary.book.admin.vo.ReservedVO;
import com.mylibrary.book.library.service.BooklistDetailService;

@Controller
@RequestMapping("/user")
public class BookDetailController {

	@Autowired
	BooklistDetailService BooklistDetailservice;

	@Autowired
	BorrowedService borrowedService;

	@Autowired
	ReservedService reservedService;
	
	@Autowired
	private JavaMailSender mailSender;

	// action to put in data table //
	void lendingWhenReturn(String bid) { // have to do 'returnDelete" first, then do this method
		int mn = 1000000000;
		ReservedVO rsv = null;
		List<ReservedVO> temp = reservedService.showAll();

		for (ReservedVO rv : temp) {
			if (rv.getResbid().equals(bid)) {
				if (Integer.parseInt(rv.getResid()) < mn) {
					mn = Integer.parseInt(rv.getResid());
					rsv = rv;
				}
			}
		}

		if (rsv == null)
			return;

		Map<String, String> mp = new HashMap<String, String>();
		mp.put("renemail", rsv.getResemail());
		mp.put("renbid", rsv.getResbid());

		BooklistDetailservice.insertLending(mp); // put the reserver automatically when someone return the book
		mp.clear();
		mp.put("resemail", rsv.getResemail());
		mp.put("resbid", rsv.getResbid());
		BooklistDetailservice.reservedDelete(mp);
		ressendemail(rsv.getResemail(), rsv.getResbid());
	}

	void ressendemail(String email, String bid) {
		String setfrom = "libraria@libraria";
		String tomail = email; // 받는 사람 이메일
		String title = BooklistDetailservice.bshowDetail(bid).getTitle(); // 제목
		String content = "["+title+ "] 책이 대여되었습니다. 홈페이지에서 확인해주세요."; // 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); 		// 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); 			// 받는사람 이메일
			messageHelper.setSubject("대여 관련 사항"); 	// 메일제목은 생략이 가능하다
			messageHelper.setText(content);			// 메일 내용

			mailSender.send(message);
			
		} catch (Exception e) {
			System.out.println(e);
			e.getMessage();
		}
	}
	
	
	String checkExist(String bid, String email) {
		for (BorrowedVO br : borrowedService.showAll()) {
			if (br.getRenbid().equals(bid)) {
				if (br.getRenemail().equals(email)) {
					if (br.getIsExpanded() == 0) {
						return "return";
					} else {
						return "expanded";
					}
				} else {
					for (ReservedVO rv : reservedService.showAll()) {
						if (rv.getResbid().equals(bid)) {
							if (rv.getResemail().equals(email))
								return "reserved cancel";
							else
								return "reserved";
						}
					}
				}
				return "reserved";
			}
		}
		return "lending";
	}
	
	
	@RequestMapping("/bbookDetail")
	public ModelAndView bshowDetail(HttpServletRequest request, @RequestParam String bid) {
//		System.out.println(checkExist(bid, "email"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("booklist", BooklistDetailservice.bshowDetail(bid));

		HttpSession session = request.getSession();
		System.out.println(session);
		if (session.getAttribute("email") == null) {
			mav.addObject("out", checkExist(bid, (String) session.getAttribute("email")));
			System.out.println(checkExist(bid, "email"));
		} else {
			mav.addObject("in", checkExist(bid, (String) session.getAttribute("email")));
		}

		mav.setViewName("library/books-media-detail-v2");
		return mav;
	}

	@RequestMapping("/lendinginsertdo")
	public void lendinginsertdo(@RequestParam String bid, @SessionAttribute String email, Model model, HttpServletResponse response) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("renemail", email);
		map.put("renbid", bid);
		BooklistDetailservice.insertLending(map);
		BooklistDetailservice.updatebcount(bid);
//		model.addAttribute("bid",bid);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('Lendded Successfully'); location.href='bbookDetail?bid="+bid+"';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		return "redirect:bbookDetail";
	}

	@RequestMapping("/exdateupdatedo")
	public void exdateupdatedo(@RequestParam String bid, @SessionAttribute String email, Model model, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();

		map.put("renemail", email);
		map.put("renbid", bid);
		BooklistDetailservice.exdateupdate(map);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('Extended Successfully'); location.href='bbookDetail?bid="+bid+"';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("bid",bid);
//		return "redirect:bbookDetail";
	}

	@RequestMapping("/returndeletedo")
	public void returndeletedo(@RequestParam String bid, @SessionAttribute String email, Model model, HttpServletResponse response) {
		System.out.println("returndeletedo" + bid);
		Map<String, String> map = new HashMap<String, String>();
		map.put("renemail", email);
		map.put("renbid", bid);
		BooklistDetailservice.returnDelete(map);

		lendingWhenReturn(bid);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('Returned Successfully'); location.href='bbookDetail?bid="+bid+"';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("bid",bid);
//		return "redirect:bbookDetail";
	}

	@RequestMapping("/reservedinsertdo")
	public void reservedinsertdo(@RequestParam String bid, @SessionAttribute String email, Model model, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("resemail", email);
		map.put("resbid", bid);
		BooklistDetailservice.reservedInsert(map);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('Reserved Successfully'); location.href='bbookDetail?bid="+bid+"';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("bid",bid);
//		return "redirect:bbookDetail";
	}

	@RequestMapping("/reserveddeletedo")
	public void reserveddelete(@RequestParam String bid, @SessionAttribute String email, Model model, HttpServletResponse response) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("resemail", email);
		map.put("resbid", bid);
		BooklistDetailservice.reservedDelete(map);
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('Reservation is cancelled'); location.href='bbookDetail?bid="+bid+"';</script>");
		} catch(Exception e) {
			e.printStackTrace();
		}
		
//		model.addAttribute("bid",bid);
//		return "redirect:bbookDetail";
	}
}
