<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Hoteles <small>Nuevo</small>
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
                        <form action="<?php echo base_url();?>frontend/hoteles/store" method="POST">

                            <div class="form-group <?php echo form_error("nombre") != false ? 'has-error':'';?>">
                                <label for="nombre">Nombre Hotel:</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" value="<?php echo set_value("nombre");?>">
                                <?php echo form_error("nombre","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group <?php echo form_error("nit") != false ? 'has-error':'';?>">
                                <label for="nit">NIT Hotel:</label>
                                <input type="text" class="form-control" id="nit" name="nit" value="<?php echo set_value("nit");?>">
                                <?php echo form_error("nit","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group <?php echo form_error("ciudad_id") != false ? 'has-error':'';?>">
                                <label for="ciudad_id">
                                    Ciudad
                                </label>
                                <select name="ciudad_id" id="ciudad_id" class="form-control">
                                    <option value="">Seleccione...</option>
                                    <?php foreach ($ciudades as $ciudad) :?>
                                        <option value="<?php echo $ciudad->id;?>" <?php echo set_select("ciudad_id",$ciudad->id);?>>
                                            <?php echo $ciudad->ciudad ?>
                                        </option>
                                    <?php endforeach;?>
                                </select>
                                <?php echo form_error("ciudad_id","<span class='help-block'>","</span>");?>
                            </div>

                            <div class="form-group">
                                <label for="direccion">Direccion:</label>
                                <input type="text" class="form-control" id="direccion" name="direccion">
                            </div>

                            <div class="form-group">
                                <label for="telefono">Telefono:</label>
                                <input type="text" class="form-control" id="telefono" name="telefono">
                            </div>

                            <div class="form-group">
                                <label for="contacto">Nombre Contacto:</label>
                                <input type="text" class="form-control" id="contacto" name="contacto">
                            </div>

                            <div class="form-group <?php echo form_error("habitaciones") != false ? 'has-error':'';?>">
                                <label for="habitaciones">Número de Habitaciones:</label>
                                <input type="text" class="form-control" id="habitaciones" name="habitaciones" value="<?php echo set_value("habitaciones");?>">
                                <?php echo form_error("habitaciones","<span class='help-block'>","</span>");?>
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-flat">
                                    Guardar
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->
        </div>
        <!-- /.box -->
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
