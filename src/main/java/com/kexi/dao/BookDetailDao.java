package com.kexi.dao;

import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookDetailDao {

/*    private String id;
    private String publicationDate; //20
    private String isbn; //20
    private String intro; //500
    private String image; //50
    private String location //50
    private Integer number //默认0*/

    @Insert("insert into bookDetail(publicationDate, isbn, intro, image, location, number) values(#{publicationDate}, #{isbn}, #{intro}, #{image}, #{location}, #{number})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType = String.class, statement = {" select last_insert_id()"})
    void save(BookDetail bookDetail);

    @Select("select * from bookDetail where id = #{id}")
    BookDetail findById(String id);

    @Update("update bookDetail set image = #{image} where id = #{id}")
    void updateImage(BookDetail bookDetail);

    @Update("update bookDetail set publicationDate = #{publicationDate}, isbn = #{isbn}, intro = #{intro}, location = #{location}, number = #{number} where id = #{id}")
    void update(BookDetail bookDetail);

    @Delete("delete from bookDetail where id = #{id}")
    void delete(String id);

}
