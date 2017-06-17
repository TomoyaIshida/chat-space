$(function() {
  function new_message(data) {
    var new_message = '<div class="chat-group-user clearfix">' +
                '<p class = "chat-group-user__name">' + data.name + '</p>' +
                '<a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="data.id" data-user-name="data.name">追加</a>' +
                '</div>';
    return new_message;
  }
  $(document).on('keyup', '#user-search-field', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
    $.ajax({
      url: '/users',
      type: 'GET',
      data: ('keyword=' + input),
      processData: false,
      contentType: false,
      dataType: 'json'
    })
    .done(function(data){
      var $form = $('#user-search-result')
      $form.find('li').remove();
      $(data).each (function(i, user){
      $form.append('<li>' + new_message(user) + '</li>')
      });
    })
    .fail(function(data) {
      alert('ユーザー検索に失敗しました');
    });
  });
});
