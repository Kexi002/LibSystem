package com.kexi.service;

import com.kexi.domain.Account;
import com.kexi.domain.UserInfo;
import org.apache.ibatis.annotations.Select;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.UserDetailsManager;

import java.util.List;

public interface AccountService extends UserDetailsService {

    void save(Account account) throws Exception;



/*    List<Account> findAll(int page, int size);

    List<Account> findByCondition(int page, int size, String condition);*/

    Account findById(String id);

    Account findByUsername(String username);

    Account findByStudentId(String studentId);

    boolean update(Account account);

    void delete(String id);

    void updatePassword(Account account);
}
