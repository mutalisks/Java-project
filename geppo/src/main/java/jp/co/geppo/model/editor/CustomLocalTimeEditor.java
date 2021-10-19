package jp.co.geppo.model.editor;

import java.beans.PropertyEditorSupport;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

import org.springframework.util.StringUtils;

import jp.co.geppo.util.DateUtil;

/**
 * LocalTime用プロパティエディタ。
 */
public class CustomLocalTimeEditor extends PropertyEditorSupport {

    private static final String[] PATTERNS = {"H:m[:s]"};
    private final boolean allowEmpty;

    private final int exactDateLength;

    /**
     * コンストラクタ
     * @param allowEmpty 空許可
     */
    public CustomLocalTimeEditor(boolean allowEmpty) {
        this.allowEmpty = allowEmpty;
        this.exactDateLength = -1;
    }

    /**
     * コンストラクタ
     * @param allowEmpty 空許可
     * @param exactDateLength 日付文字列の長さ
     */
    public CustomLocalTimeEditor(boolean allowEmpty, int exactDateLength) {
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
                    "Could not parse time: it is not exactly" + this.exactDateLength + "characters long");
        } else {
            try {
                setValue(DateUtil.parseByPatterns(text, LocalTime::parse, PATTERNS));
            } catch (final DateTimeParseException ex) {
                throw new IllegalArgumentException("Could not parse time: " + ex.getMessage(), ex);
            }
        }
    }

    /**
     * 対象型からテキストへの変換を行います。
     * @return テキスト
     */
    @Override
    public String getAsText() {
        final LocalTime value = (LocalTime) getValue();
        return (value != null ? value.toString() : "");
    }
}
