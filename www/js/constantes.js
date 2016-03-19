var URL = 'http://localhost:11638/api/';









//===========================================
$(function(){
    $.ajaxSetup({
        error: function( jqXHR, textStatus, errorThrown ) {
            if (jqXHR.status === 0)                 { alert('No conectado: Verifique la red. '+ errorThrown); }
            else if (jqXHR.status == 404)           { alert('La página solicitada no se encontró [404]. '+ errorThrown); }
            else if (jqXHR.status == 500)           { alert('Error interno del servidor [500]. '+ '::::'+ jqXHR.responseText); }
            else if (textStatus === 'parsererror')  { alert('Solicitud de análisis JSON falló. '+ errorThrown); }
            else if (textStatus === 'timeout')      { alert('Tiempo máximo de ejecución agotado. '+ errorThrown); }
            else if (textStatus === 'abort')        { alert('Solicitud Ajax abortada. '+ errorThrown); }
            else                                    { alert('Error no capturado: ' + jqXHR.responseText); }
            
            //ManejarError(errorThrown + ' ======== '+ 'STATUS: '+ textStatus +' ============ '+ jqXHR.responseText);
        }
    });
});