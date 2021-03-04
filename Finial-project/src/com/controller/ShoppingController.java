package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.ArraytemDTO;
import com.service.ItemService;

@Controller
@RequestMapping("/")
public class ShoppingController {

	@Autowired
	@Qualifier("us3")
	private ItemService itemservice;

	@PostMapping("shopping")
	public ModelAndView processItems(HttpServletRequest request, ModelAndView mandv) {
		HttpSession session = request.getSession();
		ArraytemDTO obj = itemservice.getItems();
		session.setAttribute("Items", obj);
		int itemsLength = obj.getItemDescription().length - 1;
		mandv.addObject("itemsLength", itemsLength >= 0 ? itemsLength : 0);
		mandv.setViewName("shop");
		return mandv;
	}

	public ItemService getItemservice() {
		return itemservice;
	}

	public void setItemservice(ItemService itemservice) {
		this.itemservice = itemservice;
	}
}
