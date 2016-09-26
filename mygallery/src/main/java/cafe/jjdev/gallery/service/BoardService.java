package cafe.jjdev.gallery.service;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Delete;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cafe.jjdev.gallery.common.PageHelper;
import cafe.jjdev.gallery.web.BoardController;

@Service
public class BoardService {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	private final int LINE_PER_PAGE = 10; // �� ȭ�鿡 �����ִ� �Խñ� ����
	private final int BLOCK_PER_PAGE = 10; // �ϴ� ������ ���� 
	
	@Autowired
	private BoardArticleDao boardArticleDao;
	
	@Autowired
	private BoardFileDao boardFileDao;
	
	public int startPage(int page) {
		return ((page - 1) / BLOCK_PER_PAGE) * BLOCK_PER_PAGE + 1;
	}
	
    public int endPage(int startpage){  	
        return startpage + BLOCK_PER_PAGE-1;
        
    }	
	
    public int getLastPage() {
        return (int)Math.ceil((double)boardArticleDao.selectBoardArticleTotalCount()/LINE_PER_PAGE);
    }
    
    public void boardDel(int boardArticleNo, String saveDir) {
    	
    	List<BoardFile> boardFileName = boardFileDao.deleteForBoardFileName(boardArticleNo);
    	
    	if(boardFileName != null) {
    		for(BoardFile boardFileImg : boardFileName) {
    			String boardFileFullName = saveDir + "\\" + boardFileImg.getBoardFileName() + "." + boardFileImg.getBoardFileExt();
        		File deleteFile = new File(boardFileFullName);   		
        		deleteFile.delete();
        		boardFileDao.deleteBoardFile(boardArticleNo);
        	}
    	}
    	
    	boardArticleDao.deleteBoardArticle(boardArticleNo);
    	    	    	
    }
			
	public Map<String, Object> getBoardDetail(int boardArticleNo) {
		logger.info("boardArticleNo Ȯ�� : {}", boardArticleNo);
		BoardArticle boardArticle = boardArticleDao.selectBoardArticleContentByKey(boardArticleNo);
		List<BoardFile> boardFiles = boardFileDao.selectBoardFileByFK(boardArticleNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardArticle", boardArticle);
		map.put("boardFiles", boardFiles);
		
		return map;
	}
	
	//
	public List<BoardArticle> getBoardArticleList(int page) {
        PageHelper pageHelper = new PageHelper(page,LINE_PER_PAGE);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageHelper", pageHelper);
		return boardArticleDao.selectBoardArticleList(map);
	}
	
	//
	public void addBoard(BoardRequest boardRequest, String saveDir) {
		
		BoardArticle boardArticle = new BoardArticle();
		boardArticle.setBoardArticleTitle(boardRequest.getBoardTitle());
		boardArticle.setBoardArticleContent(boardRequest.getBoardContent());
		logger.info("boardArticle Ȯ�� : {}", boardArticle.toString());
		
		// BoardArticleDao ȣ��
		
		boardArticleDao.insertBoardArticle(boardArticle);
		int boardArticleNo = boardArticle.getBoardArticleNo();
		List<MultipartFile> boardImgs = boardRequest.getBoardImage();
		logger.info("boardArticleNo Ȯ�� : {}", boardArticleNo);
		
		//
		if(boardImgs != null) {
			for(MultipartFile mf : boardImgs){
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid.toString().replace("-", "");
				String ext = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".") + 1);
				ext = ext.toLowerCase();
				long size = mf.getSize();
				String type = mf.getContentType();
				String fullFileName = saveDir + "\\" + saveFileName + "." + ext;
				
				BoardFile boardFile = new BoardFile();
				boardFile.setBoardArticleNo(boardArticleNo);
				boardFile.setBoardFileName(saveFileName);
				boardFile.setBoardFileExt(ext);
				boardFile.setBoardFileSize(size);
				boardFile.setBoardFileType(type);
				logger.info("boardFile Ȯ�� : {}", boardFile.toString());
				
				//����
				if(!mf.isEmpty()){
					File saveFile = new File(fullFileName);
					try {
						mf.transferTo(saveFile);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
					//boardFileDao ȣ��
					boardFileDao.insertBoardFile(boardFile);	
					logger.info("boardArticleNo Ȯ�� : {}", boardFile.getBoardArticleNo());
				}
			}
		}
	}
}
