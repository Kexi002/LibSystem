package com.kexi.dao;

import com.kexi.domain.BookDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookDetailDao {

/*    private String id;
    private String publicationDate; //20
    private String ISBN; //20
    private String intro; //500
    private String image; //50
    private String location //50*/

    @Insert("insert into bookDetail(publicationDate, ISBN, intro, image, location) values(#{publicationDate}, #{ISBN}, #{intro}, #{image}, #{location})")
    @SelectKey(keyColumn = "id",keyProperty = "id",before = false,resultType = String.class, statement = {" select last_insert_id()"})
    void save(BookDetail bookDetail);

    @Select("select * from bookDetail where id = #{id}")
    BookDetail findById(String id);

    @Update("update bookDetail set image = #{image} where id = #{id}")
    void updateImage(BookDetail bookDetail);
}
