package jp.co.geppo.model.form;

import jp.co.geppo.entity.Account;

/**
 * 作成者候補フォーム
 */
public class WrittenByForm {

    /**
     * コンストラクタ
     */
    public WrittenByForm() {}

    public WrittenByForm(Account account) {
        id = account.getId();
        name = account.getFullName();
    }

    /** ID */
    private Long id;

    /** 名前 */
    private String name;

    /**
     * IDを取得します。
     * @return ID
     */
    public Long getId() {
        return id;
    }

    /**
     * IDをセットします。
     * @param id ID
     */
    public void setId(Long id) {
        this.id = id;
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
    public void setName(String name) {
        this.name = name;
    }
}

