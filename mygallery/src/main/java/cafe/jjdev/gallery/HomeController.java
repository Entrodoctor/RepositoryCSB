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
			//��������	
			logger.info("���� �����̸��� {} �Դϴ�", pic.getOriginalFilename());
			logger.info("���� �����̸��� {} �Դϴ�", pic.getName());
			logger.info("������ �뷮�� {} �Դϴ�", pic.getSize());
			logger.info("������ ����Ʈ Ÿ���� {} �Դϴ�", pic.getContentType());
			//��������
			String saveDir = "D:\\choisubin\\Springwork\\gallery\\src\\main\\webapp\\upload";
			//String saveDir = request.getServletContext().getRealPath("resources");
			logger.info("resources ������ ���� ��ġ�� {} �Դϴ�", saveDir);
			//�����̸� (�ߺ����� �ʵ���)
			UUID uuid = UUID.randomUUID(); // �����ϰ� �� ���ڸ� ����
			String saveFileName = uuid.toString().replace("-", "");
			logger.info("������ �����̸��� {} �Դϴ�", saveFileName);
			String ext = pic.getOriginalFilename().substring(pic.getOriginalFilename().lastIndexOf(".") + 1);
			String fullFileName = saveDir + "\\" + saveFileName + "." + ext;
			logger.info("������ ������ ��ü �̸��� {} �Դϴ�", fullFileName);
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
