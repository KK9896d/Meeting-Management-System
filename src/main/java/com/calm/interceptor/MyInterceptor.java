package com.calm.interceptor;

import com.calm.pojo.Employee;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * Login authentication permission authentication
 */

public class MyInterceptor implements HandlerInterceptor {
    private AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        List<String> list = Arrays.asList("login", "doLogin", "register", "doRegister");

        for (String str : list) {
            if(uri.contains(str)){
                return true;
            }
        }

        HttpSession session = request.getSession(true);
        Employee user = (Employee)session.getAttribute("user");
        if(antPathMatcher.match("/admin/**", uri)){
            if(user!=null){
                if("1".equals(user.getRole())){
                    return true;
                }
                else {
                    response.setHeader("Content-type", "text/html;charset=utf-8");
                    response.setCharacterEncoding("utf-8");
                    response.getWriter().write("forbidden, No permission!");
                    return false;
                }
            }
        }else if(user!=null){
            return true;
        }
        response.sendRedirect("/login");
        return false;

    }
}
