<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Userpro extends Model
{
    protected $table = 'user_profile';
    protected $fillable = [
        'user_id',
        'name',
        'age',
        'address',
        'email',
        'phone_number',
        'password',
        'gender',
        'province',
    ];
}
