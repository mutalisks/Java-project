package jp.co.geppo.model.form;

import javax.validation.constraints.NotNull;

/**
 * ログインフォーム
 */
public class LoginForm {

    /** ID */
    @NotNull(message="please input your ID")
    private String id;

    /** パスワード */
    @NotNull(message="please input your password")
    private String password;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}