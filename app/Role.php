<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //
    protected $table = 'roles';

    protected $primaryKey = 'id_role';

    public function users()
    {
        return $this->belongsToMany('App\Pegawai', 'pegawai_role', 'role_id', 'pegawai_id');
    }
}
