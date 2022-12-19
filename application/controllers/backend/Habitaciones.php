<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Habitaciones extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('habitaciones_model');
		$this->load->model('hoteles_model');
		$this->load->library('form_validation');
	}

	function index()
	{
		$data = $this->habitaciones_model->fetch_all();
		echo json_encode($data->result_array());
	}

	function insert()
	{
		$hotel_id 			= $this->input->post("hotel_id");
		$tipo_habitacion_id = $this->input->post("tipo_habitacion_id");
		$acomodacion_id 	= $this->input->post("acomodacion_id");
		$cantidad 			= $this->input->post("cantidad");
        $cuartos_hotel		= $this->hoteles_model->fetch_single_hotel($hotel_id);
        $suma_cuartos		= $this->habitaciones_model->get_sumRooms_ByHotel($hotel_id);
        if($cuartos_hotel)
        {
			foreach($cuartos_hotel as $row)
			{
				$limite_cuartos		= $row['habitaciones'];
			}
        }

        if (($suma_cuartos + $cantidad) <= $limite_cuartos)
        {
			$this->form_validation->set_rules("hotel_id","Hotel","required");
			$this->form_validation->set_rules("tipo_habitacion_id","Tipo Habitación","required");
			$this->form_validation->set_rules("acomodacion_id","Acomodación","required");
			$this->form_validation->set_rules("cantidad","Número de Habitaciones","required");

			if($this->form_validation->run())
			{
				$data  = array(
					'cantidad' 			=> $cantidad,
					'hotel_id' 			=> $hotel_id, 
					'tipo_habitacion_id'=> $tipo_habitacion_id, 
					'acomodacion_id' 	=> $acomodacion_id,
				);

				$this->habitaciones_model->insert_api($data);
				$array = array(
					'error'			=> 'no',
					'hotel_id'		=> $hotel_id, 
					'msj'			=> ''
				);
			}
			else
			{
				$array = array(
					'error'			=>	'si',
					'hotel_id'		=>	form_error('hotel_id'),
					'msj'			=> validation_errors()
				);
			}
			echo json_encode($array);
		}
		else
		{
			$array = array(
				'error'			=>	'si',
				'hotel_id'		=>	form_error('hotel_id'),
				'msj'			=> 'Cantidad de cuartos excede lo permitido'
			);
			echo json_encode($array);
		}
	}
	
	function fetch_single()
	{
		if($this->input->post('habitacion_id'))
		{
			$data = $this->habitaciones_model->fetch_single($this->input->post('habitacion_id'));
			foreach($data as $row)
			{
				$output['id'] 					= $row['id'];
				$output['cantidad']				= $row['cantidad'];
				$output['hotel_id'] 			= $row['hotel_id'];
				$output['tipo_habitacion_id'] 	= $row['tipo_habitacion_id'];
				$output['acomodacion_id'] 		= $row['acomodacion_id'];
			}
			echo json_encode($output);
		}
	}

	function update()
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

		if($this->form_validation->run())
		{	
			$data  = array(
				'hotel_id' 			=> $hotel_id, 
				'tipo_habitacion_id'=> $tipo_habitacion_id, 
				'acomodacion_id' 	=> $acomodacion_id,
				'cantidad' 			=> $cantidad
			);
			$this->habitaciones_model->update_api($id, $data);
			$array = array(
				'error'			=> 'no',
				'habitacion_id'	=> $id, 
				'hotel_id' 		=> $hotel_id
			);
		}
		else
		{
			$array = array(
				'error'			=>	'si',
				'habitacion_id'	=>	form_error('id'),
				'hotel_id'		=>	form_error('hotel_id')
			);
		}
		echo json_encode($array);
	}

	function delete()
	{
		if($this->input->post('id'))
		{
			if($this->habitaciones_model->delete_single($this->input->post('id')))
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