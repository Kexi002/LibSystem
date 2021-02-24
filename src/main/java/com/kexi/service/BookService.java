package com.kexi.service;

import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;

public interface BookService {

    void save(BookInfo bookInfo);

    BookDetail findDetailById(String id);

    void updateImage(BookDetail bookDetail);
}
