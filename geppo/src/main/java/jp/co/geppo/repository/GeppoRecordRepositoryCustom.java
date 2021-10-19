package jp.co.geppo.repository;

import java.util.List;

import jp.co.geppo.entity.GeppoRecord;
import jp.co.geppo.model.form.GeppoSearchForm;

/**
 * 月報記録リポジトリカスタム
 */
public interface GeppoRecordRepositoryCustom {
	/**
     * 1ページ分の月報記録を検索条件に基づいて取得します。
     * @param form 月報検索フォーム
     * @param pageNo ページ番号
     * @param limit 1ページあたりの上限件数
     * @return 該当記録
     */
	List<GeppoRecord> searchForPage(GeppoSearchForm form, int pageNo, int limit);
	
	/**
     * 検索結果の件数を取得します。
     * @param form 月報検索フォーム
     * @return 該当件数
     */
    Long searchCount(GeppoSearchForm form);
}