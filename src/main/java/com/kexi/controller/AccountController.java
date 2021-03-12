package com.kexi.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.kexi.domain.Account;
import com.kexi.domain.UserInfo;
import com.kexi.service.AccountService;
import com.kexi.util.PageInfoUtil;
import com.kexi.util.defaultValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private AccountService accountService;

/*    @RequestMapping("/fail.do")
    public String fail(HttpServletRequest request){
        request.setAttribute("msg", "fail");
        return "../login";
    }*/

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

    @RequestMapping("/goUpdate.do")
    public String update(Model model, @RequestParam(name = "id") String id, @RequestParam(name = "condition", required = false) String condition){
        Account account = accountService.findById(id);
        model.addAttribute("account", account);
        model.addAttribute("condition",condition);
        return "/admin/account-update";
    }

    @RequestMapping("/delete.do")
    public @ResponseBody void deleteById(@RequestBody Account account){
        System.out.println("正在删除......");

        //删除Account的时候对应的User也会被删除
        //必须先写删除User的逻辑！！！
        accountService.delete(account.getId());
    }

    @RequestMapping("/update.do")
    public @ResponseBody void update(Model model, @RequestBody Account account){
        accountService.update(account);
    }

    @RequestMapping("/updatePassword.do")
    public @ResponseBody void updatePassword(@RequestBody Account account){
        accountService.updatePassword(account);
    }

}
