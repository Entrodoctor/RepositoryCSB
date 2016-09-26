package cafe.jjdev.gallery;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "multipart", method = RequestMethod.POST)
	public String multipart(MultipartFile pic, HttpServletRequest request) {
		if(!pic.isEmpty()) {
			//파일정보	
			logger.info("원래 파일이름은 {} 입니다", pic.getOriginalFilename());
			logger.info("현재 파일이름은 {} 입니다", pic.getName());
			logger.info("파일의 용량은 {} 입니다", pic.getSize());
			logger.info("파일의 컨텐트 타입은 {} 입니다", pic.getContentType());
			//파일저장
			String saveDir = "D:\\choisubin\\Springwork\\gallery\\src\\main\\webapp\\upload";
			//String saveDir = request.getServletContext().getRealPath("resources");
			logger.info("resources 폴더의 실제 위치는 {} 입니다", saveDir);
			//저장이름 (중복되지 않도록)
			UUID uuid = UUID.randomUUID(); // 랜덤하게 긴 문자를 생성
			String saveFileName = uuid.toString().replace("-", "");
			logger.info("생성된 파일이름은 {} 입니다", saveFileName);
			String ext = pic.getOriginalFilename().substring(pic.getOriginalFilename().lastIndexOf(".") + 1);
			String fullFileName = saveDir + "\\" + saveFileName + "." + ext;
			logger.info("생성된 파일의 전체 이름은 {} 입니다", fullFileName);
			File saveFile = new File(fullFileName);
			try {
				pic.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/";
		
	}
	
	@RequestMapping(value = "multipart", method = RequestMethod.GET)
	public String multipart() {
		return "multipart";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
