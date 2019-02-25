jQuery.validator.addMethod("isUsername", function(value, element){

    //username验证正则表达式   
    var username = /^[a-zA-Z][a-zA-Z0-9]{4,15}$/;
    return this.optional(element) || (username.test(value));
    
}, "须以英文字母开头,长度大于4小于15");

jQuery.validator.addMethod("isEmail", function(value, element){
 
    var email = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
    return this.optional(element) || (email.test(value));
    
}, "请输入正确的邮箱格式");


jQuery.validator.addMethod("isPassword", function(value, element){
	 
    var password = /^(?!([a-zA-Z]+|\d+)$)[a-zA-Z\d]{6,20}$/;
    return this.optional(element) || (password.test(value));
    
}, "密码至少为6位，且包含数字和字母");

jQuery.validator.addMethod("isaddress", function(value, element){
			 
	var address = /[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+\.?/;
	return this.optional(element) || (address.test(value));

}, "请输入正确的地址");