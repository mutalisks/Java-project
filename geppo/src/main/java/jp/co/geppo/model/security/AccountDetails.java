package jp.co.geppo.model.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jp.co.geppo.entity.Account;

/**
 * アカウント詳細
 */
public class AccountDetails implements UserDetails {

    private static final long serialVersionUID = 1L;

    /** ログインユーザー */
    private final Account account;

    /** 権限 */
    private final Collection<GrantedAuthority> authorities;

    /**
     * コンストラクタ
     * @param account スタッフ情報
     * @param authorities 権限
     */
    public AccountDetails(Account account, Collection<GrantedAuthority> authorities) {
        this.account = account;
        this.authorities = authorities;
    }

    /**
     * 権限を取得します。
     * @return 権限
     */
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    /**
     * アカウントを取得します。
     * @return アカウント
     */
    public Account getAccount() {
        return account;
    }

    /**
     * アクセスコードを取得します。
     * @return アクセスコード
     */
    @Override
    public String getUsername() {
        return account.getId().toString();
    }

    /**
     * パスワードを取得します。
     * @return パスワード
     */
    @Override
    public String getPassword() {
        return account.getPassword();
    }

    /**
     * 有効期限切れでないかをチェックします。
     * @return 有効期限切れでない場合true
     */
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    /**
     * アカウントロックでないかをチェックします。
     * @return アカウントロックでない場合true
     */
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    /**
     * 資格情報が有効期限切れでないかをチェックします。
     * @return 資格情報が有効期限切れでない場合true
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    /**
     * 有効であるかチェックします。
     * @return 有効である場合true
     */
    @Override
    public boolean isEnabled() {
        return true;
    }
}
