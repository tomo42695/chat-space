document.addEventListener('turbolinks:load', function() {
  function buildHTML(data, name, image) {
    if (image == null) {
      Image = '';
    } else {
      Image = '<img src="' + image + '">';
    }
    var html = $('<div class="chats__list__chat">'          +
                    '<div class="chats__list__chat__user">' +
                      name                                  +
                    '</div>'                                +
                    '<div class="chats__list__chat__date">' +
                      data.created_at                       +
                    '</div>'                                +
                    '<div class="chats__list__chat__text">' +
                      data.text                             +
                      Image                                 +
                    '</div>'                                +
                  '</div>');

    return html;
  }

  function buildFLASH(data) {
    var html = $('<div class="alert">'          +
                   data[2]                      +
                 '</div>');
    return html;
  }

  setInterval(function(data) {
    $.ajax({
      type: 'GET',
      url: './new',
      dataType: 'json'
    })
    .done(function(data) {
      $('.chats__list').empty();
      $.each(data, function(i, data) {
        var html = buildHTML(data, data.name, data.image);
        $('.chats__list').append(html);
      })
    })
    .fail(function() {
      console.log('エラーが発生しました');
    })
  }, 5000);

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
        var html = buildHTML(data[0], data[1].name, data[0].image.url);
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
