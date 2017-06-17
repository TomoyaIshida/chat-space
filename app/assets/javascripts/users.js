$(function() {
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
      console.log(input);
    })
    .fail(function(data) {
      alert('error');
    });
  });
});
