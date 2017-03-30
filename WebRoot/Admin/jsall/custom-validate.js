(function(global) {
	function validation(options) {
		this.options = options;
		this.init();
	}

	validation.prototype = {
		init : function() {
			for ( var i = 0; i < this.options.length; i++) {
				var selector = "#" + this.options[i].id;
				var check = this.options[i].validate;
				var msgs = this.options[i].messages;
				this.addBlurHandler(selector, check, msgs);
			}
		},

		addBlurHandler : function(selector, check, msgs) {
			$(document).on("blur",selector,
					function() {
						var code = check($(this).val());
						if (code == 0) {
							$(this).closest('.control-group').removeClass(
									'error').addClass('success');
							$(this).next(".help-inline").remove();
						} else {
							var msg = msgs[code];
							$(this).closest('.control-group').removeClass(
									'success').addClass('error');
							var span = $(this).next(".help-inline");
							if (span.length > 0) {
								span.html(msg);
							} else {
								$(this).after(
										'<span class="help-inline">' + msg
												+ '</span>');
							}
						}
					});
		},
		
		validate : function() {
			var flag = true;
			for ( var i = 0; i < this.options.length; i++) {
				var selector = "#" + this.options[i].id;
				$(selector).blur();
				var check = this.options[i].validate;
				if (check($(selector).val()) != 0) {
					flag = false;
				}
			}
			return flag;
		},
		reset:function(){
			for ( var i = 0; i < this.options.length; i++) {
				var selector="#"+this.options[i].id;
				$(selector).closest('.control-group').removeClass('error').removeClass('success');
				$(selector).next(".help-inline").remove();
			}
		},
		
		showError:function(errors){
			for(var i=0;i<errors.length;i++){
				var field="#"+errors[i].id;
				var msg=errors[i].message;
				$(field).closest('.control-group').removeClass(
						'success').addClass('error');
				var span = $(field).next(".help-inline");
				if (span.length > 0) {
					span.html(msg);
				} else {
					$(field).after(
							'<span class="help-inline">' + msg
									+ '</span>');
				}
			}
		}
		
	};
	global = global || window;
	global.custom = global.custom || {};
	global.custom.validation = validation;

})(this);