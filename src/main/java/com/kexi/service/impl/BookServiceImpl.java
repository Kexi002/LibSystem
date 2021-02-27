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
        //如果没有上传图片，那结果会是空还是null？
        if (bookInfo.getBookDetail().getImage() == null || "".equals(bookInfo.getBookDetail().getImage())){
            if (bookInfo.getBookDetail().getImage() == null){
                System.out.println("Service:图片为null");
            }else {
                System.out.println("Service:图片为空字符串");
            }
            bookInfo.getBookDetail().setImage(defaultValue.defaultNoImg);
        }
        if (bookInfo.getBookDetail().getISBN() == null || "".equals(bookInfo.getBookDetail().getISBN())){
            bookInfo.getBookDetail().setISBN("暂无书号");
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
        return null;
    }

    @Override
    public BookDetail findDetailById(String id) {
        return bookDetailDao.findById(id);
    }

    @Override
    public void updateImage(BookDetail bookDetail) {
        bookDetailDao.updateImage(bookDetail);
    }
}
