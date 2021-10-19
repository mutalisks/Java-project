package jp.co.geppo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import jp.co.geppo.entity.base.AccountBase;

/**
 * アカウント
 */
@Entity
@Table(name = "account")
public class Account extends AccountBase {
    private static final long serialVersionUID = 1L;

    /**
     * フルネームを取得します。
     * @return フルネーム
     */
    public String getFullName() {
        return getLastName() + " " + getFirstName();
    }
}