package cafe.jjdev.gallery.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class BoardFileDao {
	private static final Logger logger = LoggerFactory.getLogger(BoardFileDao.class);
	@Autowired
	SqlSessionTemplate sqlSession;
	final String NS = "cafe.jjdev.gallery.service.BoardFileMapper";
	
	public List<BoardFile> selectBoardFileByFK(int boardArticleNo) {
		return sqlSession.selectList(NS + ".selectBoardFileByFK", boardArticleNo);
	}
	public int insertBoardFile(BoardFile boardFile) {
		logger.info("boardArticleNo »Æ¿Œ : {}", boardFile.getBoardArticleNo());
		return sqlSession.insert(NS + ".insertBoardFile", boardFile);
	}
		
	public List<BoardFile> deleteForBoardFileName(int boardArticleNo) {
		return sqlSession.selectList(NS + ".deleteBoardFileName", boardArticleNo);
	}
	
	public int deleteBoardFile(int boardArticleNo) {
		return sqlSession.delete(NS + ".deleteBoardFile", boardArticleNo);
	}

}
