package jp.co.geppo.repository;

import org.springframework.stereotype.Repository;

import jp.co.geppo.base.BaseRepository;
import jp.co.geppo.entity.Account;

/**
 * アカウントリポジトリ
 */
@Repository
public interface AccountRepository extends BaseRepository<Account, Long> {

}