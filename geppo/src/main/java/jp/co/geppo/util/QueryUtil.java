package jp.co.geppo.util;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;

/**
 * SQL関連Utilクラス。
 */
public final class QueryUtil {

    /**
     * コンストラクタ
     */
    private QueryUtil() {
    }

    /**
     * 渡されたカラム名のlikeの部分一致条件句を作成します
     * @param columnName カラム名
     * @param parameterName パラメータ名
     * @return likeの条件句
     */
    public static String likeClause(String columnName, String parameterName) {
        return columnName + " like '%' || :" + parameterName + " || '%' escape '\\' ";
    }

    /**
     * 渡されたカラム名のlikeの前方一致条件句を作成します
     * @param columnName カラム名
     * @param parameterName パラメータ名
     * @return likeの条件句
     */
    public static String forwardMatch(String columnName, String parameterName) {
        return columnName + " like :" + parameterName + " || '%' escape '\\' ";
    }

    /**
     * 渡されたカラム名のlikeの後方一致条件句を作成します
     * @param columnName カラム名
     * @param parameterName パラメータ名
     * @return likeの条件句
     */
    public static String backwardMatch(String columnName, String parameterName) {
        return columnName + " like '%' || :" + parameterName + " escape '\\'";
    }

    /**
     * parameterにエスケープを行ってparameterをかえします
     * @param parameter パラメータ
     * @return parameter
     */
    public static String escapeParameter(String parameter) {
        return parameter.replaceAll("\\\\", "\\\\\\\\").replaceAll("%", "\\\\%").replaceAll("_", "\\\\_");
    }

    /**
     * Null可の文字列のカラムを空文字として結合するクエリーを作成します
     * @param cb クライテリアビルダー
     * @param columns カラム名の一覧
     * @return クエリー
     */
    @SafeVarargs
    public static Expression<String> concatNullSafe(
        CriteriaBuilder cb, Expression<String>... columns) {
        Expression<String> exp = cb.coalesce(columns[0], "");

        for (int i = 1; i < columns.length; i++) {
            exp = cb.concat(exp, cb.coalesce(columns[i], ""));
        }

        return exp;
    }
}