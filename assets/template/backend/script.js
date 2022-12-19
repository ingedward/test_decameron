$(document).ready(function () {
    $(".btn-remove").on("click", function(e){
        e.preventDefault();
        var ruta = $(this).attr("href");
        //alert(ruta);
        $.ajax({
            url: ruta,
            type:"POST",
            success:function(resp){
                window.location.href = base_url + resp;
            }
        });
    });

  
    $(".btn-view-hotel").on("click", function(){
        var hotel = $(this).val(); 
        var infoHotel = hotel.split("*");
        html = "<p><strong>Nombre: </strong>"+infoHotel[1]+"</p>"
        html += "<p><strong>Nit: </strong>"+infoHotel[2]+"</p>"
        html += "<p><strong>Ciudad: </strong>"+infoHotel[3]+"</p>"
        html += "<p><strong>Dirección: </strong>"+infoHotel[4]+"</p>"
        html += "<p><strong>Teléfono: </strong>"+infoHotel[5]+"</p>"
        html += "<p><strong>Contacto: </strong>"+infoHotel[6]+"</p>"
        html += "<p><strong>Habitaciones: </strong>"+infoHotel[7]+"</p>"
        $("#modal-default .modal-body").html(html);
    });

    $(".btn-view-habitacion").on("click", function(){
        var habitacion = $(this).val(); 
        var infoHabitacion = habitacion.split("*");
        html = "<p><strong>Nombre Hotel: </strong>"+infoHabitacion[1]+"</p>"
        html += "<p><strong>Tipo Habitación: </strong>"+infoHabitacion[2]+"</p>"
        html += "<p><strong>Acomodación: </strong>"+infoHabitacion[3]+"</p>"
        html += "<p><strong>Cantidad: </strong>"+infoHabitacion[4]+"</p>"
        $("#modal-default .modal-body").html(html);
    });



    $('#example').DataTable( {
        dom: 'Bfrtip',
        buttons: [
            {
                extend: 'excelHtml5',
                title: "Listado de Ventas",
                exportOptions: {
                    columns: [ 0, 1,2, 3, 4, 5 ]
                },
            },
            {
                extend: 'pdfHtml5',
                title: "Listado de Ventas",
                exportOptions: {
                    columns: [ 0, 1,2, 3, 4, 5 ]
                }
                
            }
        ],

        language: {
            "lengthMenu": "Mostrar _MENU_ registros por pagina",
            "zeroRecords": "No se encontraron resultados en su busqueda",
            "searchPlaceholder": "Buscar registros",
            "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
            "infoEmpty": "No existen registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
        }
    });
 
	$('#example1').DataTable({
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros por pagina",
            "zeroRecords": "No se encontraron resultados en su busqueda",
            "searchPlaceholder": "Buscar registros",
            "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
            "infoEmpty": "No existen registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
        }
    });

    $('.example1').DataTable({
        "language": {
            "lengthMenu": "Mostrar _MENU_ registros por pagina",
            "zeroRecords": "No se encontraron resultados en su busqueda",
            "searchPlaceholder": "Buscar registros",
            "info": "Mostrando registros de _START_ al _END_ de un total de  _TOTAL_ registros",
            "infoEmpty": "No existen registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "search": "Buscar:",
            "paginate": {
                "first": "Primero",
                "last": "Último",
                "next": "Siguiente",
                "previous": "Anterior"
            },
        }
    });

	$('.sidebar-menu').tree();


})




