<?php
namespace App\Models;

use CodeIgniter\Model;

class MIkan extends Model{
    protected $table = 'ikan';
    protected $primaryKey = 'id';
    protected $allowedFields = ['nama', 'jenis', 'warna', 'habitat'];
}
?>