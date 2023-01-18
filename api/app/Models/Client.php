<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'module',
        'result'
    ];

    /**
     * This will be called when fetching the element.
     */
    public function getModuleAttribute($value)
    {
        return $value;
    }

    /**
     * This will be called when storing/updating the element.
     */
    public function setModuleAttribute($value)
    {
        $this->attributes['module'] = (string)$value;
    }
}
