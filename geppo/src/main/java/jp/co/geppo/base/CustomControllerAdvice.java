package jp.co.geppo.base;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.persistence.EntityNotFoundException;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ResponseStatus;

import jp.co.geppo.model.editor.CustomLocalDateEditor;
import jp.co.geppo.model.editor.CustomLocalDateTimeEditor;
import jp.co.geppo.model.editor.CustomLocalTimeEditor;

/**
 * コントローラ共通処理クラス。
 */
@ControllerAdvice
public class CustomControllerAdvice {

    /** リクエストをバインドする際のViewModel内のリストの最大長 */
    private static final int AUTO_GROW_COLLECTION_LIMIT = 10000;

    /**
     * 型変換の初期化を行います。
     * @param dataBinder データバインダー
     */
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        dataBinder.setAutoGrowCollectionLimit(AUTO_GROW_COLLECTION_LIMIT);
        dataBinder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
        dataBinder.registerCustomEditor(LocalDate.class, new CustomLocalDateEditor(true));
        dataBinder.registerCustomEditor(LocalDateTime.class, new CustomLocalDateTimeEditor(true));
        dataBinder.registerCustomEditor(LocalTime.class, new CustomLocalTimeEditor(true));
    }

    /**
     * 例外全般場合のAPIエラーレスポンス用オブジェクトを作成します。
     * @param e 例外
     * @return APIエラーレスポンス用オブジェクト
     */
    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(EntityNotFoundException.class)
    public String createEntityNotFoundExceptionErrorPage(Exception e, Model model) {
        e.printStackTrace();
        model.addAttribute("message", HttpStatus.NOT_FOUND.getReasonPhrase());
        return "error/error";
    }

    /**
     * 例外全般場合のAPIエラーレスポンス用オブジェクトを作成します。
     * @param e 例外
     * @return APIエラーレスポンス用オブジェクト
     */
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public String createExceptionErrorPage(Exception e, Model model) {
        e.printStackTrace();
        model.addAttribute("message", HttpStatus.INTERNAL_SERVER_ERROR.getReasonPhrase());
        return "error/error";
    }
}
