package jp.co.geppo.base;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

/**
 * エンティティベース
 */
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    /** 削除状態 */
    @Column(name = "deleted", nullable = false)
    protected Boolean deleted;

    @Version
    @Column(name = "version_no", nullable = false)
    private Integer versionNo;

    @CreatedDate
    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

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
     * 削除状態を取得します。
     * @return 削除状態
     */
    public Boolean getDeleted() {
        return deleted;
    }

    /**
     * 削除状態をセットします。
     * @param deleted 削除状態
     */
    public void setDeleted(final Boolean deleted) {
        this.deleted = deleted;
    }

    /**
     * バージョンNoを取得します。
     * @return バージョンNo
     */
    public Integer getVersionNo() {
        return versionNo;
    }

    /**
     * バージョンNoをセットします。
     * @param versionNo バージョンNo
     */
    public void setVersionNo(Integer versionNo) {
        this.versionNo = versionNo;
    }

    /**
     * 登録日時を取得します。
     * @return 登録日時
     */
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    /**
     * 登録日時をセットします。
     * @param createdAt 登録日時
     */
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    /**
     * 更新日時を取得します。
     * @return 更新日時
     */
    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    /**
     * 更新日時をセットします。
     * @param updatedAt 更新日時
     */
    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }
}
