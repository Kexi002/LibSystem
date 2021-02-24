package com.kexi.service.impl;

import com.kexi.dao.BookDetailDao;
import com.kexi.dao.BookInfoDao;
import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import com.kexi.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
