package com.kexi.controller;

import com.github.pagehelper.PageInfo;
import com.kexi.domain.Account;
import com.kexi.domain.BookInfo;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import com.kexi.service.BookService;
import com.kexi.service.UserService;
import com.kexi.util.PageInfoUtil;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @RequestMapping("/register.do")
    public String register(UserInfo userInfo){
        userService.register(userInfo);
        return "../login";
    }

    @RequestMapping("/save.do")
    public @ResponseBody String save(@RequestBody UserInfo userInfo){
        userService.register(userInfo);
        return userInfo.getId();
    }

    @RequestMapping("/find.do")
    public String find(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
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
        return "/admin/user-list";
    }

    @RequestMapping("/detail.do")
    public String detail(Model model, @RequestParam(name = "id") String id, @RequestParam(name = "condition", required = false) String condition){
        UserInfo userInfo = userService.findById(id);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("condition", condition);
        return "/admin/user-detail";
    }

    @RequestMapping("/goUpdate.do")
    public String goUpdate(Model model, @RequestParam(name = "id") String id, @RequestParam(name = "condition", required = false) String condition){
        UserInfo userInfo = userService.findById(id);
        model.addAttribute("userInfo", userInfo);
        model.addAttribute("condition", condition);
        return "/admin/user-update";
    }

    @RequestMapping("/update.do")
    public @ResponseBody void update(@RequestBody UserInfo userInfo){
        userService.update(userInfo);
    }

    @RequestMapping("/delete.do")
    public @ResponseBody void delete(@RequestParam(name = "id") String id){
        userService.delete(id);
    }

    /*用户的方法*/
    @RequestMapping("/main.user.do")
    public String mainUser(HttpServletRequest request){
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //有可能是用户名或者学号登录的，不确定
        String usernameOrStudentId = userDetails.getUsername();
        Account account = accountService.findByUsername(usernameOrStudentId);
        if (account == null){
            account = accountService.findByStudentId(usernameOrStudentId);
        }
        UserInfo userInfo = userService.findByAccountId(account.getId());
        request.getSession().setAttribute("userInfo", userInfo);
        List<BookInfo> bookInfoList = bookService.findAll(Integer.parseInt(defaultValue.defaultPage), Integer.parseInt(defaultValue.userMainPageDefaultSize));
        PageInfo pageInfo = new PageInfo(bookInfoList);
        request.setAttribute("pageInfo", pageInfo);
        return "main";
    }

    @RequestMapping("/update.user.do")
    public @ResponseBody void updateUser(HttpServletRequest request, @RequestBody UserInfo userInfo){
        userService.update(userInfo);
        userInfo = userService.findById(userInfo.getId());
        request.getSession().setAttribute("userInfo", userInfo);
    }

}
