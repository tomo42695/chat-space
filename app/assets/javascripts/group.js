document.addEventListener('turbolinks:load', function() {
  var list = $('#chat-group-users-search');
  var preWord;

  function buildSearchResult(name, id) {
    var html = '<li class="list">'                                                                                       +
                  name                                                                                                   +
                  '<a class="search-button search-button-plus" data-name="' + name +'" data-user_id="' + id + '">追加</a>'+
                '</li>';
    return html;
  }

  function buildSelectedUsers(name, id) {
    var html = '<li class="list">'                                                                                                +
                  name                                                                                                            +
                  '<input type="hidden" name="group[user_ids][]" value="' + id + '">'                                             +
                    '<a class="search-button search-button-minus" data-name="' + name +'" data-user_id="' + id + '" >削除</input>' +
                  '</input>' +
                '</li>'
                ;
    return html;
  }

  $('#user-name').on('keyup', function(e) {
    e.preventDefault
    var input = $('#user-name').val();
    $.ajax({
      type: 'GET',
      url: '/groups/search.json',
      data: {
        name: input
      },
      dataType: 'json'
    })
    .done(function(data) {
      $('.list').remove();
      var users = data;
      users.forEach(function(user, i, users) {
        var name = user.name
        var user_id = user.id
        var html = buildSearchResult(name, user_id);
        $('#chat-group-users-search').append(html)
      })

      $(document).on('click', '.search-button-plus', function(e) {
        e.preventDefault;
        $(this).parent().remove();
        var user_id = $(this).data('user_id')
        var name = $(this).data('name')
        html = buildSelectedUsers(name, user_id);
        $('#chat-group-form__field--right-users').append(html)
      })
      $(document).on('click', '.search-button-minus', function(e) {
        e.preventDefault;
        $(this).parent().remove();
      })
    })
    .fail(function() {

    })
  });
});
