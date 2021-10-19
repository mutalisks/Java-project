package jp.co.geppo.config;

import java.util.Optional;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import jp.co.geppo.model.security.AccountDetails;

/**
 * JPA設定
 */
@EnableJpaAuditing
@Configuration
public class JpaConfig {

    /**
     * 監査情報設定を作成します。
     * @return 監査情報設定
     */
    @Bean
    public AuditorAware<String> auditorAware() {
        return new SecurityAuditor();
    }

    /**
     * 監査情報設定
     */
    public static class SecurityAuditor implements AuditorAware<String> {
        @Override
        public Optional<String> getCurrentAuditor() {
            final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || !authentication.isAuthenticated() || !(authentication.getPrincipal() instanceof AccountDetails)) {
                return Optional.empty();
            }
            final AccountDetails accountDetails = (AccountDetails) authentication.getPrincipal();
            return Optional.of(accountDetails.getAccount().getId().toString());
        }
    }
}