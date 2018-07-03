package com.flfw.index.service;

import com.flfw.index.model.MmallBanner;

import java.util.List;

/**
 * Create with IDEA
 *
 * @Author:Vantcy
 * @Date: Create in 10:13 2018/6/17
 * @Description:
 */
public interface BannerService extends BaseService<MmallBanner> {

    //首页轮播src
    List<String> getBannerSrc();
}
