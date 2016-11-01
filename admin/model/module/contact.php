<?php
class ModelModuleContact extends Model {
    public function getContacts(){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "contact` ORDER BY ordering");
        return $query->rows;
    }
    public function setContact($data){
        if(isset($data['id'])){
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "contact` WHERE `id`=".$data['id']);
            if(count($query->rows) > 0) {
                $d = '';
                foreach ($data as $key => $value){
                    $d .= "`$key` = '$value', ";
                }
                $d = substr($d,0,-2);
                $id = $data['id'];
                $qq =  "UPDATE `pllcontact` SET $d WHERE `pllcontact`.`id` = $id;";
                $data['result'] = $this->db->query($qq);
            }
        }else{
            $cols = '';
            $rows = '';
            foreach ($data as $key => $value){
                $cols .= '`'.$key.'`,';
                $rows .= '\''.$value.'\',';
            }
            $cols = substr($cols,0,-1);
            $rows = substr($rows,0,-1);
            $qq =  "INSERT INTO `" . DB_PREFIX . "contact` ($cols) VALUES ($rows)";
            $data['qq'] = $qq;
            $data['result'] = $this->db->query($qq);
        }

        return $data;
    }

    public function deleteContact($id){
        return ['result'=>$this->db->query("DELETE FROM `pllcontact` WHERE `pllcontact`.`id` = $id")];
    }
}
