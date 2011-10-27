function checkForm(obj){
    var return_value = true;
    
    // регулярное выражение, для проверки почтового ящика         
    var reg_mail = /[0-9a-z_]+@[0-9a-z_^.]+.[a-z]{2,3}/i;
    
    // регулярное выражение, для проверки отправителя
    var reg_sender = /[a-z]+/i;
    
    // регулярное выражение, для проверки телефона
    var reg_phone = /[0-9]+/;
    
    // заносим значение поля почтовый ящик в переменную mail
    var mail = obj.email.value;
    
    // заносим значение поля отправитель в переменную sender
    var sender = obj.name.value;

    // заносим значние поля телефон в переменную phone
    var phone = obj.phone.value;
    
    // заносим значение поля сообщение в переменную msg
    var msg = obj.message.value;
    
    // объявляем переменную куда будет заносится текст сообщения
    var error_msg = "Не корректно заполнены поля: ";
   
    //проверка поля отправитель
    if(reg_sender.exec(sender) == null && sender ==""){
        error_msg += "имя, ";
        return_value = false;
    }
    //проверка поля почтовый ящик
    if(reg_mail.exec(mail) == null){
        error_msg += "e-mail, ";
        return_value = false;
    }
    //проверка поля телефон
    if(reg_phone.exec(phone) == null){
      error_msg += "телефон, ";
      return_value = false;
    }
    //проверка поля текст сообщения
    if(msg == ""){
        error_msg += "сообщение ";
        return_value = false;
    }
    //проверка на наличие ошибок, если возникла ошибка ввыводим текст сообщения
    if(!return_value)
        alert(error_msg);
       
    return return_value;
}

// menu
var timeout    = 500;
var closetimer = 0;
var ddmenuitem = 0;
 
function jsddm_open() {
    jsddm_canceltimer();
    jsddm_close();
    ddmenuitem = $(this).find('ul').css('visibility', 'visible');
}
 
function jsddm_close() {
    if (ddmenuitem) ddmenuitem.css('visibility', 'hidden');
}
 
function jsddm_timer() {
    closetimer = window.setTimeout(jsddm_close, timeout);
}
 
function jsddm_canceltimer() {
    if (closetimer) {
        window.clearTimeout(closetimer);
        closetimer = null;
    }
}
 
$(document).ready(function() {
    $('#jsddm > li').bind('mouseover', jsddm_open);
    $('#jsddm > li').bind('mouseout',  jsddm_timer);
});
document.onclick = jsddm_close;