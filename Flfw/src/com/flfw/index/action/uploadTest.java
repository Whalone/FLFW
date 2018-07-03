package com.flfw.index.action;



import com.flfw.index.util.FileUploadUtil;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 14:11 2018/6/24
 * @Description:
 */
@Controller("uploadAction")
@Scope("prototype")
@Namespace("/")
@ParentPackage("index")
public class uploadTest extends ActionSupport{
    private File file;
    private String fileFileName;

    @Action(value = "upload")//,results = {@Result(name = "send", location = "/product.jsp")})//
    public String execute() throws Exception {
        String realPath = ServletActionContext.getRequest().getRealPath("/upload");
        if(fileFileName==null||(fileFileName.trim()).equals("")){
            this.addFieldError("file","不能为空");
        }else {
            FileUploadUtil fileUploadUtil = new FileUploadUtil();
            fileUploadUtil.saveImg(file,fileFileName,"F:\\Study\\JSP\\Flfw\\WebRoot\\images\\test");
        }
        return NONE;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }
}
