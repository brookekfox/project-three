$(document).ready(function () {
	$(".store_checkbox").change(function () {
		$('.private_recommendation').toggle(this.checked);
	}).change();
});