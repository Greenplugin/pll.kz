<?php
class ModelModuleContact extends Model {
    public function getContacts(){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "contact` ORDER BY ordering");
        return $query->rows;
    }
}
