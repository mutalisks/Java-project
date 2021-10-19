$(function() {
  $(document).on('click', '[data-toggle=modal-iframe]', function(e) {
    if ($(e.target).is('.block-modal')
      || $(e.target).closest('[data-iframe-src] .block-modal-group').length) {
      return;
    }

    const params = {
      $button: $(this),
      iframeAttr: {
        src : $(this).attr('data-iframe-src'),
      },
      maxHeight : Number($(this).attr('data-max-hight') || 800),
      minHeight : Number($(this).attr('data-min-hight') || 350),
      reloadParentFlg : Boolean($(this).attr('data-reload-parent')),
      focus: $(this).attr('data-focus') != 'false'
    };

    if ($(this).attr('data-min-height')) {
      params.minHeight = Number($(this).attr('data-min-height'));
    }
    if ($(this).attr('data-max-height')) {
      params.maxHeight = Number($(this).attr('data-max-height'));
    }
    popupCommonModalIframe(params);
    return false;
  });
});

/**
 * 子画面をモーダルで表示する
 * @param  params 設定値一覧
 */
function popupCommonModalIframe(params) {
  // デフォルト値反映
  var $button = params.$button;
  var iframeAttr = params.iframeAttr || {};
  var maxHeight = params.maxHeight || 700;
  var minHeight = params.minHeight || 350;
  var reloadParentFlg = params.reloadParentFlg;
  var focus = params.focus != false;

  // モーダルのベースを取得・複製
  var $modal = $($button.attr('data-target')).clone();

  // モーダルのIDの重複防止
  var modalId = $($modal).attr('id');
  modalId = modalId + $('[id^=' + modalId + ']').length;

  $modal.attr({'id': modalId, 'data-max-height': maxHeight, 'data-min-height': minHeight});

  // 子画面を作成
  var $iframe = $('<iframe></iframe>');
  $iframe.attr(iframeAttr);
  $iframe.addClass('_popup');
  $iframe.addClass('dialog-container');

  // モーダルを画面に挿入
  $modal.find('div.modal-iframe').append($iframe)
  $button.closest('main').append($modal);

  // 子画面読み込み完了時
  $(window).on('loadModalIframe', function() {
    $iframe.contents().find('head meta:last').after('<meta name="parent-modal-id" content="' + modalId + '"></meta>');
  });

  // イベント登録
  $modal.on('shown.bs.modal adjustSize', function() {
    // リサイズ
    adjustModalSizeToIframe($modal, $iframe);
  }).on('hidden.bs.modal', function() {
    // モーダルが閉じられたら要素を削除する
    $modal.remove();
    // リロードフラグが立っている場合に画面を更新する
    if (reloadParentFlg) {
      location.reload();
    }
  });

  // モーダル表示
  $modal.modal({keyboard: false, backdrop: 'static', focus: focus});
  return $modal;
}

/**
 * モーダルのサイズをiframeのサイズに合わせます
 * @param $modal modal要素
 * @param $iframe iframe要素
 * @param minHeight 最小高さ
 * @param maxHeight 最大高さ
 */
function adjustModalSizeToIframe($modal, $iframe, minHeight, maxHeight) {
  // 基本は子画面のサイズに合わせる
  var modalSize = $iframe.contents().find('body').outerHeight(true) // 子画面のサイズ
      + $modal.find('.modal-header').outerHeight(true) // モーダルのヘッダーのサイズ
      + $modal.find('.modal-content').outerHeight() - $modal.find('.modal-content').innerHeight(); // モーダルのボーダーのサイズ

  // 最小値の反映
  if (typeof minHeight === 'number') {
    modalSize = Math.max(modalSize, minHeight);
  } else if ($modal.attr('data-min-height') !== '') {
    modalSize = Math.max(modalSize, Number($modal.attr('data-min-height')));
  }
  // 最大値の反映
  if (typeof maxHeight === 'number') {
    modalSize = Math.min(modalSize, maxHeight);
  } else if ($modal.attr('data-max-height') !== '') {
    modalSize = Math.min(modalSize, Number($modal.attr('data-max-height')));
  }

  $modal.find('.modal-content').animate({ height: modalSize + 'px' }, 200);
}
