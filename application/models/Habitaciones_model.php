<?php
	class Habitaciones_model extends CI_Model
	{
		function fetch_all()
		{
			$this->db->select("hb.*,ht.nombre_hotel, th.tipo_habitacion, a.acomodacion");
			$this->db->from("habitaciones hb");
			$this->db->join("hoteles ht", "hb.hotel_id = ht.id");
			$this->db->join("tipo_habitacion th", "hb.tipo_habitacion_id = th.id");
			$this->db->join("acomodaciones a", "hb.acomodacion_id = a.id");
			return $this->db->get();
		}

		function insert_api($data)
		{
			$this->db->insert('habitaciones', $data);
		}

		function fetch_single($habitacion_id)
		{
			$this->db->where('id', $habitacion_id);
			$query = $this->db->get('habitaciones');
			return $query->result_array();
		}

		function update_api($hotel_id, $data)
		{
			$this->db->where('id', $hotel_id);
			$this->db->update('habitaciones', $data);
		}

		function get_sumRooms_ByHotel($hotel_id)
		{
			$this->db->select_sum('cantidad');
			$this->db->where('hotel_id', $hotel_id);
			$query = $this->db->get('habitaciones');
			return $query->row()->cantidad;
		}

		function delete_single($hotel_id)
		{
			$this->db->where('id', $hotel_id);
			$this->db->delete('habitaciones');
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