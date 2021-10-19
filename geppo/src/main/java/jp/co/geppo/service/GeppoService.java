package jp.co.geppo.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.geppo.entity.Account;
import jp.co.geppo.entity.GeppoCategory;
import jp.co.geppo.entity.GeppoRecord;
import jp.co.geppo.model.form.GeppoForm;
import jp.co.geppo.model.form.GeppoSearchForm;
import jp.co.geppo.repository.GeppoCategoryRepository;
import jp.co.geppo.repository.GeppoRecordRepository;

/**
 * 月報サービス
 */
@Service
public class GeppoService {
	
	@Autowired
    private GeppoCategoryRepository geppoCategoryRepository;

    @Autowired
    private GeppoRecordRepository geppoRecordRepository;
    
    /** 月報一覧1ページあたりの表示件数 */
    private static final int NUMBER_PER_PAGE = 10;

	public GeppoForm add() {
		GeppoForm tempForm = new GeppoForm();
		return tempForm;
	}
	
	@Transactional
	public GeppoRecord create(Account account, GeppoForm geppoForm) {
		GeppoRecord geppoRecord = geppoRecordRepository.save(convertToEntity(account,geppoForm));
		return geppoRecord;
	}

	public GeppoForm detail(Long accountId, Long id) {
		GeppoRecord record = geppoRecordRepository.findById(id).orElseThrow(EntityNotFoundException::new);
        return convertEntityToForm(accountId, record);
	}
	
	@Transactional
	public GeppoRecord update(Long accountId, GeppoForm geppoForm) {
		GeppoRecord record = geppoRecordRepository.findByIdAndAccountId(geppoForm.getId(), accountId).orElseThrow(EntityNotFoundException::new);
        GeppoCategory geppoCategory = geppoCategoryRepository.findById(geppoForm.getCategoryId()).orElseThrow(EntityNotFoundException::new);
        record.setTargetDate(geppoForm.getTargetDate());
        record.setGeppoCategory(geppoCategory);
        record.setContent(geppoForm.getContent());
        return geppoRecordRepository.save(record);
	}
	
	@Transactional
	public void delete(Long accountId, Long geppoId) {
		GeppoRecord record = geppoRecordRepository.findByIdAndAccountId(geppoId, accountId).orElseThrow(EntityNotFoundException::new);
		record.setDeleted(true);
		geppoRecordRepository.save(record);
	}

	public GeppoSearchForm searchGeppo(GeppoSearchForm searchForm, int pageNo) {
		if (searchForm.isEmpty()) {
            return searchForm;
        }
        List<GeppoRecord> geppoRecords = geppoRecordRepository.searchForPage(searchForm, pageNo, NUMBER_PER_PAGE);
        List<GeppoForm> geppoForms = geppoRecords.stream().map(this::convertEntityToFormForSearchResult).toList();
        Long totalResultCount = geppoRecordRepository.searchCount(searchForm);
        searchForm.setWrittenBy(searchForm.getWrittenBy());
        searchForm.setGeppoRecords(geppoForms);
        searchForm.setTotalResultCount(totalResultCount);
        searchForm.setCountFrom((pageNo - 1) * NUMBER_PER_PAGE + 1);
        return searchForm;
	}
	/**
     * 月報記録を月報フォームに変換します。(検索結果用)
     * @param entity 月報記録エンティティ
     * @return 月報フォーム
     */
    private GeppoForm convertEntityToFormForSearchResult(GeppoRecord entity) {
        GeppoForm form = new GeppoForm();
        form.setId(entity.getId());
        form.setWrittenBy(entity.getAccount().getFullName());
        String content = entity.getContent();
        if (content.length() > 20) {
            content = content.substring(0, 20);
        }
        form.setContent(content);
        return form;
    }
    
	private GeppoRecord convertToEntity(Account account, GeppoForm geppoForm) {
		GeppoCategory geppoCategory = geppoCategoryRepository.findById(geppoForm.getCategoryId()).orElseThrow(EntityNotFoundException::new);
        GeppoRecord record = new GeppoRecord();
        record.setAccount(account);
        record.setTargetDate(geppoForm.getTargetDate());
        record.setGeppoCategory(geppoCategory);
        record.setContent(geppoForm.getContent());
        record.setDeleted(false);
        return record;
	}
	
	private GeppoForm convertEntityToForm(Long accountId, GeppoRecord record) {
		GeppoForm geppoForm = new GeppoForm();
		geppoForm.setId(record.getId());
		geppoForm.setWrittenBy(record.getAccount().getFullName());
		geppoForm.setTargetDate(record.getTargetDate());
		geppoForm.setCategoryId(record.getGeppoCategory().getId());
		geppoForm.setCategoryName(record.getGeppoCategory().getName());
		geppoForm.setContent(record.getContent());
		geppoForm.setLastUpdated(record.getUpdatedAt());
		geppoForm.setEditable(accountId.equals(record.getAccount().getId()));
		return geppoForm;
	}
}
