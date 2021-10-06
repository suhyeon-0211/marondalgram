package com.marondalgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManagerService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 실제 이미지가 저장될 경로 - C:\Users\kitew\박수현_java\6.spring_project1\ex\images
		public final static String FILE_UPLOAD_PATH = "C:\\Users\\kitew\\박수현_java\\6.spring_project1\\quiz\\images/";
		
		public String saveFile(String userLoginId, MultipartFile file) throws IOException {
			// 파일 디렉토리 경로		예) marobiana_현재시간/apple.png
			// 파일명이 겹치지 않게 현재시간을 경로에 붙여준다.
			String directoryName = userLoginId + "_" + System.currentTimeMillis() + "/";
			String filePath = FILE_UPLOAD_PATH + directoryName;
			
			File directory = new File(filePath);
			if(!directory.mkdir()) {
				logger.error("[파일업로드] 디렉토리 생성 실패 " + directoryName + ", filePath : " +  filePath);
				return null;
			}
			
			// 파일 업로드 : byte 단위로 업로드 된다.
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename()); // input에 올린 파일명이다.
			Files.write(path, bytes);
			
			// 이미지 URL path를 리턴한다.
			// 예) http://localhost/images/test_16*****/apple.png
			return "/images/" + directoryName + file.getOriginalFilename();
		}
}
