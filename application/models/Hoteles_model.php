<?php
	class Hoteles_model extends CI_Model
	{
		function fetch_all()
		{
			// $this->db->order_by('id', 'DESC');
			// return $this->db->get('hoteles');

			$this->db->select("h.*,c.ciudad");
			$this->db->from("hoteles h");
			$this->db->join("ciudades c", "h.ciudad_id = c.id");
			$this->db->where("h.estado","1");
			return $this->db->get();
		}

		function insert_api($data)
		{
			$this->db->insert('hoteles', $data);
		}

		function fetch_single_hotel($hotel_id)
		{
			$this->db->where('id', $hotel_id);
			$query = $this->db->get('hoteles');
			return $query->result_array();
		}

		function update_api($hotel_id, $data)
		{
			$this->db->where('id', $hotel_id);
			$this->db->update('hoteles', $data);
		}

		function delete_single_user($hotel_id)
		{
			$this->db->where('id', $hotel_id);
			$this->db->delete('hoteles');
			if($this->db->affected_rows() > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}

?>