package cafe.jjdev.gallery.web;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cafe.jjdev.gallery.service.BoardArticle;
import cafe.jjdev.gallery.service.BoardRequest;
import cafe.jjdev.gallery.service.BoardService;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired private BoardService boardService;
	
	@RequestMapping(value = "/boardDel", method = RequestMethod.GET)
	public String boardDel(Model model, int boardArticleNo) {
		logger.info("boardArticleNo 확인 : {}", boardArticleNo);
		String saveDir = "D:\\choisubin\\Springwork\\mygallery\\src\\main\\webapp\\upload";
		boardService.boardDel(boardArticleNo, saveDir);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/boardDetail", method = RequestMethod.GET)
	public String boardDetail(Model model, int boardArticleNo) {
		logger.info("boardArticleNo 확인 : {}", boardArticleNo);
		Map<String, Object> map = boardService.getBoardDetail(boardArticleNo);
		model.addAttribute("map", map);
		/*model.addAttribute("boardArticle", map.get("boardArticle"));
		model.addAttribute("boardFiles", map.get("boardFiles"));*/
		return "boardDetail";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String boardList(Model model, 
			@RequestParam(value="page", defaultValue="1") int page) {
		List<BoardArticle> boardArticleList = boardService.getBoardArticleList(page);
		model.addAttribute("boardArticleList", boardArticleList);
		model.addAttribute("startPage", boardService.startPage(page));
        model.addAttribute("page", page);
        int endPage = boardService.endPage(boardService.startPage(page));
        int lastPage = boardService.getLastPage();
        if(endPage > lastPage){
        	endPage = lastPage;
        }
        model.addAttribute("endPage", endPage);
        model.addAttribute("lastPage", boardService.getLastPage());
		return "boardList";
	}
	
	@RequestMapping(value = "/boardAdd", method = RequestMethod.GET)
	public String boardAdd() {
		return "boardAdd";
	}
	
	@RequestMapping(value = "/boardAdd", method = RequestMethod.POST)
	public String boardAdd(Model model, BoardRequest boardRequest) {
		logger.info("매개변수 확인 : {}", boardRequest.toString());
		
		List<MultipartFile> boardImgs = boardRequest.getBoardImage();
		if(boardImgs != null) {
			for(MultipartFile mf : boardImgs){
				if(!boardRequest.getBoardImage().isEmpty()) {
					if(!mf.getContentType().equals("image/gif") 
						&& !mf.getContentType().equals("image/jpeg")
						&& !mf.getContentType().equals("image/png")) {
						model.addAttribute("msg", "그림파일만 업로드 가능");
						return "boardAdd";
					}	
				}		
			}
		}
		
		String saveDir = "D:\\choisubin\\Springwork\\mygallery\\src\\main\\webapp\\upload";
		boardService.addBoard(boardRequest, saveDir);
		return "redirect:/";
	}
		
}
