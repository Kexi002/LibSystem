package com.kexi.controller;

import com.github.pagehelper.PageInfo;
import com.kexi.domain.Account;
import com.kexi.domain.BookInfo;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import com.kexi.service.UserService;
import com.kexi.util.PageInfoUtil;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;

    @RequestMapping("/register.do")
    public String register(UserInfo userInfo){
        userService.register(userInfo);
        return "../login";
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
    public @ResponseBody void update(Model model, @RequestBody UserInfo userInfo){
        System.out.println(userInfo);
        userService.update(userInfo);
        userInfo = userService.findById(userInfo.getId());
        model.addAttribute("userInfo", userInfo);
    }

/*    @RequestMapping("/updateUser.do")
    public String updateUser(UserInfo userInfo, Model model){
        if(accountService.update(userInfo.getAccount())){
            System.out.println("账号更新完毕...");
            userService.update(userInfo);
            System.out.println("用户信息更新完毕...");
        }
        model.addAttribute("userInfo", userInfo);
        //跳转详情界面，应该是一个model，userinfo存进去转发到
        return "detail";
    }*/
}
