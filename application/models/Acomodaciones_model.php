<?php
	class Acomodaciones_model extends CI_Model
	{
		function fetch_all()
		{
			$this->db->order_by('id', 'ASC');
			return $this->db->get('acomodaciones');
		}


		function fetch_single($tipo_habitacion_id)
		{
			if ($tipo_habitacion_id == 1) 
			{
				$condition = array('1', '2');
			}
			elseif($tipo_habitacion_id == 2)
			{
				$condition = array('3', '4');
			}
			elseif($tipo_habitacion_id == 3)
			{
				$condition = array('1','2','3');
			}

			$this->db->where_in('id', $condition);
			return $this->db->get('acomodaciones');

		}

	}

?>