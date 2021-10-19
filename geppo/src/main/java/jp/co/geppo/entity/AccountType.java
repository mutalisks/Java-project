package jp.co.geppo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import jp.co.geppo.entity.base.AccountTypeBase;

/**
 * アカウント種別
 */
@Entity
@Table(name = "account_type")
public class AccountType extends AccountTypeBase {
    private static final long serialVersionUID = 1L;
}