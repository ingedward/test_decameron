<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
    	define('API_URL', base_url('backend/'));
		$this->load->model("Usuarios_model");
	}

	public function index()
	{
		if ($this->session->userdata("login")) 
		{
			redirect(base_url()."frontend/dashboard");
		}
		else
		{
			$this->load->view("admin/login");
		}
	}

	public function login()
	{
		$username = $this->input->post("username");
		$password = sha1($this->input->post("password"));

		$data  = array(
			'username' 		=> $username, 
			'password' 		=> $password, 
		);

		// $api_url = "http://localhost/jerp/decameron_ci/backend/usuarios/login";
		$api_url = API_URL . "usuarios/login";

		$client = curl_init($api_url);
		curl_setopt($client, CURLOPT_POST, true);
		curl_setopt($client, CURLOPT_POSTFIELDS, $data);
		curl_setopt($client, CURLOPT_RETURNTRANSFER, true);
		$response = curl_exec($client);
		curl_close($client);
		$usuario  = json_decode($response);

		if (empty($usuario)) 
		{
			$this->session->set_flashdata("error","El usuario y/o contraseña son incorrectos");
			redirect(base_url());
		}
		else
		{
			$data  = array(
				'id' 		=> $usuario->id, 
				'nombre' 	=> $usuario->nombres,
				'rol' 		=> $usuario->rol_id,
				'login' 	=> TRUE
			);
			$this->session->set_userdata($data);
			redirect(base_url()."frontend/dashboard");
		}
	}

	public function logout()
	{
		$this->session->sess_destroy();
		redirect(base_url());
	}
}
