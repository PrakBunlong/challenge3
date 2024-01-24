<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookGenres extends Model
{
    use HasFactory;

    protected $table = 'books_genres';

    protected $fillable = [
        'book_id',
        'genre_id'
    ];

    public function genre_name() {
        // id is the primary key of the genres table, genre_id is the foreign key of the book_genres table
        return $this->hasOne(Genres::class, 'id', 'genre_id');
    }
}
