<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acomodaciones extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('acomodaciones_model');
	}

	function index()
	{
		$data = $this->acomodaciones_model->fetch_all();
		echo json_encode($data->result_array());
	}

	function fetch_single()
	{
		if($this->input->post('tipo_habitacion_id'))
		{
			$data = $this->acomodaciones_model->fetch_single($this->input->post('tipo_habitacion_id'));
			echo json_encode($data->result_array());
		}
	}


}



?>