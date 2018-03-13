package com.springsec.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// TODO Auto-generated method stub
		UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication()
		    .withUser(users.username("vinoth").password("test123").roles("EMPLOYEE"))
		    .withUser(users.username("vijay").password("test").roles("ADMIN"))
		    .withUser(users.username("hary").password("test").roles("MANAGER"));
		    
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.anyRequest().authenticated()
			.and()
				.formLogin()
				.loginPage("/showTheLoginPage")
				.loginProcessingUrl("/authendicateTheUser")
				.permitAll()
			.and()
				.logout()
				.permitAll();
	}
	
	
}
