<?php
	class Ciudades_model extends CI_Model
	{
		function fetch_all()
		{
			$this->db->order_by('id', 'ASC');
			return $this->db->get('ciudades');
		}

	}

?>