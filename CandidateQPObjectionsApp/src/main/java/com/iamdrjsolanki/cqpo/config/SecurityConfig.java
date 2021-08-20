package com.iamdrjsolanki.cqpo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.iamdrjsolanki.cqpo.filter.JwtRequestFilter;
import com.iamdrjsolanki.cqpo.service.MyUserDetailsService;

import lombok.AllArgsConstructor;

@Configuration
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	private final MyUserDetailsService userDetailsService;
	private final JwtRequestFilter jwtRequestFilter;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth
			.userDetailsService(userDetailsService)
			.passwordEncoder(passwordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.cors().and().csrf().disable()
	        .authorizeRequests()
	        .antMatchers("/api-auth/**").permitAll()
//	        .antMatchers(HttpMethod.GET, "/api/subreddit").permitAll()
//	        .antMatchers(HttpMethod.GET, "/api/post/").permitAll()
//	        .antMatchers(HttpMethod.GET, "/api/post/**").permitAll()
//	        .antMatchers(HttpMethod.GET, "/api/comments/").permitAll()
//	        .antMatchers(HttpMethod.GET, "/api/comments/**").permitAll()
	        .antMatchers("/v2/api-docs", "/configuration/ui", "/swagger-resources/**",
	                "/configuration/security", "/swagger-ui.html", "/webjars/**").permitAll()
	        .anyRequest()
	        .authenticated();
		
		http.addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
	}
	
//	@Bean
//	public BCryptPasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
	    return NoOpPasswordEncoder.getInstance();
	}
	
	@Bean(BeanIds.AUTHENTICATION_MANAGER)
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManager();
	}

}
