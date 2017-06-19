$(function() {
  function new_message(data) {
    var chatImage = '';
    if (data.image.url) {
      chatImage = `<img src="${data.image.url}">`;
    }
    var new_message = $('<div class="main-content__center__chatinfo">' +
                '<div class = "main-content__center__chatinfo__username">' + '<p>' + data.name + '<p>' + '</div>' +
                '<div class = "main-content__center__chatinfo__date">' + '<p>' + data.time + '<p>' + '</div>' +
                '<div class = "main-content__center__chatinfo__message">' + '<p>' + data.body + '<p>' + chatImage + '</div>' +
                '</div>');
    return new_message;
  }
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var chat_url = $(this).attr("action")
    $.ajax({
      type: 'POST',
      url: chat_url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data) {
      var html = new_message(data);
      $('.main-content__center').append(html);
      $('.js-form__text-field').val('');
      $('.js-form__image').val('');
      $('.main-content__bottom__send-button').prop('disabled', false);
      $('.main-content__center').animate({scrollTop: $('.main-content__center')[0].scrollHeight}, 'fast');
    })
    .fail(function(data) {
      alert('メッセージを入力してください');
    });
  });

  function buildHTML(message) {
    var insertImage = '';
    if (message.image.url) {
      insertImage = `<img src="${message.image.url}">`;
    }
    var html = `
      <div class="main-content__center__chatinfo">
        <div class="main-content__center__chatinfo__username"><p>${message.name}</p></div>
        <div class="main-content__center__chatinfo__date"><p>${message.time}</p></div>
        <div class="main-content__center__chatinfo__message"><p>${message.body}</p>${insertImage}</div>
      </div>`;
    return html
  }

  var interval = setInterval(function() {
    if (window.location.href.match(/\/groups\/\d+\/messages/)) {
      $.ajax({
        type: 'GET',
        url: location.href,
        dataType: 'json',
        processData: false,
        contentType: false,
      })

      .done(function(json) {
        var insertHTML = '';
        json.messages.forEach(function(message) {
          insertHTML += buildHTML(message);
        });
        $('.main-content__center').html(insertHTML);
        $('.main-content__center').animate({scrollTop: $('.main-content__center')[0].scrollHeight}, 'fast');
      })

      .fail(function(data) {
        alert('自動更新に失敗しました');
      });
    } else {
      clearInterval(interval);
    }
  }, 5000 );
});
