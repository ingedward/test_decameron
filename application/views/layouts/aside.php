<!-- Left side column. contains the sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">      
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MENÚ PRINCIPAL</li>
            <li>
                <a href="<?php echo base_url();?>frontend/dashboard">
                    <i class="fa fa-home"></i> 
                    <span>Inicio</span>
                </a>
            </li>

            <li>
                <a href="<?php echo base_url(); ?>frontend/hoteles">
                    <i class="fa fa-building"></i> 
                    <span>Hoteles</span>
                </a>
            </li>

            <li>
                <a href="<?php echo base_url(); ?>frontend/habitaciones">
                    <i class="fa fa-hotel"></i> 
                    <span>Habitaciones</span>
                </a>
            </li>

            <li>
                <a href="<?php echo base_url(); ?>auth/logout">
                    <i class="fa fa-power-off"></i> 
                    <span>Cerrar sesión</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>

