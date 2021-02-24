package com.kexi.service.impl;

import com.kexi.dao.BorrowDao;
import com.kexi.domain.Borrow;
import com.kexi.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

@Service("borrowService")
@Transactional
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    private BorrowDao borrowDao;

    @Override
    public void save(Borrow borrow) {
        //设置归还时间为当前时间+一个月
        Timestamp timestamp  = new Timestamp(System.currentTimeMillis());
        Calendar c = Calendar.getInstance();
        c.setTime(timestamp);
        c.add(Calendar.DATE, 30); //  加一个月
        timestamp = new Timestamp(c.getTimeInMillis());
        borrow.setReturnDate(timestamp);
        borrowDao.save(borrow);
    }

    @Override
    public List<Borrow> findAll() {
        return borrowDao.findAll();
    }

    @Override
    public List<Borrow> findByUserInfoId(String userInfoId) {
        return borrowDao.findByUserInfoId(userInfoId);
    }

    @Override
    public List<Borrow> findByBookInfoId(String bookInfoId) {
        return borrowDao.findByBookInfoId(bookInfoId);
    }

    //update设置按照是否续借改归还时间
}
