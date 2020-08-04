package com.mylibrary.book.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mylibrary.book.admin.service.bgenerals.BgenService;
import com.mylibrary.book.admin.service.income.IncomeService;
import com.mylibrary.book.admin.service.index.IndexService;
import com.mylibrary.book.admin.service.orders.OrdersService;
import com.mylibrary.book.admin.vo.IncomeVO;
import com.mylibrary.book.admin.vo.IndexVO;
import com.mylibrary.book.admin.vo.OrdersVO;

@Controller
@RequestMapping("/admin")
public class IndexController {
	
	@Autowired
	private IndexService indexService;
	
	@Autowired
	private IncomeService incomeService;
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private BgenService bgenService;
	
	@RequestMapping("/index")
	public ModelAndView showMain() {
		ModelAndView mav = new ModelAndView();
		List<IndexVO> indexList = indexService.showAll();
		System.out.println(indexList);
		mav.addObject("indexList",indexList);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
		
		int icm = 0; int odr = 0;
		
		List<IncomeVO> icms = incomeService.showAll();
		List<OrdersVO> odrs = ordersService.showAll();
		
		System.out.println(sdf.format(d));
		
		for(IncomeVO iv:icms) if(iv.getIdate().contains(sdf.format(d).toString())) icm+=iv.getPrice();
		for(OrdersVO ov:odrs) if(ov.getOdate().contains(sdf.format(d).toString())) odr+=ov.getTotalcost();
		
		mav.addObject("balance",Integer.toString(icm-odr));
		mav.addObject("icm",icm);
		mav.addObject("odr",odr);
		mav.addObject("usrs",bgenService.userCount());
		
		mav.setViewName("admin/index");
		return mav;
	}
	
}
