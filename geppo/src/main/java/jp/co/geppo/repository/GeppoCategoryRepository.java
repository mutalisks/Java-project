package jp.co.geppo.repository;

import org.springframework.stereotype.Repository;

import jp.co.geppo.base.BaseRepository;
import jp.co.geppo.entity.GeppoCategory;

/**
 * 月報カテゴリーリポジトリー
 */
@Repository
public interface GeppoCategoryRepository extends BaseRepository<GeppoCategory, Long> {

}
