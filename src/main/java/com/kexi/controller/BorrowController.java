package com.kexi.controller;

import com.github.pagehelper.PageInfo;
import com.kexi.domain.BookInfo;
import com.kexi.domain.Borrow;
import com.kexi.domain.UserInfo;
import com.kexi.service.BookService;
import com.kexi.service.BorrowService;
import com.kexi.service.UserService;
import com.kexi.util.PageInfoUtil;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/borrow")
public class BorrowController {
    @Autowired
    private BorrowService borrowService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/main.do")
    public String findUser(HttpServletRequest request){
        String id = (String) request.getSession().getAttribute("nowBorrowUserId");
        //没有这个属性会是null
        if (id == null || "".equals(id)){
            return "redirect:findUser.do?page=1&size=7";
        }
        return "redirect:findBook.do?page=1&size=7";
    }

    @RequestMapping("/saveNowBorrowUser.do")
    public String saveNowBorrowUser(HttpServletRequest request, @RequestParam(name = "id") String id, @RequestParam(name = "name")String name) {
        request.getSession().setAttribute("nowBorrowUserId", id);
        request.getSession().setAttribute("nowBorrowUserName", name);
        List<String>list = new ArrayList();
        request.getSession().setAttribute("nowBorrowCart", list);
        return "redirect:findBook.do?page=1&size=7";
    }

    @RequestMapping("/deleteNowBorrowUser.do")
    public String deleteNowBorrowUser(HttpServletRequest request) {
        request.getSession().removeAttribute("nowBorrowUserId");
        request.getSession().removeAttribute("nowBorrowUserName");
        request.getSession().removeAttribute("nowBorrowCart");
        return "redirect:findUser.do?page=1&size=7";
    }

    @RequestMapping("/addBorrowCart.do")
    public @ResponseBody Boolean addBorrowCart(HttpServletRequest request,@RequestParam(name = "id") String id){
        List<String> list = (List<String>) request.getSession().getAttribute("nowBorrowCart");
        if (list.contains(id)){
            return false;
        }
        list.add(id);
        request.getSession().setAttribute("nowBorrowCart", list);
        return true;
    }

    @RequestMapping("/removeBorrowCart.do")
    public @ResponseBody void removeBorrowCart(HttpServletRequest request,@RequestParam(name = "id") String id){
        List<String> list = (List<String>) request.getSession().getAttribute("nowBorrowCart");
        list.remove(id);
        request.getSession().setAttribute("nowBorrowCart", list);
    }

    @RequestMapping("/goBorrowCart.do")
    public String addBorrowCart(HttpServletRequest request, Model model){
        List<String> list = (List<String>) request.getSession().getAttribute("nowBorrowCart");
        List<BookInfo> bookInfoList = new ArrayList<>();
        for (String id : list) {
            bookInfoList.add(bookService.findById(id));
        }
        model.addAttribute("bookInfoList",bookInfoList);
        return "/admin/borrow-cart";
    }

    @RequestMapping("/borrow.do")
    public @ResponseBody void borrow(HttpServletRequest request){
        List<String> bookList = (List<String>) request.getSession().getAttribute("nowBorrowCart");
        String userId = (String) request.getSession().getAttribute("nowBorrowUserId");
        Borrow borrow = new Borrow();
        UserInfo userInfo = new UserInfo();
        userInfo.setId(userId);
        borrow.setUserInfo(userInfo);
        BookInfo bookInfo = new BookInfo();
        for (String bookId : bookList) {
            bookInfo.setId(bookId);
            borrow.setBookInfo(bookInfo);
            borrowService.save(borrow);
        }
    }

    @RequestMapping("/find.do")
    public String find(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
                       @RequestParam(name = "size", required = true, defaultValue = defaultValue.defaultSize) int size,
                       @RequestParam(name = "condition", required = false) String condition){
        List<Borrow> borrowList;
        PageInfo pageInfo;
        if (condition == null || "".equals(condition)){
            //没有条件，查询全部
            borrowList = borrowService.findAll(page, size);
            pageInfo = new PageInfo(borrowList);
        } else {
            borrowList = borrowService.findByCondition(page, size, condition);
            pageInfo = PageInfoUtil.list2PageInfo(page, size, borrowList);
            model.addAttribute("condition", condition);
        }
        model.addAttribute("pageInfo", pageInfo);
        return "/admin/borrow-list";
    }

    @RequestMapping("/findUser.do")
    public String findUser(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
                       @RequestParam(name = "size", required = true, defaultValue = defaultValue.defaultSize) int size,
                       @RequestParam(name = "condition", required = false) String condition){
        //condition在没有&的时候为null，但是在&{condition}且condition没有值的时候为空字符串
        List<UserInfo> userList;
        PageInfo pageInfo;
        if (condition == null || "".equals(condition)){
            //没有条件，查询全部
            userList = userService.findAll(page, size);
            pageInfo = new PageInfo(userList);
        } else {
            userList = userService.findByCondition(page, size, condition);
            pageInfo = PageInfoUtil.list2PageInfo(page, size, userList);
            model.addAttribute("condition", condition);
        }
        model.addAttribute("pageInfo", pageInfo);
        return "/admin/borrow-user-list";
    }

    @RequestMapping("/findBook.do")
    public String findBook(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
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
        return "/admin/borrow-book-list";
    }

    @RequestMapping("/bookDetail.do")
    public String detail(Model model, @RequestParam(name = "id") String id, @RequestParam(name = "condition", required = false) String condition){
        BookInfo bookInfo = bookService.findById(id);
        model.addAttribute("bookInfo", bookInfo);
        model.addAttribute("condition", condition);
        return "/admin/borrow-book-detail";
    }

    @RequestMapping("/cartDetail.do")
    public String detail(Model model, @RequestParam(name = "id") String id){
        BookInfo bookInfo = bookService.findById(id);
        model.addAttribute("bookInfo", bookInfo);
        return "/admin/borrow-cart-detail";
    }
}
