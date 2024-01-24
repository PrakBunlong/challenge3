<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Supervisor extends Model
{
    public function userList()
    {
        return $this->belongsTo(UserList::class, 'user_id', 'user_id');
    }
}
