<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acomodaciones extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	define('API_URL', base_url('backend/'));
	}


	public function fetch_single()
	{
		$tipo_habitacion_id	= $this->input->post("tipo_habitacion_id");
		$data  = array(
			'tipo_habitacion_id' => $tipo_habitacion_id 
		);

		$api_url = API_URL . "acomodaciones/fetch_single";
		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);

		$data  = array(
			'acomodaciones' => json_decode($response), 
		);

		$acomodaciones = json_decode($response);

		if($acomodaciones){
	        echo '<option value="0">Seleccionar...</option>';
	        foreach($acomodaciones as $fila)
	        {
	            echo '<option value="'. $fila->id .'">'. $fila->acomodacion .'</option>'; 
	        }
	    }  
        else 
        {
            echo '<option value="0">Seleccionar...</option>';
        }
	}

}