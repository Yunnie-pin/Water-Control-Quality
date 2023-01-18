<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'module_id',
        'result'
    ];

    public function module(){
        return $this->hasOne(Module::class,'id','module_id');
    }
}
