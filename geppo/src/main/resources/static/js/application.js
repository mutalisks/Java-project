$(function() {
  // IE対応 IEだと最大化などでresizeが呼ばれるまでにラグが存在するため
  if(isIE()) {
    function triggerResize() {
      setTimeout(function() {
        $(window).triggerHandler('resize');
      }, 0);
    }
    triggerResize();
    $(window).on('resize', triggerResize);
  }
  // TODO: Chrome以外では動かない
  // 要素リサイズ時, 画面のリサイズを走らせる
  if (!isIE()) {
    const target = $('main').get(0);
    if (target) {
      const observer = new ResizeObserver(function() {
        $(window).triggerHandler('resize');
      });
      observer.observe(target);
    }
  }

  $('table.table-clickable tr[data-href]').on('click', function(e) {
    // 特定の要素・要素内では画面遷移をブロックする
    if ($(e.target).is('.block-page-transition')
        || $(e.target).closest('[data-href] .block-page-transition-group').length) {
      return;
    }
    const href = $(this).data('href');
    const target = $(this).data('target');
    if (target === '_blank') {
      window.open(href);
    } else {
      location.href = href;
    }
  });
  $('[data-toggle=tooltip]').tooltip();

  // エンター時のサブミット無効
  // 指定のclassが付いている場合は無効化しない
  $(document).on('keydown', 'form:not(.allow-enter-submit) input', function(e) {
    if (e.key === 'Enter') {
      return false;
    }
  });

  // 別のurlへのsubmit
  $('button[data-target-form]').on('click', function() {
    const targetForm = $(this).attr('data-target-form');
    if (targetForm === 'this') {
      $(this).closest('form').attr('action', $(this).attr('data-action')).submit();
    } else {
      $(targetForm).submit();
    }
  });

  // 変更不可のセレクトボックス対応
  $('form').on('submit', function() {
    $(this).find('select.select-readonly').prop('disabled', false);
  });

  // 汎用項目へのセレクトボックスによる入力サポート
  $('form div.general-item-input-support-selection').on('change', function() {
    const $this = $(this);
    const selectedValue = $this.find('select option:selected').val();
    if (selectedValue) {
      const $input = $this.closest('.form-group.row').find('input[type=text]');
      $input.val(selectedValue);
    }
  });

  // URLをリンクに変換する
  if ($.fn.linkify) {
    $('.url-link').linkify();
  }

  if ($.fn.floatThead) {
    $('table.table-scrollable').each(function() {
      const $table = $(this);
      // IE対応 IEでは1行目がヘッダに隠れてしまうため
      if(isIE()) {
        const mock = $($table.find('thead tr:first').html().replace(/th/g, 'td'));
        $table.find('tbody').prepend(mock);
      }
      // テーブルをスクロール可能にする
      $table.floatThead({
        scrollContainer: function($table) {
          return $table.closest('.wrapper');
        }
      });
    });
  }

  if (!isCookieEnabled()) {
    $('.cookie-message').show();
  }

  // ガイダンス
  (function initGuidanceDisplay() {
    const $guidance = $('.guidance');
    const cookieKey = 'guidance_not_show';
    const tenYear = 60 * 60 * 24 * 365 * 10;

    $('.guidance-link').on('click', function() {
      $guidance.addClass('active');
      document.cookie = cookieKey + '=;path=/;max-age=0';
    });

    $('.guidance-content .close').on('click', function() {
      $guidance.removeClass('active');
      document.cookie = cookieKey + '=;path=/;max-age=' + tenYear;
    });
  })();

  // 左メニュー
  (function initSidebarDisplay() {
    const $toggler = $('.sidebar-toggler');
    const $body = $('body');
    const cookieKey = 'sidebar_not_show';
    const tenYear = 60 * 60 * 24 * 365 * 10;

    $toggler.on('click', function() {
      if ($body.hasClass('sidebar-show')) {
        // 非表示時
        document.cookie = cookieKey + '=;path=/;max-age=' + tenYear;
      } else {
        // 表示時
        document.cookie = cookieKey + '=;path=/;max-age=0';
      }
    });
  })();
});

/**
 * IEかを判定します。
 * @return 判定
 */
function isIE() {
  const userAgent = window.navigator.userAgent.toLowerCase();
  return userAgent.indexOf('trident') !== -1;
}

/**
 * Cookieがオンになっているか判定します。
 * @return 判定結果
 */
function isCookieEnabled() {
  if (!navigator.cookieEnabled) {
    return false;
  }

  /* IE 11 は navigator.cookieEnabled が常に true を返すので、仮 Cookie を設定して判定する */
  const TEMP_COOKIE = 'tmp_check=1';

  const nowCookie = document.cookie;
  document.cookie = TEMP_COOKIE; // 仮 Cookie 設定
  if (nowCookie === document.cookie) {
    return false;
  }

  document.cookie = TEMP_COOKIE + ';expires=' + (new Date(0)).toUTCString(); // 仮 Cookie 削除（有効期限に過去日を指定）
  return true;
}

/**
 * 日付をフォーマットする
 * @param 日付
 * @param フォーマット
 * @return フォーマット済み日付
 */
function formatDate(date, format) {
  if (!format) {
    format = 'yyyy-MM-dd hh:mm:ss.SSS';
  }
  format = format.replace(/yyyy/g, date.getFullYear());
  format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
  format = format.replace(/dd/g, ('0' + date.getDate()).slice(-2));
  format = format.replace(/hh/g, ('0' + date.getHours()).slice(-2));
  format = format.replace(/mm/g, ('0' + date.getMinutes()).slice(-2));
  format = format.replace(/ss/g, ('0' + date.getSeconds()).slice(-2));
  if (format.match(/S/g)) {
    var milliSeconds = ('00' + date.getMilliseconds()).slice(-3);
    var length = format.match(/S/g).length;
    for (var i = 0; i < length; i++) {
      format = format.replace(/S/, milliSeconds.substring(i, i + 1));
    }
  }
  return format;
}
