$(document).ready(function () {

	$('.private_checkbox').change(function () {
		$('.private_recommendation').toggle(this.checked);
	}).change();

	//if ($('.SessionValue').val() == session['user_id']) {
	//	$('.actions-for-current-user').show();
	//} else {
	//	$('.actions-for-current-user').hide();
	//}

});