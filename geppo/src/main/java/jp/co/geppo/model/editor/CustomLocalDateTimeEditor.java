package jp.co.geppo.model.editor;

import java.beans.PropertyEditorSupport;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

import org.springframework.util.StringUtils;

import jp.co.geppo.util.DateUtil;

/**
 * LocalDateTime用プロパティエディタ。
 */
public class CustomLocalDateTimeEditor extends PropertyEditorSupport {

    private static final String[] PATTERNS = {"uuuu/M/d H:m[:s]", "uuuu-M-d H:m[:s]", "uuuu-M-d'T'H:m"};

    private final boolean allowEmpty;

    private final int exactDateLength;

    /**
     * コンストラクタ
     * @param allowEmpty 空許可
     */
    public CustomLocalDateTimeEditor(boolean allowEmpty) {
        this.allowEmpty = allowEmpty;
        this.exactDateLength = -1;
    }

    /**
     * コンストラクタ
     * @param allowEmpty 空許可
     * @param exactDateLength 日付文字列の長さ
     */
    public CustomLocalDateTimeEditor(boolean allowEmpty, int exactDateLength) {
        this.allowEmpty = allowEmpty;
        this.exactDateLength = exactDateLength;
    }

    /**
     * テキストから対象型への変換を行います。
     * @param text テキスト
     */
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (this.allowEmpty && !StringUtils.hasText(text)) {
            // Treat empty String as null value.
            setValue(null);
        } else if (text != null && this.exactDateLength >= 0 && text.length() != this.exactDateLength) {
            throw new IllegalArgumentException(
                    "Could not parse date: it is not exactly" + this.exactDateLength + "characters long");
        } else {
            try {
                setValue(DateUtil.parseByPatterns(text, LocalDateTime::parse, PATTERNS));
            } catch (final DateTimeParseException ex) {
                throw new IllegalArgumentException("Could not parse date: " + ex.getMessage(), ex);
            }
        }
    }

    /**
     * 対象型からテキストへの変換を行います。
     * @return テキスト
     */
    @Override
    public String getAsText() {
        final LocalDateTime value = (LocalDateTime) getValue();
        return (value != null ? value.toString() : "");
    }
}
