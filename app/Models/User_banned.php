<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class User_banned extends Model
{    use HasFactory;
    protected $table = 'user_banned';
    protected $fillable = [
        'image',
        'id',
     'name',
      'email',
       'phone',
        // 'posted_book_img',
    ];

   
}
