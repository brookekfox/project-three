$(document).ready(function () {

	if ($('.SessionValue').val() == session['user_id']) {
		$('.actions-for-current-user').show();
	} else {
		$('.actions-for-current-user').hide();
	}

});