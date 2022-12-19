<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tipohabitacion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('tipohabitacion_model');
	}

	function index()
	{
		$data = $this->tipohabitacion_model->fetch_all();
		echo json_encode($data->result_array());
	}
}

?>