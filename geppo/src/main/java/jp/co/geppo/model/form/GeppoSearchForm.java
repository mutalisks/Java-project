package jp.co.geppo.model.form;

import java.time.LocalDate;
import java.util.List;

public class GeppoSearchForm {
	private Long id;
	
	private Long writtenBy;
	
	private String keywords;
	
	private LocalDate dateFrom;
	
	private LocalDate dateTo;
	
	private List<GeppoForm> geppoRecords;
	
	private Long totalResultCount;
	
	private Integer countFrom;
	
	public boolean isEmpty() {
        return id == null && writtenBy == null && keywords == null && dateFrom == null && dateTo == null;
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getWrittenBy() {
		return writtenBy;
	}

	public void setWrittenBy(Long writtenBy) {
		this.writtenBy = writtenBy;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public LocalDate getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(LocalDate dateFrom) {
		this.dateFrom = dateFrom;
	}

	public LocalDate getDateTo() {
		return dateTo;
	}

	public void setDateTo(LocalDate dateTo) {
		this.dateTo = dateTo;
	}

	public List<GeppoForm> getGeppoRecords() {
		return geppoRecords;
	}

	public void setGeppoRecords(List<GeppoForm> geppoRecords) {
		this.geppoRecords = geppoRecords;
	}

	public Long getTotalResultCount() {
		return totalResultCount;
	}

	public void setTotalResultCount(Long totalResultCount) {
		this.totalResultCount = totalResultCount;
	}

	public Integer getCountFrom() {
		return countFrom;
	}

	public void setCountFrom(Integer countFrom) {
		this.countFrom = countFrom;
	}
	
}
