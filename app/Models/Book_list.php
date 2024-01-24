<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Book_list extends Model
{
    protected $table = 'books';

    protected $fillable = [
        'id' ,
        
        'cover_img',
        'title',
        'author', 
         'location',
      
       'description', 
        'user_id' ,
      
     
    ];
}
