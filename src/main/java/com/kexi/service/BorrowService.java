package com.kexi.service;


import com.kexi.domain.Borrow;


import java.util.List;

public interface BorrowService {

    void save(Borrow borrow);

    List<Borrow> findAll();

    List<Borrow> findByUserInfoId(String userInfoId);

    List<Borrow> findByBookInfoId(String bookInfoId);
}
