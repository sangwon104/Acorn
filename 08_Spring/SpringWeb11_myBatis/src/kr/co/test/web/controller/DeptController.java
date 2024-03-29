package kr.co.test.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.test.web.dao.Dao;
import kr.co.test.web.dto.DeptDTO;

@Controller
public class DeptController {
	@Autowired
	Dao dao;
	@RequestMapping("/deptList.do")
	public ModelAndView list(){
		
		return new ModelAndView("list", "list", dao.selectAll());
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.GET)
	public String insertForm(){
		return "insertForm";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public String insertOk(@ModelAttribute("DeptDTO")DeptDTO dto){
		dao.insertOne(dto);
		return "redirect:/deptList.do";
	}
}
