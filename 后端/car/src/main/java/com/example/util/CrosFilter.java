package com.example.util;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 李本维 on 2019/12/29.
 */
public class CrosFilter implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse rep = (HttpServletResponse) servletResponse;
        String origin = req.getHeader("Origin");
        if (!StringUtils.isEmpty(origin)){
            rep.addHeader("Access-Control-Allow-Origin",origin);
        }
        String headers = req.getHeader("Access-Control-Request-Headers");
        if (!StringUtils.isEmpty(headers)){
            rep.addHeader("Access-Control-Allow-Headers",headers);
        }

        rep.addHeader("Access-Control-Max-Age","3600");
        rep.addHeader("Access-Control-Allow-Credentials","true");
        rep.addHeader("Access-Control-Allow-Methods","*");
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
