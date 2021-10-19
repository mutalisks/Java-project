package jp.co.geppo.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

/**
 * URL関連Utilクラス。
 */
public final class UrlUtil {

    /**
     * コンストラクタ
     */
    private UrlUtil() {
    }

    /**
     * ページ用のURLを作成します
     *
     * @param request リクエスト
     * @return URL
     */
    public static String createPageUrl(HttpServletRequest request) {
        final List<String> params = new ArrayList<>();
        for (final Entry<String, String[]> param : request.getParameterMap().entrySet()) {
            // ページ情報は別で持つため外す
            if (param.getKey().equals("page")) {
                continue;
            }
            params.add(param.getKey().toString() + "=" + String.join(",", param.getValue()));
        }

        // パラメーターが空の場合はパスのみ返す
        if (params.isEmpty()) {
            return request.getServletPath();
        }

        return request.getServletPath() + "?" + String.join("&", params);
    }

    /**
     * queryをMapに変換する。
     *
     * @param query query
     * @return Map
     */
    public static Map<String, String> parse(final String query) {
        return Stream.of(query.split("&")).map(q -> q.split("=", 2)).collect(Collectors.toMap(a -> a[0], a -> a[1]));
    }
}