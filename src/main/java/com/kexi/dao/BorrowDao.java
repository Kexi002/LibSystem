package com.kexi.dao;

import com.kexi.domain.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BorrowDao {
/*    String id;

    UserInfo userInfo;
    BookInfo bookInfo;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Timestamp borrowDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    Timestamp returnDate;
    Integer renew; //int, 0 or 1
    String renewStr;
    String status;*/
    @Insert("insert into borrow (userInfoId, bookInfoId, returnDate) values(#{userInfo.id}, #{bookInfo.id}, #{returnDate})")
    void save(Borrow borrow);

    @Select("select * from borrow")
    @Results(id = "borrowMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "borrowDate", column = "borrowDate"),
            @Result(property = "returnDate", column = "returnDate"),
            @Result(property = "renew", column = "renew"),
            @Result(property = "userInfo", column = "userInfoId", javaType = UserInfo.class, one = @One(select = "com.kexi.dao.UserInfoDao.findById")),
            @Result(property = "bookInfo", column = "bookInfoId", javaType = BookInfo.class, one = @One(select = "com.kexi.dao.BookInfoDao.findById"))
    })
    List<Borrow> findAll();

    @Select("select * from borrow where userInfoId = #{userInfoId}")
    @ResultMap("borrowMap")
    List<Borrow> findByUserInfoId(String userInfoId);

    @Select("select * from borrow where bookInfoId = #{bookInfoId}")
    @ResultMap("borrowMap")
    List<Borrow> findByBookInfoId(String bookInfoId);

    @Select("select * from borrow where renew = #{renew}")
    @ResultMap("borrowMap")
    List<Borrow> findByRenew(Integer renew);

    @Select("select * from borrow where status = #{status}")
    @ResultMap("borrowMap")
    List<Borrow> findByStatus(Integer status);


}
