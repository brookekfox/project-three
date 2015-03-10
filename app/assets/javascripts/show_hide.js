$(document).ready(function () {

	$('.private_checkbox').change(function () {
		$('.private_recommendation').toggle(this.checked);
	}).change();

});