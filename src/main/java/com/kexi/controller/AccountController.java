package com.kexi.controller;

import com.kexi.domain.Account;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/findAll.do")
    public String findAll(Model model){
        //调用业务层service方法
        List<Account> accountList = accountService.findAll();
        model.addAttribute("accountList", accountList);
        return "/admin/account-list";
    }

    @RequestMapping("/save.do")
    public String save(Account account) throws Exception {
        accountService.save(account);
        return "redirect:findAll.do";
    }

    @RequestMapping("/register.do")
    public String register(UserInfo userInfo){
        System.out.println(userInfo);
        accountService.register(userInfo);
        return "../login";
    }

    @RequestMapping("/checkUsername.do")
    public @ResponseBody boolean checkUsername(@RequestBody Account newAccount){
        Account account = accountService.findByUsername(newAccount.getUsername());
        if(account != null){
            return true;
        }
        return false;
    }

    @RequestMapping("/checkStudentId.do")
    public @ResponseBody boolean checkStudentId(@RequestBody Account newAccount){
        Account account = accountService.findByStudentId(newAccount.getStudentId());
        if(account != null){
            return true;
        }
        return false;
    }

}
