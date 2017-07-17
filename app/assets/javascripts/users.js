// 登録フォームの判定を共通処理化
function changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit) {
  if ($last_name.val() == '' || $first_name.val() == '' || $email.val() == '' || $password.val() == '' || $password_confirmation.val() == '') {
    $submit.attr('disabled', 'disabled');
  } else {
    $submit.removeAttr('disabled');
  }
}

// 登録フォームのバリデーション
function validationUserForm() {
  var $last_name = $('***REMOVED***user_last_name');
  var $first_name = $('***REMOVED***user_first_name');
  var $email = $('***REMOVED***user_email');
  var $password = $('***REMOVED***user_password');
  var $password_confirmation = $('***REMOVED***user_password_confirmation');
  var $submit = $('***REMOVED***user-registration-submit');
  changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  $last_name.bind('keyup', function() {
    changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  });
  $first_name.bind('keyup', function() {
    changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  });
  $email.bind('keyup', function() {
    changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  });
  $password.bind('keyup', function() {
    changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  });
  $password_confirmation.bind('keyup', function() {
    changeRegistrationBtn($last_name, $first_name, $email, $password, $password_confirmation, $submit);
  });
}

$(function() {
  $('***REMOVED***user_icon').on('change', function (e) {
    if (e.target.files[0].size > 0) {
      $(this).parents('form').submit();
      $('.loading').fadeIn();
    }
  });
  validationUserForm();
});

