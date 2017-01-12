$(function() {
  function buildHTML(message) {
    var html = $('<li class="todo">').append(message.text);
    return html;
  }

  $('.chats__form').on('submit', function(e) {
    e.preventDefault();
    var messageField = $('.chats__form__text');
    var message = messageField.val();
    $.ajax({
      type: 'POST',
      url: '/message.json',
      data: {
        message: {
          text: message
          image: image
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
