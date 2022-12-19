<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ciudades extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('ciudades_model');
	}

	function index()
	{
		$data = $this->ciudades_model->fetch_all();
		echo json_encode($data->result_array());
	}
}

?>