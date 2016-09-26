package cafe.jjdev.gallery.common;

public class PageHelper {
	private int startRaw;
	private int linePerPage;
	
	public PageHelper(int page, int linePerPage) {
		this.startRaw = (page-1)*linePerPage;
		this.linePerPage = linePerPage;
	}
	
	public int getStartRaw() {
		return startRaw;
	}
	public void setStartRaw(int startRaw) {
		this.startRaw = startRaw;
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
		
}
