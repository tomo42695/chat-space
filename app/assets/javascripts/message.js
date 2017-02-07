document.addEventListener("turbolinks:load", function() {
  function buildHTML(data) {
    if (data[0].image.url == null) {
      Image = '';
    } else {
      Image = '<img src="' + data[0].image.url + '">';
    }
    var html = $('<div class="chats__list__chat">'          +
                    '<div class="chats__list__chat__user">' +
                      data[1].name                          +
                    '</div>'                                +
                    '<div class="chats__list__chat__date">' +
                      data[0].created_at                    +
                    '</div>'                                +
                    '<div class="chats__list__chat__text">' +
                      data[0].text                          +
                      Image                                 +
                    '</div>'                                +
                  '</div>');

    return html;
  }
  function buildFLASH(data) {
    var html = $('<div class="alert">'          +
                      data[2]                   +
                  '</div>');
    return html;
  }

  $('.new_message').on('submit', function(e) {
    e.preventDefault();

    var messageField = $('.chats__form__text');
    var imageField = $('.chats__form__image');

    var form = $('#new_message')[0];
    var formData = new FormData(form);

    $.ajax({
      type: 'POST',
      url: ".",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      $('.flash').empty();
      if (data[2] == null) {
        var html = buildHTML(data);
        $('.chats__list').append(html);
      } else {
        var html = buildFLASH(data);
        $('.flash').append(html);
      };
      messageField.val('');
      imageField.val('');

      $('.chats__form__submit').removeAttr('disabled');
    })
    .fail(function() {
      alert('エラーが発生しました');
    });
  });
})
