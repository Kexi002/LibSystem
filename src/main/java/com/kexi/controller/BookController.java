package com.kexi.controller;
import com.github.pagehelper.PageInfo;
import com.kexi.domain.Account;
import com.kexi.domain.BookDetail;
import com.kexi.domain.BookInfo;
import com.kexi.service.BookService;
import com.kexi.util.PageInfoUtil;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/find.do")
    public String find(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
                       @RequestParam(name = "size", required = true, defaultValue = defaultValue.defaultSize) int size,
                       @RequestParam(name = "condition", required = false) String condition){
        //condition在没有&的时候为null，但是在&{condition}且condition没有值的时候为空字符串
        List<BookInfo> bookInfoList;
        PageInfo pageInfo;
        if (condition == null || "".equals(condition)){
            //没有条件，查询全部
            bookInfoList = bookService.findAll(page, size);
            pageInfo = new PageInfo(bookInfoList);
        } else {
            bookInfoList = bookService.findByCondition(page, size, condition);
            pageInfo = PageInfoUtil.list2PageInfo(page, size, bookInfoList);
            model.addAttribute("condition", condition);
        }
        model.addAttribute("pageInfo", pageInfo);
        return "/admin/book-list";
    }

    @RequestMapping("/detail.do")
    public String update(Model model, @RequestParam(name = "id") String id){
        BookDetail bookDetail = bookService.findDetailById(id);
        model.addAttribute("bookDetail", bookDetail);
        return "/admin/img-upload-test";
    }

    @RequestMapping("/uploadImg.do")
    public @ResponseBody void uploadImg(HttpServletRequest request,  Model model, @RequestParam(name = "upload") MultipartFile upload, @RequestParam(name = "id") String id) throws Exception {
        System.out.println("id:" + id);

        System.out.println("Controller:文件上传中......");
        String path = request.getSession().getServletContext().getRealPath("/img/bookImage/");
        System.out.println("path:"+path);

        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }

        String filename = upload.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        filename = uuid + "_" +filename;
        System.out.println("文件名:"+filename);

        upload.transferTo(new File(path, filename));

        //上传之后要把文件名存到数据库里面去(根据bookDetail里面的id)，先用id把数据拿出来
        BookDetail bookDetail = bookService.findDetailById(id);
        bookDetail.setImage(filename);
        bookDetail.setId(id);
        bookService.updateImage(bookDetail);

        //model添加bookDetail，页面reload刷新
        model.addAttribute("bookDetail", bookDetail);
        //return "../test";
    }
}
