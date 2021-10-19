//エラーのポップアップ表示
$(function () {
  applyValidationError();
});

function applyValidationError() {
  var $inputE = $('input, select, textarea').filter('.error-field').closest('div');

  if ($inputE.length) {
    // 全てのcontrol-errorに対して処理を実行
    $inputE.each(controlError);

    // 消去したツールチップにカーソルが合った場合に親のmouseenterが暴発することへの対策
    $('form').on('mouseenter', 'span.error-tooltip', function (e) {
        e.stopPropagation();
    });
  }
}

function controlError(index, element) {

  var $target = $(this);

  // カーソルを合わせた場合ツールチップ表示
  $target.on('mouseenter', function () {
    fadeIn($target);
  });
  // カーソルが外れた場合、フォーカスが合っていなければツールチップ消去
  $target.on('mouseleave', function () {
    if(!$target.find('input:focus, select:focus, textarea:focus').length) {
      fadeOut($target);
    }
  });

  // ツールチップにカーソルが合った場合、フォーカスが合っていなければツールチップ消去
  $target.find('span.error-tooltip:first').on('mouseenter', function () {
    if(!$target.find('input:focus, select:focus, textarea:focus').length) {
      fadeOut($target);
    }
  });

  // フォーカスを合わせた場合ツールチップ表示
  $target.find('input, select, textarea').on('focus', function () {
    fadeIn($target);
  });
  // フォーカスが外れた場合ツールチップ消去
  $target.find('input, select, textarea').on('blur', function () {
    fadeOut($target);
  });
}

function fadeIn($elm) {
  if ($elm.hasClass('control-error-disabled')) {
    return false;
  }
  var $errorElm = $elm.find('span.error-tooltip:first');

  if ($errorElm.length) {
    $errorElm.stop().fadeTo('fast', 1);
    $elm.parent().css('position', 'relative');

    var boxPadding = parseInt($elm.parent().css('padding-top'), 10);
    var thisHeight = $errorElm.height();

    if ($errorElm.hasClass('tooltip-left')) {
      $errorElm.css({
        'position': 'absolute',
        'top': '2px',
        'left': '-270px',
        'width': '270px !important'
      });
    } else {
      $errorElm.css({
        'position': 'absolute',
        'top': boxPadding - thisHeight - 20 + 'px',
        'left': 15 + 'px'
      });
    }
  }
}

function fadeOut($elm) {
  var $errorElm = $elm.find('span.error-tooltip:first');
  $errorElm.stop().fadeTo('fast', 0, function () {
    $errorElm.css('display', 'none');
  });
}