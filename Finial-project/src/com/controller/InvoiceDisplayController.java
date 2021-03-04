package com.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.ArraytemDTO;
import com.model.BillItemDTO;
import com.model.BillNoDTO;
import com.service.BillService;
import com.util.SelectedItemBean;;

@Controller
@RequestMapping("/")
public class InvoiceDisplayController {

	@Autowired
	@Qualifier("us4")
	private BillService billobj;

	@PostMapping("itemsubmit")
	public ModelAndView displayInvoice(HttpServletRequest request, ModelAndView mav) {

		HttpSession session = request.getSession();
		Enumeration<String> en = request.getParameterNames();
		ArraytemDTO arrItem = (ArraytemDTO) session.getAttribute("Items");

		int id[] = arrItem.getItemId();
		String itemsq[] = arrItem.getItemDescription();
		int price[] = arrItem.getPrice();

		BillNoDTO billnodto = new BillNoDTO();
		int amounttopay = 0;
		int billno = billobj.getBillno();
		List<BillItemDTO> lis = new ArrayList<>();

		billnodto.setBillNo(billno);
		billnodto.setCustomerMobile(session.getAttribute("CustomerMobile").toString());
		billnodto.setDate(new Date());

		System.out.println(id.length + " item length  : " + itemsq.length);

		for (int id0 : id)
			System.out.println(id0);

		for (String desc : itemsq)
			System.out.println(desc);

		while (en.hasMoreElements()) {
			BillItemDTO billitem1 = new BillItemDTO();
			String name = en.nextElement();
			for (int is = 0; is < id.length; is++) {
				if (request.getParameter(id[is] + "") != null && name.equals(id[is] + "")) {
					String item = request.getParameter(id[is] + "");
					int quantity = Integer.parseInt(request.getParameter(itemsq[is]));
					System.out.println(item + ":" + (quantity * price[is]));
					int total = quantity * price[is];
					amounttopay += total;

					billitem1.setSno(lis.size());
					billitem1.setItemId(id[is]);
					billitem1.setQuantity(quantity);
					billitem1.setPrice(quantity * price[is]);
					lis.add(billitem1);

					session.removeAttribute(id[is] + "");
					session.removeAttribute(itemsq[is]);
				}
			}
		}

		List<SelectedItemBean> selectedItems = new ArrayList<>();
		for (BillItemDTO billItem : lis)
			selectedItems.add(new SelectedItemBean(billItem.getSno(), itemsq[billItem.getItemId() - 1],
					billItem.getPrice(), billItem.getQuantity()));

		session.setAttribute("selectedItems", selectedItems);
		session.setAttribute("totalamount", amounttopay);
		session.setAttribute("billno", billno);

		mav.addObject("today", LocalDate.now());
		mav.setViewName("invoice");

		return mav;
	}

	public BillService getBillobj() {
		return billobj;
	}

	public void setBillobj(BillService billobj) {
		this.billobj = billobj;
	}

}
