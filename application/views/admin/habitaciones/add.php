<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Habitaciones <small>Nuevo</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <?php if($this->session->flashdata("error")):?>
                            <div class="alert alert-danger alert-dismissible">
                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                <p>
                                    <i class="icon fa fa-ban"></i>
                                    <?php echo $this->session->flashdata("error"); ?>
                                </p>
                             </div>
                        <?php endif;?>
                        <form action="<?php echo base_url();?>frontend/habitaciones/store" method="POST">

                            <div class="form-group <?php echo form_error("hotel_id") != false ? 'has-error':'';?>">
                                <label for="hotel_id">
                                    Hotel
                                </label>
                                <select name="hotel_id" id="hotel_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php foreach ($hoteles as $hotel) :?>
                                        <option value="<?php echo $hotel->id;?>" <?php echo set_select("hotel_id",$hotel->id);?>>
                                            <?php echo $hotel->nombre_hotel ?>
                                        </option>
                                    <?php endforeach;?>
                                </select>
                                <?php 
                                    echo form_error("hotel_id","<span class='help-block'>","</span>");
                                ?>
                            </div>

                            <div class="form-group <?php echo form_error("tipo_habitacion_id") != false ? 'has-error':'';?>">
                                <label for="tipo_habitacion_id">
                                    Tipo Habitación
                                </label>
                                <select name="tipo_habitacion_id" id="tipo_habitacion_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php foreach ($tipohabitaciones as $tipohabitacion) :?>
                                        <option value="<?php echo $tipohabitacion->id;?>" <?php echo set_select("tipo_habitacion_id",$tipohabitacion->id);?>>
                                            <?php echo $tipohabitacion->tipo_habitacion ?>
                                        </option>
                                    <?php endforeach;?>
                                </select>
                                <?php 
                                    echo form_error("tipo_habitacion_id","<span class='help-block'>","</span>");
                                ?>
                            </div>

                            <div class="form-group <?php echo form_error("acomodacion_id") != false ? 'has-error':'';?>">
                                <label for="acomodacion_id">
                                    Acomodación
                                </label>
                                <select name="acomodacion_id" id="acomodacion_id" class="form-control">
                                    <option value="">Seleccione...</option>


                                </select>
                                <?php 
                                    echo form_error("acomodacion_id","<span class='help-block'>","</span>");
                                ?>
                            </div>


                            <div class="form-group <?php echo form_error("cantidad") != false ? 'has-error':'';?>">
                                <label for="cantidad">Número de Habitaciones:</label>
                                <input type="text" class="form-control" id="cantidad" name="cantidad" value="<?php echo set_value("cantidad");?>">
                                <?php echo form_error("cantidad","<span class='help-block'>","</span>");?>
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-flat">
                                    Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div> <!-- /.box-body -->
        </div> <!-- /.box -->
    </section> <!-- /.content -->
</div> <!-- /.content-wrapper -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<script type="text/javascript">   
    $(document).ready(function() {                       
        $("#tipo_habitacion_id").change(function() {
            $("#tipo_habitacion_id option:selected").each(function() {
                tipo_habitacion_id = $('#tipo_habitacion_id').val();
                //alert(tipo_habitacion_id);
                $.post("<?php echo base_url(); ?>frontend/acomodaciones/fetch_single", {
                    tipo_habitacion_id : tipo_habitacion_id
                }, function(data) {
                    $("#acomodacion_id").html(data);
                });
            });
        });
    });
</script>



