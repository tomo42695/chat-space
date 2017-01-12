$(function() {
  function buildHTML(message) {
    var html = $('<div class="chats__list__chat">'          +
                    '<div class="chats__list__chat__user">' +
                      message.user.name                     +
                    '</div>'                                +
                    '<div class="chats__list__chat__date">' +
                      message.created_at                    +
                    '</div>'                                +
                    '<div class="chats__list__chat__text">' +
                      message.text                          +
                    '</div>'                                +
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
      var html = buildHTML(data);
      $('.chats__list').append(html);
      messageField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
})
