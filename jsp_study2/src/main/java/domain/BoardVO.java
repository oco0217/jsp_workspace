package domain;

public class BoardVO {
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private String moddate;
	private String imageFile;
	private int readCount;
	
	public BoardVO() {}
	
	//insert title, writer, content
	public BoardVO(String title, String writer, String content) {
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	
	
	//update
	public BoardVO(int bno,String title, String content) {
		this.bno = bno;
		this.title = title;
		this.content = content;
	}
	
	
	//list
	public BoardVO(int bno,String title, String writer,String regdate) {
		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.regdate = regdate;
	}
	
	
	
	
	//all(detail,modify)
	public BoardVO(int bno,String title,String writer, String content, String regdate, String moddate, String imageFile, int readCount) {
		this(bno,title,writer,regdate);
		this.content = content;
		this.moddate = moddate;
		this.imageFile = imageFile;
		this.readCount = readCount;
	}
	
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", content=" + content + ", regdate="
				+ regdate + ", moddate=" + moddate + ", imageFile=" + imageFile + ", readCount=" + readCount + "]";
	}


	
	
	

}
