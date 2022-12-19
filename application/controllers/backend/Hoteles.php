<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hoteles extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('hoteles_model');
		$this->load->library('form_validation');
	}

	function index()
	{
		$data = $this->hoteles_model->fetch_all();
		echo json_encode($data->result_array());
	}

	function insert()
	{
		$nombre 			= $this->input->post("nombre");
		$nit 				= $this->input->post("nit");
		$direccion 			= $this->input->post("direccion");
		$telefono 			= $this->input->post("telefono");
		$contacto 			= $this->input->post("contacto");
		$habitaciones 		= $this->input->post("habitaciones");
		$ciudad_id 			= $this->input->post("ciudad_id");


		$this->form_validation->set_rules("nombre","Nombre del Hotel","required|is_unique[hoteles.nombre_hotel]");
		$this->form_validation->set_rules("nit","Nit del Hotel","required");
		$this->form_validation->set_rules("ciudad_id","Ciudad","required");
		$this->form_validation->set_rules("habitaciones","Número de Habitaciones","required");

		if($this->form_validation->run())
		{
			$data  = array(
				'nombre_hotel'	=> $nombre, 
				'nit' 			=> $nit, 
				'direccion' 	=> $direccion,
				'telefono' 		=> $telefono,
				'contacto' 		=> $contacto,
				'habitaciones' 	=> $habitaciones,
				'estado' 		=> "1",
				'ciudad_id' 	=> $ciudad_id
			);

			$this->hoteles_model->insert_api($data);
			$array = array(
				'error'			=> 'no',
				'nombre_hotel'	=> $nombre, 
				'nit' 			=> $nit,
				'msj'			=> ''
			);
		}
		else
		{
			$array = array(
				'error'			=>	'si',
				'nombre_hotel'	=>	form_error('nombre'),
				'nit'			=>	form_error('nit'),
				'msj'			=> validation_errors()

			);
		}
		echo json_encode($array);
	}
	
	function fetch_single()
	{
		if($this->input->post('hotel_id'))
		{
			$data = $this->hoteles_model->fetch_single_hotel($this->input->post('hotel_id'));
			foreach($data as $row)
			{
				$output['id'] 			= $row['id'];
				$output['nit'] 			= $row['nit'];
				$output['nombre'] 		= $row['nombre_hotel'];
				$output['direccion'] 	= $row['direccion'];
				$output['telefono'] 	= $row['telefono'];
				$output['contacto'] 	= $row['contacto'];
				$output['habitaciones'] = $row['habitaciones'];
				$output['ciudad_id'] 	= $row['ciudad_id'];
			}
			echo json_encode($output);
		}
	}

	function update()
	{
		$id 				= $this->input->post("id");
		$nombre 			= $this->input->post("nombre");
		$nit 				= $this->input->post("nit");
		$direccion 			= $this->input->post("direccion");
		$telefono 			= $this->input->post("telefono");
		$contacto 			= $this->input->post("contacto");
		$habitaciones 		= $this->input->post("habitaciones");
		$ciudad_id 			= $this->input->post("ciudad_id");

		$this->form_validation->set_rules("id","ID del Hotel","required");
		$this->form_validation->set_rules("nombre","Nombre del Hotel","required");
		$this->form_validation->set_rules("nit","Nit del Hotel","required");
		$this->form_validation->set_rules("ciudad_id","Ciudad","required");
		$this->form_validation->set_rules("habitaciones","Número de Habitaciones","required");


		if($this->form_validation->run())
		{	
			$data  = array(
				'nombre_hotel'	=> $nombre, 
				'nit' 			=> $nit, 
				'direccion' 	=> $direccion,
				'telefono' 		=> $telefono,
				'contacto' 		=> $contacto,
				'habitaciones' 	=> $habitaciones,
				'ciudad_id' 	=> $ciudad_id
			);
			$this->hoteles_model->update_api($id, $data);
			$array = array(
				'error'			=> 'no',
				'nombre_hotel'	=> $nombre, 
				'nit' 			=> $nit
			);
		}
		else
		{
			$array = array(
				'error'			=>	'si',
				'nombre_hotel'	=>	form_error('nombre'),
				'nit'			=>	form_error('nit')
			);
		}
		echo json_encode($array);
	}

	function delete()
	{
		if($this->input->post('id'))
		{
			if($this->hoteles_model->delete_single_user($this->input->post('id')))
			{
				$array = array(
					'success'	=>	true
				);
			}
			else
			{
				$array = array(
					'error'		=>	true
				);
			}
			echo json_encode($array);
		}
	}

}


?>