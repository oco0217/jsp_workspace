package handler;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileRemoveHandler {
	
	private static final Logger log = LoggerFactory.getLogger(FileRemoveHandler.class);

	
	//savePath, imageFileName
	public int deleteFile(String savePath, String imageFileName) {
		//return type int => 삭제 여부 값을 리턴
		boolean isDel = false; //삭제가 잘되었는지 체크하는 변수
		log.info(">>>>deleteFile method 접근~!!{}",imageFileName);
		
		//기존 저장 파일 + _th_ 같이 삭제
		File fileDir = new File(savePath);
		File removeFile = new File(fileDir+File.separator+imageFileName);
		File removeThumbFile = new File(fileDir+File.separator+"_th_"+imageFileName);
		
		//파일이 존재해야 삭제
		if(removeFile.exists() || removeThumbFile.exists()) {
			isDel = removeFile.delete(); //원 파일 삭제
			log.info(">>>>>>fileRemove>>{}",isDel);
			
			if(isDel) {
				isDel = removeThumbFile.delete();
				log.info(">>>>>>fileRemoveThumbFile>>{}",isDel);
			}
		}
	
		
		
		return isDel? 1:0;
	}
	
	
	
	
}
