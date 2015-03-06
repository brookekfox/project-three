// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .


$(document).ready(function () {

	//$(".private_checkbox").change(function () {
	//	$('.private_recommendation').toggle(this.checked);
	//}).change();

	if ($('.SessionValue').val() == session['user_id']) {
		$('.actions-for-current-user').show();
	} else {
		$('.actions-for-current-user').hide();
	}

});