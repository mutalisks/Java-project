package jp.co.geppo.entity.base;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.hibernate.annotations.Where;

import jp.co.geppo.base.BaseEntity;
import jp.co.geppo.entity.AccountType;
import jp.co.geppo.entity.GeppoRecord;

/**
 * アカウントベース
 */
@MappedSuperclass
public class AccountBase extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** アカウント種別 */
    @ManyToOne(fetch = FetchType.LAZY, targetEntity = AccountType.class, optional = false)
    @JoinColumn(name = "account_type_id", nullable = false)
    private AccountType accountType;

    /** 月報記録 */
    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE },
            fetch = FetchType.LAZY, targetEntity = GeppoRecord.class, mappedBy = "account")
    @Where(clause = "deleted = 'false'")
    @OrderBy("id asc")
    private List<GeppoRecord> GeppoRecords;

    /** パスワード */
    @Column(name = "password", nullable = false)
    private String password;

    /** 姓 */
    @Column(name = "last_name", nullable = false)
    private String lastName;

    /** 名 */
    @Column(name = "first_name", nullable = false)
    private String firstName;

    /**
     * アカウント種別を取得します。
     * @return アカウント種別
     */
    public AccountType getAccountType() {
        return accountType;
    }

    /**
     * アカウント種別をセットします。
     * @param accountType アカウント種別
     */
    public void setAccountType(AccountType accountType) {
        this.accountType = accountType;
    }

    /**
     * 月報記録を取得します。
     * @return 月報記録
     */
    public List<GeppoRecord> getNippoRecords() {
        return GeppoRecords;
    }

    /**
     * 月報記録をセットします。
     * @param geppoRecords 月報記録
     */
    public void setNippoRecords(List<GeppoRecord> geppoRecords) {
        this.GeppoRecords = geppoRecords;
    }

    /**
     * パスワードを取得します。
     * @return パスワード
     */
    public String getPassword() {
        return password;
    }

    /**
     * パスワードをセットします。
     * @param password パスワード
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 姓を取得します。
     * @return 姓
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * 姓をセットします。
     * @param lastName 姓
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * 名を取得します。
     * @return 名
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * 名をセットします。
     * @param firstName 名
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
}