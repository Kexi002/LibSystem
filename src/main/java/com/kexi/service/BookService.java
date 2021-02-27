package com.kexi.service;

import com.kexi.domain.Account;
import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;

import java.util.List;

public interface BookService {

    void save(BookInfo bookInfo);

    List<BookInfo> findAll(int page, int size);

    List<BookInfo> findByCondition(int page, int size, String condition);

    BookDetail findDetailById(String id);

    void updateImage(BookDetail bookDetail);
}
