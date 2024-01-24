<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBanneds extends Model
{
    use HasFactory;
    protected $fillable = ['user_img', 'name', 'address', 'phone_number', 'posted_book_img'];
}
