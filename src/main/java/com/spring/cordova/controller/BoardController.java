package com.spring.cordova.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.cordova.dto.BoardDTO;
import com.spring.cordova.dto.MemberDTO;
import com.spring.cordova.dto.PagingVO;
import com.spring.cordova.service.BoardService;
import com.spring.cordova.util.UploadFileUtils;

@Controller
public class BoardController {
	
	@Inject
	private BoardService bService;

	//게시글 리스트 출력
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(HttpServletRequest request, Model model) throws Exception {

		int totalCount = bService.boardListCount();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);
		
		page = (page - 1) * 10;
		
		HashMap<String, Integer> boardListMap = new HashMap<String, Integer>();
		boardListMap.put("Page", page);
		boardListMap.put("PageSize", paging.getPageSize());
		
		List<BoardDTO> List = bService.boardList(boardListMap);
		
		model.addAttribute("BoardList", List);
		model.addAttribute("Paging", paging);
		return "board/boardList";
	}
	
	//게시글 검색 리스트 출력
	@RequestMapping(value = "boardSearchList", method = RequestMethod.GET)
	public String boardSearchList(@RequestParam("keyword") String keyword, @RequestParam("searchDate") String searchDate, HttpServletRequest request, Model model) throws Exception {

		HashMap<String, Object> boardSearchListMap = new HashMap<String, Object>();
		boardSearchListMap.put("keyword", keyword);
		boardSearchListMap.put("searchDate", searchDate);

		int totalCount = bService.boardSearchListCount(boardSearchListMap);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

		PagingVO paging = new PagingVO();
		paging.setPageNo(page);
		paging.setPageSize(10);
		paging.setTotalCount(totalCount);

		page = (page - 1) * 10;

		boardSearchListMap.put("Page", page);
		boardSearchListMap.put("PageSize", paging.getPageSize());

		List<BoardDTO> List = bService.boardSearchList(boardSearchListMap);

		model.addAttribute("BoardList", List);
		model.addAttribute("BoardSearchList", boardSearchListMap);
		model.addAttribute("Paging", paging);

		return "board/boardList";
	}
	
	//게시글 조회
	@RequestMapping(value = "boardView", method = RequestMethod.GET)
	public String boardView(@RequestParam("bno") int bno, HttpServletRequest request, Model model) throws Exception {

		model.addAttribute("BoardView", bService.boardView(bno));
		
		return "board/boardView";
	}
	
	//게시글 등록 화면
	@RequestMapping(value = "boardWriteView", method = RequestMethod.GET)
	public String boardWriteView(HttpServletRequest request, Model model) throws Exception {
		
		String user = request.getHeader("User-Agent");
		if (user.indexOf("Cordova") > 0) {
			model.addAttribute("Mobile", "Cordova");
		}
		
		return "board/boardWriteView";
	}
	//게시글 등록
	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public void boardWrite(BoardDTO dto, HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		
		//파일 저장 위치
		String Path = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		String user = request.getHeader("User-Agent");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (user.indexOf("Cordova") > 0) {
			if (request.getParameter("file") != null && !request.getParameter("file").equals("")) {
				byte[] imageBytes = DatatypeConverter.parseBase64Binary(request.getParameter("file").split(",")[1]); 
				dto.setFileName(UploadFileUtils.fileUpload(Path, "Mobile.JPG", imageBytes));
			}
		}
		else {
			if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				dto.setFileName(UploadFileUtils.fileUpload(Path, file.getOriginalFilename(), file.getBytes()));
			}
		}
		
		int result = bService.boardWrite(dto);
		if (1 == result) {
			out.println("<script>location.href='boardList'</script>");
			out.close();
		}
	}

	//게시글 수정 화면
	@RequestMapping(value = "boardModifyView", method = RequestMethod.GET)
	public String boardModifyView(@RequestParam("bno") int bno, HttpServletRequest request, Model model) throws Exception {
		
		String user = request.getHeader("User-Agent");
		if (user.indexOf("Cordova") > 0) {
			model.addAttribute("Mobile", "Cordova");
		}
		
		model.addAttribute("BoardModifyView", bService.boardView(bno));
		
		return "board/boardModifyView";
	}
	//게시글 수정
	@RequestMapping(value = "boardModify", method = RequestMethod.POST)
	public void boardModify(BoardDTO dto, HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws Exception {
		
		//파일 저장 위치
		String Path = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		String user = request.getHeader("User-Agent");
		
		if (user.indexOf("Cordova") > 0) {
			if (request.getParameter("file") != null && !request.getParameter("file").equals("")) {
				byte[] imageBytes = DatatypeConverter.parseBase64Binary(request.getParameter("file").split(",")[1]);
				dto.setFileName(UploadFileUtils.fileUpload(Path, "Mobile.JPG", imageBytes));
			}
			else {
				dto.setFileName(request.getParameter("imgFile"));
			}
		}
		else {
			if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				new File(Path + request.getParameter("imgFile")).delete();
				String fileName = UploadFileUtils.fileUpload(Path, file.getOriginalFilename(), file.getBytes());
		  
				dto.setFileName(fileName);
			}
			else {
				dto.setFileName(request.getParameter("imgFile"));
			}
		}

		int result = bService.boardModify(dto);
		if (1 == result) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>"
					+ "alert('게시글이 수정되었습니다.');"
					+ "location.href='boardView?bno=" + dto.getBno() + "'"
					+ "</script>");
			out.close();
		}
	}
	
	//게시글 삭제
	@RequestMapping(value = "boardDelete", method = RequestMethod.GET)
	public void boardDelete(@RequestParam("bno") int bno, @RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//파일 저장 위치
		String Path = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberDTO sessionId = (MemberDTO)session.getAttribute("member");
		if (sessionId != null) {
			if (sessionId.getUserId() != null || sessionId.getUserId().equals(userId)) {
				String attaFile = bService.boardFileSearch(bno);
				int result = bService.boardDelete(bno);

				if (1 == result) {
					new File(Path + attaFile).delete();
					out.println("<script>"
							+ "alert('게시글이 삭제되었습니다.');"
							+ "location.href='boardList'"
							+ "</script>");
					out.close();
				}
			}
			else {
				out.println("<script>"
						+ "alert('접근 가능한 권한이 아닙니다.');"
						+ "location.href='boardList'"
						+ "</script>");
				out.close();
			}
		}
	}
}