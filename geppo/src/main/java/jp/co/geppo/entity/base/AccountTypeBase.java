/**
 *
 */
package jp.co.geppo.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Where;

import jp.co.geppo.base.BaseEntity;
import jp.co.geppo.entity.Account;

/**
 * アカウント種別ベース
 */
@MappedSuperclass
public class AccountTypeBase extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** アカウント */
    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE },
            fetch = FetchType.LAZY, targetEntity = Account.class, mappedBy = "accountType")
    @Where(clause = "deleted = 'false'")
    @OrderBy("id asc")
    private List<Account> accounts;

    /** 名前 */
    @Column(name = "name", nullable = false)
    private String name;

    /**
     * アカウントを取得します。
     * @return アカウント
     */
    public List<Account> getAccounts() {
        return accounts;
    }

    /**
     * アカウントをセットします。
     * @param accounts アカウント
     */
    public void setAccounts(final List<Account> accounts) {
        this.accounts = accounts;
    }

    /**
     * 名前を取得します。
     * @return 名前
     */
    public String getName() {
        return name;
    }

    /**
     * 名前をセットします。
     * @param name 名前
     */
    public void setName(final String name) {
        this.name = name;
    }
}
