package com.kexi.service.impl;

import com.github.pagehelper.PageHelper;
import com.kexi.dao.BookDetailDao;
import com.kexi.dao.BookInfoDao;
import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import com.kexi.service.BookService;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookInfoDao bookInfoDao;
    @Autowired
    private BookDetailDao bookDetailDao;

    @Override
    public void save(BookInfo bookInfo) {
        //没有上传图片，结果是null
        if (bookInfo.getBookDetail().getImage() == null || "".equals(bookInfo.getBookDetail().getImage())){
            bookInfo.getBookDetail().setImage(defaultValue.defaultNoImg);
        }
        bookDetailDao.save(bookInfo.getBookDetail());
        bookInfoDao.save(bookInfo);
    }

    @Override
    public List<BookInfo> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return bookInfoDao.findAll();
    }

    @Override
    public List<BookInfo> findByCondition(int page, int size, String condition) {
        List<BookInfo> bookInfoList = new ArrayList<>();
        String[] cs = condition.split("\\s+");
        for (String c : cs) {
            //四个字段：书名、分类、作者、出版社，四个名字不存在重复
            //现实生活中，一般先查书名，然后是作者、出版社和分类
            //1.先查书名
            List<BookInfo> tempList = bookInfoDao.findByBookNameLike(c);
            if(!tempList.isEmpty()){
                if(!bookInfoList.isEmpty()){
                    //注意：retainAll的比较，对于对象数组要重写equals和hashCode方法
                    bookInfoList.retainAll(tempList);
                }else {
                    //第一次的时候集合是空的，不能取交集，直接赋值
                    bookInfoList = tempList;
                }
            }else {
                //2.查作者
                tempList = bookInfoDao.findByAuthorLike(c);
                if(!tempList.isEmpty()){
                    if(!bookInfoList.isEmpty()){
                        bookInfoList.retainAll(tempList);
                    }else {
                        bookInfoList = tempList;
                    }
                }else {
                    //3.查出版社
                    tempList = bookInfoDao.findByPublisherLike(c);
                    if(!tempList.isEmpty()){
                        if(!bookInfoList.isEmpty()){
                            bookInfoList.retainAll(tempList);
                        }else {
                            bookInfoList = tempList;
                        }
                    }else {
                        //4.查分类
                        tempList = bookInfoDao.findByCategoryLike(c);
                        if(!tempList.isEmpty()){
                            if(!bookInfoList.isEmpty()){
                                bookInfoList.retainAll(tempList);
                            }else {
                                bookInfoList = tempList;
                            }
                        }
                    }
                }
            }
        }
        return bookInfoList;
    }

    @Override
    public BookInfo findById(String id) {
        return bookInfoDao.findById(id);
    }

    @Override
    public BookDetail findDetailById(String id) {
        return bookDetailDao.findById(id);
    }

    @Override
    public void updateImage(BookDetail bookDetail) {
        bookDetailDao.updateImage(bookDetail);
    }

    @Override
    public void update(BookInfo bookInfo) {
        bookDetailDao.update(bookInfo.getBookDetail());
        bookInfoDao.update(bookInfo);
    }
}
