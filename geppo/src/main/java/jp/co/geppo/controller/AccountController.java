package jp.co.geppo.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jp.co.geppo.model.form.LoginForm;
import jp.co.geppo.model.message.MessageStore;

/**
 * アカウントコントローラ―
 */
@Controller
public class AccountController {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private MessageStore messageStore;

    /**
     * ログイン画面を表示します。
     * @param model モデル
     * @return 画面
     */
    @GetMapping("/login")
    public String login(Model model) {
        if (request.getUserPrincipal() != null) {
            return "redirect:/geppo/list";
        }
        model.addAttribute(new LoginForm());
        return "account/login";
    }

    @PostMapping("/login")
    public String login(@Validated LoginForm loginForm, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "account/login";
        }
        try {
            request.login(loginForm.getId(), loginForm.getPassword());
        } catch (final ServletException e) {
            messageStore.addErrorMessage("BE001");
            return "account/login";
        }
        return "redirect:/geppo/list";
    }
}