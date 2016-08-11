/*
 * Copyright 2009 Pronto Agile Project Management.
 *
 * This file is part of Pronto.
 *
 * Pronto is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Pronto is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Pronto. If not, see <http://www.gnu.org/licenses/>.
 *
 */

package br.com.bluesoft.pronto.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.bluesoft.pronto.model.Usuario;
import br.com.bluesoft.pronto.service.Seguranca;

public class LoginFilter implements Filter {

	private static final String START_URI = "/start.action";
	private static final String LOGIN_URI = "/login.action";

	private static final Set<String> freeResources;

	static {
		final Set<String> set = new HashSet<String>();
		set.add(".*burndown.*");
		set.add(".*\\.png");
		set.add(".*\\.jpg");
		set.add(".*\\.gif");
		set.add(".*\\.swf");
		set.add(".*\\.css");
		set.add(".*\\.html");
		set.add(".*\\.js");
		freeResources = Collections.unmodifiableSet(set);
	}

	@Override
	public void init(final FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain chain) throws IOException, ServletException {

		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		final Usuario usuarioLogado = (Usuario) request.getSession().getAttribute("usuarioLogado");
		final boolean logado = usuarioLogado != null;

		final boolean isAccessDenied = isAccessDenied(request, logado);

		if (isAccessDenied) {

			if (!logado) {
				final HttpServletResponse response = (HttpServletResponse) servletResponse;
				response.sendRedirect(request.getContextPath() + START_URI);
				return;
			}
		}

		if (logado) {
			Seguranca.setUsuario(usuarioLogado);
			chain.doFilter(servletRequest, servletResponse);
			Seguranca.removeUsuario();
		} else {
			chain.doFilter(servletRequest, servletResponse);
		}

	}

	private boolean isAccessDenied(final HttpServletRequest request, final boolean logado) {
		final String uri = request.getRequestURI();
		final boolean isStartAction = uri.contains(START_URI);
		final boolean isLoginAction = uri.contains(LOGIN_URI);

		boolean isntProtected = false;
		for (final String s : freeResources) {
			if (uri.matches(s)) {
				isntProtected = true;
				break;
			}
		}

		final boolean isAccessDenied = !logado && !isLoginAction && !isStartAction && !isntProtected;
		return isAccessDenied;
	}

}
