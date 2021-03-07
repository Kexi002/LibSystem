package com.kexi.service;


import com.kexi.domain.Borrow;


import java.util.List;

public interface BorrowService {

    void save(Borrow borrow);

    List<Borrow> findAll(int page, int size);

    Borrow findById(String id);

    List<Borrow> findByCondition(int page, int size, String condition);

    List<Borrow> findByUserInfoId(String userInfoId);

    List<Borrow> findByBookInfoId(String bookInfoId);

    void updateStatus();

    void updateRenew(String id);

    void delete(String id);
}
