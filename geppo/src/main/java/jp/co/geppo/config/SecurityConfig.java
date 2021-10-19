package jp.co.geppo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;

import jp.co.geppo.model.security.MD5PasswordEncoder;
import jp.co.geppo.service.AccountService;

/**
 * セキュリティ設定
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private AccountService accountService;

    /**
     * Webセキュリティの設定を行います。
     * @param web Webセキュリティ
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/dist/**", "/images/**", "/js/**");
    }

    /**
     * HTTPセキュリティの設定を行います。
     * @param http HTTPセキュリティ
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/sample/**").permitAll()
                .anyRequest().authenticated()
                .and()
                    .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/auth")
                    .successForwardUrl("/geppo/list")
                    .failureUrl("/login")
                    .usernameParameter("id")
                    .passwordParameter("password")
                .and()
                    .logout()
                    .logoutUrl("/logout")
                    .logoutSuccessUrl("/login")
                    .invalidateHttpSession(true)
                    .deleteCookies("JSESSIONID")
                .and()
                .csrf()
                    .ignoringAntMatchers("/sample/**")
                 .and()
                .headers()
                .cacheControl().disable()
                .httpStrictTransportSecurity().disable()
                .frameOptions().disable();
    }

    /**
     * 認証管理の設定を行います。
     * @param auth 認証管理用ビルダー
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(accountService)
                .passwordEncoder(passwordEncoder());
    }

    /**
     * パスワードエンコーダー。
     * @return パスワードエンコーダー
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new MD5PasswordEncoder();
        // return new BCryptPasswordEncoder();
    }
}
