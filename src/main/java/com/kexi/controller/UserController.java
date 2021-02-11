package com.kexi.controller;

import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import com.kexi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private UserService userService;

    @RequestMapping("/updateUser.do")
    public String updateUser(UserInfo userInfo, Model model){
        if(accountService.update(userInfo.getAccount())){
            System.out.println("账号更新完毕...");
            userService.update(userInfo);
            System.out.println("用户信息更新完毕...");
        }
        model.addAttribute("userInfo", userInfo);
        //跳转详情界面，应该是一个model，userinfo存进去转发到
        return "detail";
    }
}
