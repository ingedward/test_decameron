<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Habitaciones extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	define('API_URL', base_url('backend/'));
	}

	public function index()
	{
		$api_url = API_URL . "habitaciones";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		$data  = array(
			'habitaciones' => json_decode($response), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/habitaciones/list",$data);
		$this->load->view("layouts/footer");
	}

	public function add()
	{
		$api_url = API_URL . "hoteles";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseHoteles = curl_exec($client);
		curl_close($client);

		$api_url = API_URL . "tipohabitacion";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseTipos = curl_exec($client);
		curl_close($client);

		$api_url = API_URL . "acomodaciones";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseAcomodacion = curl_exec($client);
		curl_close($client);

		$data  = array(
			'hoteles' 			=> json_decode($responseHoteles), 
			'tipohabitaciones' 	=> json_decode($responseTipos), 
			'acomodaciones' 	=> json_decode($responseAcomodacion), 
		);
		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/habitaciones/add",$data);
		$this->load->view("layouts/footer");
	}


	public function store()
	{
		$hotel_id 			= $this->input->post("hotel_id");
		$tipo_habitacion_id	= $this->input->post("tipo_habitacion_id");
		$acomodacion_id 	= $this->input->post("acomodacion_id");
		$cantidad 			= $this->input->post("cantidad");

		$this->form_validation->set_rules("hotel_id","Hotel","required");
		$this->form_validation->set_rules("tipo_habitacion_id","Tipo Habitación","required");
		$this->form_validation->set_rules("acomodacion_id","Acomodación","required");
		$this->form_validation->set_rules("cantidad","Número de Habitaciones","required");

		if ($this->form_validation->run()) 
		{
			$data  = array(
				'hotel_id' 			=> $hotel_id, 
				'tipo_habitacion_id'=> $tipo_habitacion_id, 
				'acomodacion_id' 	=> $acomodacion_id,
				'cantidad' 			=> $cantidad
			);

			$api_url = API_URL . "habitaciones/insert";
			$client = curl_init($api_url);
			curl_setopt($client, CURLOPT_POST, true);
			curl_setopt($client, CURLOPT_POSTFIELDS, $data);
			curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($client);
			curl_close($client);
			$habitacion  = json_decode($response);

			if($habitacion->error=='no')
			{
				redirect(base_url()."frontend/habitaciones");
			}
			else
			{
				$this->session->set_flashdata("error","No fue posible guardar la información".$habitacion->msj);
				redirect(base_url()."frontend/habitaciones/add");
			}
		}
		else
		{
			$this->add();
		}
	}

	public function edit($id)
	{
		$habitacion_id = $id;
		$data  = array(
			'habitacion_id' => $habitacion_id 
		);

		$api_url = API_URL . "habitaciones/fetch_single";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseHabitacion = curl_exec($client);
		curl_close($client);

		$api_url = API_URL . "hoteles";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseHoteles = curl_exec($client);
		curl_close($client);


		$api_url = API_URL . "tipohabitacion";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseTipos = curl_exec($client);
		curl_close($client);

		$api_url = API_URL . "acomodaciones";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$responseAcomodacion = curl_exec($client);
		curl_close($client);

		$data  = array(
			'habitacion' 		=> json_decode($responseHabitacion), 
			'hoteles' 			=> json_decode($responseHoteles), 
			'tipohabitaciones' 	=> json_decode($responseTipos), 
			'acomodaciones' 	=> json_decode($responseAcomodacion), 
		);

		$this->load->view("layouts/header");
		$this->load->view("layouts/aside");
		$this->load->view("admin/habitaciones/edit",$data);
		$this->load->view("layouts/footer");
	}


	public function update()
	{
		$id 				= $this->input->post("id");
		$hotel_id 			= $this->input->post("hotel_id");
		$tipo_habitacion_id	= $this->input->post("tipo_habitacion_id");
		$acomodacion_id 	= $this->input->post("acomodacion_id");
		$cantidad 			= $this->input->post("cantidad");

		$this->form_validation->set_rules("id","ID de la Habitación","required");
		$this->form_validation->set_rules("hotel_id","Hotel","required");
		$this->form_validation->set_rules("tipo_habitacion_id","Tipo Habitación","required");
		$this->form_validation->set_rules("acomodacion_id","Acomodación","required");
		$this->form_validation->set_rules("cantidad","Número de Habitaciones","required");

		if ($this->form_validation->run()) 
		{
			$data  = array(
				'id' 				=> $id, 
				'hotel_id' 			=> $hotel_id, 
				'tipo_habitacion_id'=> $tipo_habitacion_id, 
				'acomodacion_id' 	=> $acomodacion_id,
				'cantidad' 			=> $cantidad
			);

			$api_url = API_URL . "habitaciones/update";
			$client = curl_init($api_url);
			curl_setopt($client, CURLOPT_POST, true);
			curl_setopt($client, CURLOPT_POSTFIELDS, $data);
			curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($client);
			curl_close($client);
			$habitacion  = json_decode($response);

			if ($habitacion->error=='no') 
			{
				redirect(base_url()."frontend/habitaciones");
			}
			else
			{
				$this->session->set_flashdata("error","No se pudo actualizar la informacion");
				redirect(base_url()."frontend/habitaciones/edit/".$id);
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
		$api_url = API_URL . "habitaciones/delete";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		echo "frontend/habitaciones";
	}
}