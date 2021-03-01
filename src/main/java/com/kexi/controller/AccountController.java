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

    @RequestMapping("/find.do")
    public String find(Model model, @RequestParam(name = "page", required = true, defaultValue = defaultValue.defaultPage) int page,
                                  @RequestParam(name = "size", required = true, defaultValue = defaultValue.defaultSize) int size,
                                  @RequestParam(name = "condition", required = false) String condition){
        //condition在没有&的时候为null，但是在&{condition}且condition没有值的时候为空字符串
        List<Account> accountList;
        PageInfo pageInfo;
        if (condition == null || "".equals(condition)){
            //没有条件，查询全部
            accountList = accountService.findAll(page, size);
            pageInfo = new PageInfo(accountList);
        } else {
            accountList = accountService.findByCondition(page, size, condition);
            pageInfo = PageInfoUtil.list2PageInfo(page, size, accountList);
            model.addAttribute("condition", condition);
        }
        model.addAttribute("pageInfo", pageInfo);
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

    @RequestMapping("/detail.do")
    public String detail(Model model, @RequestParam(name = "id") String id, @RequestParam(name = "condition", required = false) String condition){
        Account account = accountService.findById(id);
        model.addAttribute("account", account);
        model.addAttribute("condition",condition);
        return "/admin/account-detail";
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
        model.addAttribute("account", account);
    }

    @RequestMapping("/updatePassword.do")
    public @ResponseBody void updatePassword(@RequestBody Account account){
        accountService.updatePassword(account);
    }

}
