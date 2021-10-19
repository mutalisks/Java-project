$(function() {
  // csrfを追加
//  var token = $('meta[name=_csrf]').attr('content');
//  var header = $('meta[name=_csrf_header]').attr('content');
//  $(document).ajaxSend(function(_, xhr, _) {
//    xhr.setRequestHeader(header, token);
//  });
});

/**
 * ajax
 * @param settings 設定値一覧
 * 設定値一覧詳細は、https://api.jquery.com/jQuery.ajax/#jQuery-ajax-settings
 * @return ajaxオブジェクト
 */
function ajax(settings) {
  // デフォルト値反映
  var settings = Object.assign(createDefaultAjaxSettings(), settings);

  var $ajax = $.ajax(settings);

  if (settings.done) {
    $ajax.done(settings.done);
  }

  if (settings.fail) {
    $ajax.fail(settings.fail);
  }

  if (settings.always) {
    $ajax.always(settings.always);
  }

  return $ajax;
}

/**
 * ajaxデフォルト引数を作成します
 */
function createDefaultAjaxSettings() {
  return {
    cache : false,
    traditional  : true,
  };
}
