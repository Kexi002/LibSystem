package com.kexi.service.impl;

import com.github.pagehelper.PageHelper;
import com.kexi.dao.AccountDao;
import com.kexi.dao.BookInfoDao;
import com.kexi.dao.BorrowDao;
import com.kexi.dao.UserInfoDao;
import com.kexi.domain.Account;
import com.kexi.domain.BookInfo;
import com.kexi.domain.Borrow;
import com.kexi.domain.UserInfo;
import com.kexi.service.BorrowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@Service("borrowService")
@Transactional
public class BorrowServiceImpl implements BorrowService {
    @Autowired
    private BorrowDao borrowDao;
    @Autowired
    private UserInfoDao userInfoDao;
    @Autowired
    private BookInfoDao bookInfoDao;
    @Autowired
    private AccountDao accountDao;

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
    public List<Borrow> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return borrowDao.findAll();
    }

    @Override
    public List<Borrow> findByCondition(int page, int size, String condition) {
        List<Borrow> borrowList = new ArrayList<>();
        String[] cs = condition.split("\\s+");
        List<Borrow> tempList1;
        List<Borrow> tempList2;
        List<Borrow> tempList;
        List<UserInfo> tempListUserInfo;
        List<BookInfo> tempListBookInfo;

        for (String c : cs) {
            //先按分类找
            if ("未逾期".equals(c)){
                //status = 0或1
                tempList1 = borrowDao.findByStatus(0);
                tempList2 = borrowDao.findByStatus(1);
                tempList2.removeAll(tempList1);
                tempList1.addAll(tempList2);
                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList1);
                }else {
                    borrowList = tempList1;
                }
                continue;
            }else if ("逾期".equals(c) || "已逾期".equals(c)){
                //status = 2 3
                tempList1 = borrowDao.findByStatus(2);
                tempList2 = borrowDao.findByStatus(3);
                tempList2.removeAll(tempList1);
                tempList1.addAll(tempList2);
                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList1);
                }else {
                    borrowList = tempList1;
                }
                continue;
            }else if("未续借".equals(c) || "可续借".equals(c)){
                tempList = borrowDao.findByRenew(0);
                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList);
                }else {
                    borrowList = tempList;
                }
                continue;
            }
            else if ("续借".equals(c) || "已续借".equals(c)){
                tempList = borrowDao.findByRenew(1);
                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList);
                }else {
                    borrowList = tempList;
                }
                continue;
            }else if(c.matches("^\\d+$")){
                //纯数字，只能是学号
                List<Account> tempListStudentId = accountDao.findByStudentIdLike(c);//匹配多个学号，如3 33 34
                tempList1 = new ArrayList<>();
                for (Account account : tempListStudentId) {
                    //一个账号全部的借书
                    tempList2 = borrowDao.findByUserInfoId((userInfoDao.findByAccountId(account.getId())).getId());
                    tempList1.addAll(tempList2);
                }
                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList1);
                }else {
                    borrowList = tempList1;
                }
            }else {
                //姓名、书名
                tempListUserInfo = userInfoDao.findByRealNameLike(c);
                tempList1 = new ArrayList<>();
                for (UserInfo userInfo : tempListUserInfo) {
                    //多个同名的人
                    tempList2 = borrowDao.findByUserInfoId(userInfo.getId());
                    tempList1.addAll(tempList2);
                }
                tempList = tempList1;

                tempListBookInfo = bookInfoDao.findByBookNameLike(c);
                tempList1 = new ArrayList<>();
                for (BookInfo bookInfo : tempListBookInfo) {
                    tempList2 = borrowDao.findByBookInfoId(bookInfo.getId());
                    tempList1.addAll(tempList2);
                }
                tempList.addAll(tempList1);

                if (!borrowList.isEmpty()){
                    borrowList.retainAll(tempList);
                }else {
                    borrowList = tempList;
                }
            }
        }
        return borrowList;
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
