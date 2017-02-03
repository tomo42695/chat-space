document.addEventListener("turbolinks:load", function() {
  function buildHTML(data) {
    debugger;
    if (data[0].image) {
      Image = '<img src="' + data[0].image_url + '">';
    } else {
      Image = '';
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

  $('.chats__form').on('submit', function(e) {
    e.preventDefault();
    var messageField = $('.chats__form__text');
    var message = messageField.val();
    var imageField = $('.chats__form__image')
    var image = imageField.val();
    $.ajax({
      type: 'POST',
      url: ".",
      data: {
        message: {
          text: message,
          image: image
        }
      },
      dataType: 'json'
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
      $('.chats__form__submit').removeAttr('disabled');
    })
    .fail(function() {
      alert('error');
    });
  });
})
