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
import jp.co.geppo.entity.GeppoRecord;

/**
 * 月報カテゴリーベース
 */
@MappedSuperclass
public class GeppoCategoryBase extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 月報記録 */
    @OneToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE },
        fetch = FetchType.LAZY, targetEntity = GeppoRecord.class, mappedBy = "geppoCategory")
    @Where(clause = "deleted = 'false'")
    @OrderBy("id asc")
    private List<GeppoRecord> geppoRecords;

    /** 名前 */
    @Column(name = "name", nullable = false)
    private String name;

    /** 並び順 */
    @Column(name = "sort_order", nullable = false)
    private Integer sortOrder;

    /**
     * 月報記録を取得します。
     * @return 月報記録
     */
    public List<GeppoRecord> getGeppoRecords() {
        return geppoRecords;
    }

    /**
     * 月報記録をセットします。
     * @param nippoRecords 月報記録
     */
    public void setGeppoRecords(List<GeppoRecord> geppoRecords) {
        this.geppoRecords = geppoRecords;
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

    /**
     * 並び順を取得します。
     * @return 並び順
     */
    public Integer getSortOrder() {
        return sortOrder;
    }

    /**
     * 並び順をセットします。
     * @param sortOrder 並び順
     */
    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
}
