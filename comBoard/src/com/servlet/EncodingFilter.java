package com.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	private String encoding;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		encoding = filterConfig.getInitParameter("encoding");
		System.out.println("설정된 인코딩 값 : " + encoding);
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		// 서블릿 실행되기 전에 수행
		System.out.println("필터의 전처리 수행");
		req.setCharacterEncoding(encoding);
		System.out.println("encoding을 설정");

		// 다음 필터 실행, 실행할 다음 필터가 없다면 서블릿 실행
		chain.doFilter(req, resp);

		// 서블릿 실행 후 실행
		System.out.println("필터의 후처리 수행");
	}
}
