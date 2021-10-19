package jp.co.geppo.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

import jp.co.geppo.entity.base.GeppoCategoryBase;

/**
 * 月報カテゴリー
 */
@Entity
@Table(name = "geppo_category")
public class GeppoCategory extends GeppoCategoryBase {
    private static final long serialVersionUID = 1L;
}
