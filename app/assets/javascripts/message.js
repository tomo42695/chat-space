$(function() {
  function buildHTML(data) {
    var html = $('<div class="chats__list__chat">'          +
                    '<div class="chats__list__chat__user">' +
                      data[1].name                          +
                    '</div>'                                +
                    '<div class="chats__list__chat__date">' +
                      data[0].created_at                    +
                    '</div>'                                +
                    '<div class="chats__list__chat__text">' +
                      data[0].text                          +
                    '</div>'                                +
                  '</div>');
                  console.log(data);

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
    $.ajax({
      type: 'POST',
      url: ".",
      data: {
        message: {
          text: message
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
