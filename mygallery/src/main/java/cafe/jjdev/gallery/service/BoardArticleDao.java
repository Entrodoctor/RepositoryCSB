package cafe.jjdev.gallery.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardArticleDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	final String NS = "cafe.jjdev.gallery.service.BoardArticleMapper";
	
	public int selectBoardArticleTotalCount() {
		return sqlSession.selectOne(NS + ".selectBoardArticleTotalCount");
	}
	
	public BoardArticle selectBoardArticleContentByKey(int boardArticleNo) {
		return sqlSession.selectOne(NS + ".selectBoardArticleContentByKey", boardArticleNo);
	}
	
	public List<BoardArticle> selectBoardArticleList(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".selectBoardArticleList", map);
	}
	
	public int insertBoardArticle(BoardArticle boardArticle) {
		return sqlSession.insert(NS + ".insertBoardArticle", boardArticle);
	}
	
	public int deleteBoardArticle(int boardArticleNo) {
		return sqlSession.delete(NS + ".deleteBoardArticle", boardArticleNo);
	}

}
