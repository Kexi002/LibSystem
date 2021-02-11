package com.kexi.service;

import com.kexi.domain.Account;
import com.kexi.domain.UserInfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.UserDetailsManager;

import java.util.List;

public interface AccountService extends UserDetailsService {

    void save(Account account) throws Exception;

    void register(UserInfo userInfo);

    List<Account> findAll();

    Account findByUsername(String username);

    Account findByStudentId(String studentId);

    boolean update(Account account);

    void updatePassword(Account account);
}
