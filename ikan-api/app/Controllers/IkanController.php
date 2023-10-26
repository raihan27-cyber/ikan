<?php
namespace App\Controllers;

use App\Models\MIkan;

class IkanController extends RestfulController{
    public function create(){
        $data = [
            'nama_ikan' => $this->request->getVar('nama'),
            'habitat_ikan' => $this->request->getVar('jenis'),
            'habitat_ikan' => $this->request->getVar('warna'),
            'habitat_ikan' => $this->request->getVar('habitat'),
        ];

        $model = new MIkan();
        $model->insert($data);
        $produk = $model->find($model->getInsertID());
        return $this->responseHasil(200,true,$ikan);
    }

    public function list(){
        $model = new MIkan();
        $ikan = $model->findAll();
        return $this->responseHasil(200, true, $ikan);
    }

    public function detail($id){
        $model = new MIkan();
        $ikan = $model->find($id);
        return $this->responseHasil(200, true, $ikan);
    }

    public function ubah($id){
        $data = [
            'nama_ikan' => $this->request->getVar('nama'),
            'habitat_ikan' => $this->request->getVar('jenis'),
            'habitat_ikan' => $this->request->getVar('warna'),
            'habitat_ikan' => $this->request->getVar('habitat'),
        ];

        $model = new MIkan();
        $model->update($id, $data);
        $ikan = $model->find($id);

        return $this->responseHasil(200, true, $ikan);
    }

    public function hapus($id){
        $model = new MIkan();
        $ikan = $model->delete($id);

        return $this->responseHasil(200,true,$ikan);
    }
}
?>