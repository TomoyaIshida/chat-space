$(function() {

  function add_member(user) {
    var add_member = '<div class="chat-group-user clearfix">' +
                '<p class = "chat-group-user__name">' + user.name + '</p>' +
                '<a class = "user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id= "' + user.id +'" data-user-name= "'+ user.name +'"+>追加</a>' +
                '</div>';
    return add_member;
  }

 function new_member(user_id, user_name) {
    console.log("new_member")
    var new_member = '<div class="chat-group-user clearfix js-chat-member" id="chat-group-user-8">' +
                '<input name="group[user_ids][]" type="hidden" value="' + user_id + '">' +
                '<p class = "chat-group-user__name">' + user_name + '</p>' +
                '<a class = "user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">削除</a>' +
                '</div>';
    return new_member;
  }

  $('#user-search-field').on('keyup', function(e){
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
      $form.empty();

      $(data).each (function(i, user){
        $form.append('<li>' + add_member(user) + '</li>');
      });
    })

    .fail(function(data) {
      alert('ユーザー検索に失敗しました');
    });
  });

  $('.chat-group-form__search').on('click', '.chat-group-user__btn--add', function(){
    var user_id = $(this).attr('data-user-id');
    var user_name = $(this).attr('data-user-name');
    var $member = $('#chat-group-users');
    $(this).parent().remove();
    $member.append('<li>' + new_member(user_id, user_name) + '</li>');
  });

  $('.chat-group-form__field').on('click', '.user-search-remove', function(){
    $(this).parent().remove();
  });
});
