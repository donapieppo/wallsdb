$(function() {
  $("input.datetime_picker").datetimepicker({locale: 'it', stepping: 15, sideBySide: true});
  $(".event-container").click( function() {
    window.location.href = $(this).data("url");
  });
});

