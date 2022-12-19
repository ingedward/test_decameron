<?php
	class Tipohabitacion_model extends CI_Model
	{
		function fetch_all()
		{
			$this->db->order_by('id', 'ASC');
			return $this->db->get('tipo_habitacion');
		}

	}

?>