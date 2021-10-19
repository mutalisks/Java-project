$(function () {
  $('button#clear').on('click', function () {
    $('#id').val('');
    $('#writtenBy').val('');
    $('#keyword').val('');
    $('#dateFrom').val('');
    $('#dateTo').val('');
  });

  $('tr').on('click', function () {
    location.href = $(this).attr('data-href');
  });
})