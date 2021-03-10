package com.kexi.dao;

import com.kexi.domain.Account;
import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.awt.print.Book;
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

    @Select("select * from bookInfo where bookName like concat('%',#{bookName},'%')")
    @ResultMap("bookInfoMap")
    List<BookInfo> findByBookNameLike(String bookName);

    @Select("select * from bookInfo where category like concat('%',#{category},'%')")
    @ResultMap("bookInfoMap")
    List<BookInfo> findByCategoryLike(String category);

    @Select("select * from bookInfo where category in (select category from category where categoryStr like concat('%',#{categoryStr},'%'))")
    @ResultMap("bookInfoMap")
    List<BookInfo> findByCategoryStrLike(String categoryStr);

    @Select("select * from bookInfo where author like concat('%',#{author},'%')")
    @ResultMap("bookInfoMap")
    List<BookInfo> findByAuthorLike(String author);

    @Select("select * from bookInfo where publisher like concat('%',#{publisher},'%')")
    @ResultMap("bookInfoMap")
    List<BookInfo> findByPublisherLike(String publisher);

    @Update("update bookInfo set bookName = #{bookName}, category = #{category}, author = #{author}, publisher = #{publisher} where id = #{id}")
    void update(BookInfo bookInfo);

    @Delete("delete from bookInfo where id = #{id}")
    void delete(String id);

}
