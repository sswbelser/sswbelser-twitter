$(function () {
	$("#new_tweet").validate({
		rules: {
			"tweet[message]": {
				required: true,
				minlength: 2,
				maxlength: 200
			}
		},
		messages: {
			"tweet[message]": {
				required: "Please enter a tweet",
				minlength: "Your tweet must be at least 2 characters",
				maxlength: "Your tweet must be shorter than 200 characters"
			}
		}
	});
});