package jp.co.geppo.model.security;

import java.util.Base64;

import org.springframework.security.crypto.codec.Hex;
import org.springframework.security.crypto.codec.Utf8;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * MD5パスワードエンコーダークラス
 */
public class MD5PasswordEncoder implements PasswordEncoder {
    private boolean encodeHashAsBase64;
    private final Digester digester;
    private final String algorithm = "MD5";

    public MD5PasswordEncoder() {
        this.digester = new Digester(algorithm, 1);
    }

    public void setEncodeHashAsBase64(boolean encodeHashAsBase64) {
        this.encodeHashAsBase64 = encodeHashAsBase64;
    }

    /**
     * Encodes the rawPass using a MessageDigest. If a salt is specified it will be merged
     * with the password before encoding.
     *
     * @param rawPassword The plain text password
     * @return Hex string of password digest (or base64 encoded string if encodeHashAsBase64 is enabled.
    */
    @Override
    public String encode(CharSequence rawPassword) {
        return digest(rawPassword);
    }

    /**
     * 16進数のダイジェスト化された文字列
     * @param digest ダイジェスト
     * @return 16進数のダイジェスト化された文字列(encodeHashAsBase64がtrueの場合base64エンコードされた文字列)
     */
    private String encode(byte[] digest) {
        if (this.encodeHashAsBase64) {
            return Utf8.decode(Base64.getEncoder().encode(digest));
        } else {
            return new String(Hex.encode(digest));
        }
    }

    /**
     * Takes a previously encoded password and compares it with a rawpassword after encoding that value
     *
     * @param rawPassword plain text password
     * @param encodedPassword previously encoded password
     * @return true or false
     */
    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        final String rawPasswordEncoded = digest(rawPassword);
        return PasswordEncoderUtils.equals(encodedPassword.toString(), rawPasswordEncoded);
    }

    /**
     * ダイジェスト化する
     * @param rawPassword 生パスワード
     * @return ダイジェスト化された生パスワード
     */
    private String digest(CharSequence rawPassword) {
        final byte[] digest = this.digester.digest(Utf8.encode(rawPassword));
        final String encoded = encode(digest);
        return encoded;
    }
}
