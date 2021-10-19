package jp.co.geppo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import jp.co.geppo.entity.Account;
import jp.co.geppo.model.security.AccountDetails;
import jp.co.geppo.repository.AccountRepository;

/**
 * 認証用サービス
 */
@Service
public class AccountService implements UserDetailsService {

    @Autowired
    private AccountRepository accountRepository;

    /**
     * 認証データを取得します。
     * @param username 認証キー
     * @return アカウントデータ
     */
    @Override
    public AccountDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        if (username == null || username.isBlank()) {
            throw new UsernameNotFoundException("Username is not found.");
        }

        final Account account = accountRepository.findById(Long.parseLong(username))
                .orElseThrow(() -> new UsernameNotFoundException("Account dose not exist."));

        final AccountDetails accountDetails = new AccountDetails(account, null);

        return accountDetails;
    }
}
