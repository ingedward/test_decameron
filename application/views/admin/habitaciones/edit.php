
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Habitación <small>Editar</small>
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
                        <form action="<?php echo base_url();?>frontend/habitaciones/update" method="POST">
                            <input type="hidden" name="id" id="id" value="<?php echo $habitacion->id;?>">

                            <div class="form-group <?php echo form_error("ciudad_id") != false ? 'has-error':'';?>">
                                <label for="hotel_id">Hotel</label>
                                <select name="hotel_id" id="hotel_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php if(form_error("hotel_id")!=false || set_value("hotel_id") != false): ?>
                                        <?php foreach ($hoteles as $hotel) :?>
                                            <option value="<?php echo $hotel->id;?>" <?php echo set_select("ciudad_id",$hotel->id);?>>
                                                <?php echo $hotel->nombre_hotel ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php else: ?>
                                        <?php foreach ($hoteles as $hotel) :?>
                                            <option value="<?php echo $hotel->id;?>" <?php echo $hotel->id == $habitacion->hotel_id ? 'selected':'';?>>
                                                <?php echo $hotel->nombre_hotel ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php endif;?>
                                </select>
                                <?php echo form_error("hotel_id","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group <?php echo form_error("tipo_habitacion_id") != false ? 'has-error':'';?>">
                                <label for="tipo_habitacion_id">Tipo de Habitación</label>
                                <select name="tipo_habitacion_id" id="tipo_habitacion_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php if(form_error("tipo_habitacion_id")!=false || set_value("tipo_habitacion_id") != false): ?>
                                        <?php foreach ($tipohabitaciones as $tipohabitacion) :?>
                                            <option value="<?php echo $tipohabitacion->id;?>" <?php echo set_select("tipo_habitacion_id",$tipohabitacion->id);?>>
                                                <?php echo $tipohabitacion->tipo_habitacion ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php else: ?>
                                        <?php foreach ($tipohabitaciones as $tipohabitacion) :?>
                                            <option value="<?php echo $tipohabitacion->id;?>" <?php echo $tipohabitacion->id == $habitacion->tipo_habitacion_id ? 'selected':'';?>>
                                                <?php echo $tipohabitacion->tipo_habitacion ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php endif;?>
                                </select>
                                <?php echo form_error("tipo_habitacion_id","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group <?php echo form_error("acomodacion_id") != false ? 'has-error':'';?>">
                                <label for="acomodacion_id">Acomodación</label>
                                <select name="acomodacion_id" id="acomodacion_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php if(form_error("acomodacion_id")!=false || set_value("acomodacion_id") != false): ?>
                                        <?php foreach ($acomodaciones as $acomodacion) :?>
                                            <option value="<?php echo $acomodacion->id;?>" <?php echo set_select("acomodacion_id",$acomodacion->id);?>>
                                                <?php echo $acomodacion->acomodacion ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php else: ?>
                                        <?php foreach ($acomodaciones as $acomodacion) :?>
                                            <option value="<?php echo $acomodacion->id;?>" <?php echo $acomodacion->id == $habitacion->acomodacion_id ? 'selected':'';?>>
                                                <?php echo $acomodacion->acomodacion ?>
                                            </option>
                                        <?php endforeach;?>
                                    <?php endif;?>
                                </select>
                                <?php echo form_error("acomodacion_id","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group <?php echo form_error("cantidad") != false ? 'has-error':'';?>">
                                <label for="cantidad">Número de Habitaciones:</label>
                                <input type="text" class="form-control" id="cantidad" name="cantidad" value="<?php echo form_error("cantidad") !=false ? set_value("cantidad") : $habitacion->cantidad;?>">
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

