<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Hoteles extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->helper('url');
    	define('API_URL', base_url('backend/'));
	}

	public function index()
	{
		$api_url = API_URL . "hoteles";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		$data  = array(
			'hoteles' => json_decode($response), 
		);

		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/hoteles/list",$data);
		$this->load->view("layouts/footer");
	}

	public function add()
	{
		$api_url = API_URL . "ciudades";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		$data  = array(
			'ciudades' => json_decode($response), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/hoteles/add",$data);
		$this->load->view("layouts/footer");
	}


	public function store()
	{
		$nombre 			= $this->input->post("nombre");
		$nit 				= $this->input->post("nit");
		$direccion 			= $this->input->post("direccion");
		$telefono 			= $this->input->post("telefono");
		$contacto 			= $this->input->post("contacto");
		$habitaciones 		= $this->input->post("habitaciones");
		$ciudad_id 			= $this->input->post("ciudad_id");
		$this->form_validation->set_rules("nombre","Nombre del Hotel","required");
		$this->form_validation->set_rules("nit","Nit del Hotel","required");
		$this->form_validation->set_rules("ciudad_id","Ciudad","required");
		$this->form_validation->set_rules("habitaciones","Número de Habitaciones","required");
		if ($this->form_validation->run()) 
		{
			$data  = array(
				'nombre' 		=> $nombre, 
				'nit' 			=> $nit, 
				'direccion' 	=> $direccion,
				'telefono' 		=> $telefono,
				'contacto' 		=> $contacto,
				'habitaciones' 	=> $habitaciones,
				'estado' 		=> "1",
				'ciudad_id' 	=> $ciudad_id
			);
			$api_url = API_URL . "hoteles/insert";
			$client = curl_init($api_url);
			curl_setopt($client, CURLOPT_POST, true);
			curl_setopt($client, CURLOPT_POSTFIELDS, $data);
			curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($client);
			curl_close($client);
			$hotel  = json_decode($response);
			if($hotel->error=='no')
			{
				redirect(base_url()."frontend/hoteles");
			}
			else
			{
				$this->session->set_flashdata("error","No se pudo guardar la información" . $hotel->msj);
				redirect(base_url()."frontend/hoteles/add");
			}
		}
		else
		{
			$this->add();
		}
	}

	public function edit($id)
	{
		$hotel_id = $id;
		$data  = array(
			'hotel_id' 		=> $hotel_id 
		);
		$api_url = API_URL . "hoteles/fetch_single";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseHotel = curl_exec($client);
		curl_close($client);
		$api_url = API_URL . "ciudades";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseCiudades = curl_exec($client);
		curl_close($client);
		$data  = array(
			'hotel' 	=> json_decode($responseHotel), 
			'ciudades' 	=> json_decode($responseCiudades), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/hoteles/edit",$data);
		$this->load->view("layouts/footer");
	}


	public function update()
	{
		$id 			= $this->input->post("id");
		$nombre 		= $this->input->post("nombre");
		$nit 			= $this->input->post("nit");
		$direccion 		= $this->input->post("direccion");
		$telefono 		= $this->input->post("telefono");
		$contacto 		= $this->input->post("contacto");
		$habitaciones 	= $this->input->post("habitaciones");
		$ciudad_id 		= $this->input->post("ciudad_id");
		$this->form_validation->set_rules("id","ID del Hotel","required");
		$this->form_validation->set_rules("nombre","Nombre del Hotel","required");
		$this->form_validation->set_rules("nit","Nit del Hotel","required");
		$this->form_validation->set_rules("ciudad_id","Ciudad","required");
		$this->form_validation->set_rules("habitaciones","Número de Habitaciones","required");
		if ($this->form_validation->run()) 
		{
			$data  = array(
				'id' 			=> $id, 
				'nombre' 		=> $nombre, 
				'nit' 			=> $nit, 
				'direccion' 	=> $direccion,
				'telefono' 		=> $telefono,
				'contacto' 		=> $contacto,
				'habitaciones' 	=> $habitaciones,
				'estado' 		=> "1",
				'ciudad_id' 	=> $ciudad_id
			);
			$api_url = API_URL . "hoteles/update";
			$client = curl_init($api_url);
			curl_setopt($client, CURLOPT_POST, true);
			curl_setopt($client, CURLOPT_POSTFIELDS, $data);
			curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($client);
			curl_close($client);
			$hotel  = json_decode($response);

			if ($hotel->error=='no') 
			{
				redirect(base_url()."frontend/hoteles");
			}
			else
			{
				$this->session->set_flashdata("error","No se pudo actualizar la informacion");
				redirect(base_url()."frontend/hoteles/edit/".$id);
			}
		}
		else
		{
			$this->edit($id);
		}
	}

	public function delete($id)
	{
		$data  = array(
			'id' 		=> $id
		);
		$api_url = API_URL . "hoteles/delete";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		echo "frontend/hoteles";
	}
}