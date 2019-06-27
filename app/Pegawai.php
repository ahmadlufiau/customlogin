<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Pegawai extends Authenticatable
{
    use Notifiable;

    protected $table = 'pegawai';

    protected $primaryKey = 'id_pegawai';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'nip', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function roles()
    {
        return $this->belongsToMany('App\Role', 'pegawai_role', 'pegawai_id', 'role_id');
    }

    public function hasAnyRole($roles)
    {
        if (is_array($roles)) {
            foreach ($roles as $role) {
                if ($this->hasRole($role)) {
                    return $true;
                }
            }
        } else {
            if ($this->hasRole($roles)) {
                return $true;
            }
        }
        return false;
    }

    public function hasRole($role)
    {
        if ($this->roles()->where('nama_role', $role)->first()) {
            return true;
        }
        return false;
    }

    public function isPic()
    {
        if ($this->roles()->where('nama_role', 'pic')->first()) {
            return true;
        }
        return false;
    }

    public function isPimpinan()
    {
        if ($this->roles()->where('nama_role', 'pimpinan')->first()) {
            return true;
        }
        return false;
    }
}
