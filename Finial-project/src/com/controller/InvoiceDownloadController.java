package com.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.util.SelectedItemBean;

@Controller
@RequestMapping("/")
public class InvoiceDownloadController {

	@SuppressWarnings("unchecked")
	@GetMapping("generatePdf")
	public ModelAndView generatePdf(HttpServletRequest req,ModelAndView mav) {

		HttpSession session = req.getSession();
		List<SelectedItemBean> items = (List<SelectedItemBean>) session.getAttribute("selectedItems");
		int total = (int) session.getAttribute("totalamount");
		int billno = (int) session.getAttribute("billno");

		Document document = new Document();

		try {
			PdfWriter.getInstance(document, new FileOutputStream("/Users/krishgokul/Documents/invoiceBill/invoice.pdf"));
			document.open();
			System.out.println("pdf started");

			Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
			PdfPTable table = new PdfPTable(4);
			PdfPCell cell = new PdfPCell();

			Paragraph preface = new Paragraph();
			preface.add("Invoice of The Purchase");
			document.add(Chunk.NEWLINE);
			preface.setAlignment(Element.ALIGN_CENTER);
			document.add(preface);

			Paragraph preface1 = new Paragraph();
			preface1.add("Billno:");
			preface1.add(billno + "");
			document.add(preface1);
			document.add(Chunk.NEWLINE);

			Paragraph preface2 = new Paragraph();
			preface2.add("CustomerName:");
			preface2.add(session.getAttribute("CustomerName").toString());
			document.add(preface2);
			document.add(Chunk.NEWLINE);

			Paragraph preface3 = new Paragraph();
			preface3.add("CustomerMobile:");
			preface3.add(session.getAttribute("CustomerMobile").toString());
			document.add(preface3);
			document.add(Chunk.NEWLINE);

			table.addCell(new Phrase("sno"));
			table.addCell(new Phrase("name"));
			table.addCell(new Phrase("quantity"));
			table.addCell(new Phrase("price"));

			for (SelectedItemBean item : items) {
				table.addCell(new Phrase(String.valueOf(item.getSno()+1)));
				table.addCell(new Phrase(item.getName()));
				table.addCell(new Phrase(String.valueOf(item.getQuantity())));
				table.addCell(new Phrase(String.valueOf(item.getPrice())));
			}
			table.addCell(new Phrase(""));
			table.addCell(new Phrase(""));
			table.addCell(new Phrase("Total"));
			table.addCell(new Phrase(""+total));
			document.add(table);
			document.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("invoice");
		mav.addObject("lastMsg","Your PDF has been downloaded");
		return mav;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("generateXl")
	public ModelAndView generateXl(HttpServletRequest req,ModelAndView mav) {
		HttpSession session = req.getSession();
		List<SelectedItemBean> items = (List<SelectedItemBean>) session.getAttribute("selectedItems");
		int total = (int) session.getAttribute("totalamount");
		int billno = (int) session.getAttribute("billno");

		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("bill " + billno + " invoice");
		int rowNumber = 0;
		HSSFRow headingRow = sheet.createRow(rowNumber);
		headingRow.createCell(0).setCellValue("SNo");
		headingRow.createCell(1).setCellValue("Name");
		headingRow.createCell(2).setCellValue("quantity");
		headingRow.createCell(3).setCellValue("price");
		for (SelectedItemBean item : items) {
			HSSFRow row = sheet.createRow(++rowNumber);
			row.createCell(0).setCellValue(item.getSno()+1);
			row.createCell(1).setCellValue(item.getName());
			row.createCell(2).setCellValue(item.getQuantity());
			row.createCell(3).setCellValue(item.getPrice());
		}
		HSSFRow endingRow = sheet.createRow(++rowNumber);
		endingRow.createCell(0).setCellValue("");
		endingRow.createCell(1).setCellValue("");
		endingRow.createCell(2).setCellValue(("Total Price "));
		endingRow.createCell(3).setCellValue((total));
		try {
			FileOutputStream out = new FileOutputStream("/Users/krishgokul/Documents/invoiceBill/invoice.xls");
			wb.write(out);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mav.setViewName("invoice");
		mav.addObject("lastMsg","Your Excel has been downloaded");
		return mav;
	}

}
