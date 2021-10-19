package jp.co.geppo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import jp.co.geppo.entity.GeppoRecord;

/**
 * 月報記録リポジトリ
 */
@Repository
public interface GeppoRecordRepository extends JpaRepository<GeppoRecord, Long>, GeppoRecordRepositoryCustom {
    /**
     * IDとアカウントIDから月報記録を取得します。
     * @param id 月報記録ID
     * @param accountId アカウントID
     * @return 月報記録
     */
    @Query("select gr from GeppoRecord gr"
        + " where gr.id = :id"
        + " and gr.account.id = :accountId"
        + " and gr.deleted = false")
    Optional<GeppoRecord> findByIdAndAccountId(@Param("id") Long id, @Param("accountId") Long accountId);

}