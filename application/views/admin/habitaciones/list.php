<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Habitaciones <small>Listado</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <a href="<?php echo base_url();?>frontend/habitaciones/add" class="btn btn-primary btn-flat">
                            <span class="fa fa-plus"></span> 
                            Agregar Habitación
                        </a>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-md-12">
                        <table id="example1" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Hotel</th>
                                    <th>Tipo Habitación</th>
                                    <th>Acomodación</th>
                                    <th>Cantidad</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if(!empty($habitaciones)):?>
                                    <?php foreach($habitaciones as $habitacion):?>
                                        <tr>
                                            <td><?php echo $habitacion->id;?></td>
                                            <td><?php echo $habitacion->nombre_hotel;?></td>
                                            <td><?php echo $habitacion->tipo_habitacion;?></td>
                                            <td><?php echo $habitacion->acomodacion;?></td>
                                            <td><?php echo $habitacion->cantidad;?></td>
                                            <?php $datahabitacion = $habitacion->id."*".$habitacion->nombre_hotel."*".$habitacion->tipo_habitacion."*".$habitacion->acomodacion."*".$habitacion->cantidad;?>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-view-habitacion" data-toggle="modal" data-target="#modal-default" value="<?php echo $datahabitacion?>">
                                                        <span class="fa fa-search"></span>
                                                    </button>
                                                    <a href="<?php echo base_url()?>frontend/habitaciones/edit/<?php echo $habitacion->id;?>" class="btn btn-warning">
                                                        <span class="fa fa-pencil"></span>
                                                    </a>
                                                    <a href="<?php echo base_url();?>frontend/habitaciones/delete/<?php echo $habitacion->id;?>" class="btn btn-danger btn-remove">
                                                        <span class="fa fa-remove"></span>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                    <?php endforeach;?>
                                <?php endif;?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div> <!-- /.box-body -->
        </div> <!-- /.box -->
    </section> <!-- /.content -->
</div> <!-- /.content-wrapper -->


<!-- Modal con la informacion del habitacion -->
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Información de la Habitación</h4>
            </div>
            <div class="modal-body">
            
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger pull-left" data-dismiss="modal">
                    Cerrar
                </button>
            </div>
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> <!-- /.modal -->

