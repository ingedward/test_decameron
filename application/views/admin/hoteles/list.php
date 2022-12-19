<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Hoteles
            <small>Listado</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="box box-solid">
            <div class="box-body">
                <div class="row">
                    <div class="col-md-12">
                        <a href="<?php echo base_url();?>frontend/hoteles/add" class="btn btn-primary btn-flat">
                            <span class="fa fa-plus"></span> 
                            Agregar Hotel
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
                                    <th>Nombre</th>
                                    <th>Nit</th>
                                    <th>Ciudad</th>
                                    <th>Dirección</th>
                                    <th>Habitaciones</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if(!empty($hoteles)):?>
                                    <?php foreach($hoteles as $hotel):?>
                                        <tr>
                                            <td><?php echo $hotel->id;?></td>
                                            <td><?php echo $hotel->nombre_hotel;?></td>
                                            <td><?php echo $hotel->nit;?></td>
                                            <td><?php echo $hotel->ciudad;?></td>
                                            <td><?php echo $hotel->direccion;?></td>
                                            <td><?php echo $hotel->habitaciones;?></td>
                                            <?php $datahotel = $hotel->id."*".$hotel->nombre_hotel."*".$hotel->nit."*".$hotel->ciudad."*".$hotel->direccion."*".$hotel->telefono."*".$hotel->contacto."*".$hotel->habitaciones;?>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button" class="btn btn-info btn-view-hotel" data-toggle="modal" data-target="#modal-default" value="<?php echo $datahotel?>">
                                                        <span class="fa fa-search"></span>
                                                    </button>
                                                    <a href="<?php echo base_url()?>frontend/hoteles/edit/<?php echo $hotel->id;?>" class="btn btn-warning">
                                                        <span class="fa fa-pencil"></span>
                                                    </a>
                                                    <a href="<?php echo base_url();?>frontend/hoteles/delete/<?php echo $hotel->id;?>" class="btn btn-danger btn-remove">
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


<!-- Modal con la informacion del hotel -->
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Informacion del Hotel</h4>
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

