package jp.co.geppo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import jp.co.geppo.entity.base.GeppoRecordBase;

/**
 * 月報記録
 */
@Entity
@Table(name = "geppo_record")
public class GeppoRecord extends GeppoRecordBase {
    private static final long serialVersionUID = 1L;
}