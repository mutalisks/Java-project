package jp.co.geppo.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.ResolverStyle;
import java.util.Iterator;
import java.util.Optional;
import java.util.function.BiFunction;
import java.util.stream.Stream;

/**
 * 日付に関するUtilクラス
 */
public class DateUtil {
    /**
     * 現在日を取得します。
     * @return 現在日
     */
    public static LocalDate currentDate() {
        return LocalDate.now();
    }

    /**
     * 現在日時を取得します。
     * @return 現在日時
     */
    public static LocalDateTime currentDateTime() {
        return LocalDateTime.now();
    }

    /**
     * 文字列をパターン一覧のいずれかに一致した場合日付へ変換する
     * @param <T> 日付型
     * @param text 日付に変換するための文字列
     * @param parse 文字列を日付型へparseするためのメソッド
     * @param patterns パターン一覧
     * @return 日付
     */
    public static <T> T parseByPatterns(String text, BiFunction<String, DateTimeFormatter, T> parse, String... patterns) {

        final Iterator<String> iterator = Stream.of(patterns).iterator();

        while (iterator.hasNext()) {
            try {
                return parse.apply(text, DateTimeFormatter.ofPattern(iterator.next()).withResolverStyle(ResolverStyle.STRICT));
            } catch (final DateTimeParseException e) {
                // すべてのパターンに一致しない場合のみ例外を投げる
                if (!iterator.hasNext()) {
                    throw e;
                }
            }
        }

        // patternsが空以外でここまで到達することはないため例外を投げる
        throw new IllegalArgumentException();
    }

    /**
     * 日付と時分からLocalDateTimeを作成します。
     * @param localDate 日付
     * @param hour 時
     * @param minute 分
     * @return 日付/時間
     */
    public static Optional<LocalDateTime> createLocalDateTime(LocalDate localDate, Integer hour, Integer minute) {
        if (localDate == null || hour < 0 || 23 < hour || minute < 0 || 59 < minute) {
            return Optional.empty();
        }
        return Optional.of(LocalDateTime.of(localDate, LocalTime.of(hour, minute)));
    }

    /**
     * 日付からyyMMdd形式の文字列を作成します。
     * @param localDate 日付
     * @return yyMMdd形式の文字列
     */
    public static String createStrForNippoNo(LocalDate localDate) {
        DateTimeFormatter f = DateTimeFormatter.ofPattern("uuMMdd");
        return localDate.format(f);
    }
}
