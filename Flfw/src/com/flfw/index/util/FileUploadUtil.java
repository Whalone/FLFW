package com.flfw.index.util;


import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 13:37 2018/6/24
 * @Description:
 */
@Component("fileUpload")
public class FileUploadUtil {
    private File file;
    private String fileFileName;
    private String targetName;
    private String dir;
    private String url;

    public void saveImg (File file,String fileFileName,String url) throws Exception{
        this.url=url;
        this.fileFileName = fileFileName;
        this.file=file;
        if(fileFileName==null||(fileFileName.trim()).equals("")){

        }else {
            targetName=generateFileName(fileFileName);
            this.setDir(url+"\\"+targetName);
            File target=new File(url,targetName);
            FileUtils.copyFile(file,target);
        }
    }

    private String generateFileName(String fileName){
        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        String formatdate = format.format(new Date());
        int random = new Random().nextInt(10000);
        int posistion=fileName.lastIndexOf(".");
        String extension=fileName.substring(posistion);
        String newfilename=formatdate+random+extension;
        return newfilename;
    }




    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getTargetName() {
        return targetName;
    }

    public void setTargetName(String targetName) {
        this.targetName = targetName;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }
}
