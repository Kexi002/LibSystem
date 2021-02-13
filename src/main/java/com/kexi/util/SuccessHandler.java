package com.kexi.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;

public class SuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        String role = null;
        //项目根地址 /lib_system
        String path = httpServletRequest.getContextPath();
        //System.out.println(path);

        //主机+端口号+项目根路径 http://localhost:8080/lib_system/
        String basePath = httpServletRequest.getScheme()+"://"+httpServletRequest.getServerName()+":"+httpServletRequest.getServerPort()+path+"/";
        //System.out.println(basePath);

        UserDetails principal =(UserDetails) authentication.getPrincipal();
        //权限是我手动赋予的，每一个认证成功的用户只有一个权限
        Collection<? extends GrantedAuthority> authorities = principal.getAuthorities();
        for (GrantedAuthority  authority:authorities) {
            //所以authorities的size为1，直接赋予
            role = authority.getAuthority();
        }

        //计划有变，跳同一个页面，用权限控制显示

        //通过不同的角色转到不同的页面
        if("ROLE_ADMIN".equals(role)) {
            httpServletResponse.sendRedirect(basePath+"pages/admin/main.jsp");
        } else if("ROLE_USER".equals(role)) {
            httpServletResponse.sendRedirect(basePath+"pages/main.jsp");
        } else {
            System.out.println("其他");
            httpServletResponse.sendRedirect(basePath+"login.jsp");
        }

    }
}
