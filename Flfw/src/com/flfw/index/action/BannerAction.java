package com.flfw.index.action;

import com.flfw.index.model.MmallBanner;
import com.flfw.index.service.Impl.BannerServiceImpl;
import com.flfw.index.util.ResultUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 10:32 2018/6/17
 * @Description:
 */
//@Controller("bannerAction")
//@Scope("prototype")
//@Namespace("/index")
//@ParentPackage("index")
public class BannerAction extends BaseAction<MmallBanner> {
//    @Resource
    private BannerServiceImpl bannerService;

    public void setBannerService(BannerServiceImpl bannerService) {
        this.bannerService = bannerService;
    }

    //@Action(value = "BannerList")//results = {@Result(name = "",type = "", location = "")}
    public String execute() throws Exception{
        ResultUtils.toJson(ServletActionContext.getResponse(),bannerService.getBannerSrc());
        return NONE;
    }
}
