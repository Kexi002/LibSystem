package com.kexi.dao;

import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookInfoDao {

/*    private String id;
    private String bookName; //20
    private String category; //20
    private String author; //20
    private String publisher; //20

    private BookDetail bookDetail;*/

    //注意：保存书本前要先保存详情
    @Insert("insert into bookInfo(bookName, category, author, publisher, bookDetailId) values(#{bookName}, #{category}, #{author}, #{publisher}, #{bookDetail.id})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType = String.class, statement = {" select last_insert_id()"})
    void save(BookInfo bookInfo);

    @Select("select * from bookInfo")
    @Results(id = "bookInfoMap", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "bookName", column = "bookName"),
            @Result(property = "category", column = "category"),
            @Result(property = "author", column = "author"),
            @Result(property = "publisher", column = "publisher"),
            @Result(property = "bookDetail", column = "bookDetailId", javaType = BookDetail.class, one = @One(select = "com.kexi.dao.BookDetailDao.findById")),
    })
    List<BookInfo> findAll();

    @Select("select * from bookInfo where id = #{id}")
    @ResultMap("bookInfoMap")
    BookInfo findById(String id);


}
