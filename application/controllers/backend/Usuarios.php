<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Usuarios extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('usuarios_model');
		$this->load->library('form_validation');
	}


	
	function login()
	{
		if($this->input->post('username') && $this->input->post('password'))
		{
			$username 	= $this->input->post('username');
			$password 	= $this->input->post('password');
			$data = $this->usuarios_model->login($username,$password);
			echo json_encode($data);
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