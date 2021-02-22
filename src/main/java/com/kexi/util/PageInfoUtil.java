package com.kexi.util;

import com.github.pagehelper.PageInfo;

import java.util.List;

public class PageInfoUtil {

    public static <T> PageInfo<T> list2PageInfo(int pageNum, int pageSize, List<T> list){
        PageInfo<T> pageInfo = new PageInfo<>(list);

        //total是未分页数据的总长度
        int total = list.size();
        pageInfo.setTotal(total);

        //总页数 = ((总条数 - 1) 整除/ 每页条目数) + 1
        //(0 - 1) / 7 + 1 = 1
        //(7 - 1) / 7 + 1 = 1
        //(8 - 1) / 7 + 1 = 2
        int pages = (total - 1) / pageSize + 1;
        pageInfo.setPages(pages);

        //根据总页数判断pageNum是否合法，不合法就纠正
        if (pageNum <= 1){
            pageNum = 1;
            //在只有一页的时候，pages有可能为0（没有结果）
        } else if(pageNum > pages){
            pageNum = pages;
        }
        pageInfo.setPageNum(pageNum);
        pageInfo.setPageSize(pageSize);

        //开始行数 = (当前页数 - 1) * 每页条目数, 开始的索引跟开始的行数是一样的
        int startIndex = (pageNum - 1) * pageSize;
        pageInfo.setStartRow(startIndex);

        //根据开始的索引判断前后页参数
        if(pageNum == 1){
            pageInfo.setIsFirstPage(true);
            pageInfo.setHasPreviousPage(false);
            pageInfo.setPrePage(0);
        }else {
            pageInfo.setIsFirstPage(false);
            pageInfo.setHasPreviousPage(true);
            pageInfo.setPrePage(pageNum - 1);
        }

        //结束行数 = 开始行数 + 每页条目数，但如果不满一页那么结束行数就是总数, 结束的索引跟结束的行数是一样的
        int endIndex = 0;
        if(startIndex + pageSize > total){
            endIndex = total;
            pageInfo.setIsLastPage(true);
            pageInfo.setHasNextPage(false);
        }else {
            endIndex = startIndex + pageSize;
            pageInfo.setIsLastPage(false);
            pageInfo.setHasNextPage(true);
            pageInfo.setNextPage(pageNum + 1);
        }
        pageInfo.setEndRow(endIndex);

        //计算列表分页截取的长度，取分页对应的列表数据
        pageInfo.setSize(endIndex - startIndex);
        // 实际长度是endIndex - startIndex，subList[0, 7)是左闭右开的
        pageInfo.setList(list.subList(startIndex, endIndex));

        //设置导航栏的页数数组
        int[] navigatePageNums = new int[pages];
        for (int i = 1; i <= pages; i++) {
            navigatePageNums[i - 1] = i;
        }
        pageInfo.setNavigatepageNums(navigatePageNums);
        pageInfo.setNavigateFirstPage(1);
        pageInfo.setNavigateLastPage(pages);
        return pageInfo;
    }
}
