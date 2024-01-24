<?php

// use App\Http\Controllers\FrontendController;
use App\Http\Controllers\APIController;
use App\Http\Controllers\APIProfileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('userAuth:userAuth')->group(function() {
    Route::get('/user', function (Request $request) {
        return response()->json(['message' => "Welcome to User API | Book Exchange"]);
    });

    Route::controller(APIController::class)->group(function() {
        // Get
       
       
        // Post
        // http://127.0.0.1:8081/api/loginUser
        Route::post('/loginUser','loginUser');
        
        // http://127.0.0.1:8081/api/bookUploadSave
        Route::post('/bookUploadSave','bookUploadSave');

        // http://127.0.0.1:8081/api/profile/update/4
        Route::post('/profile/update/{bookid}','update');

        // http://127.0.0.1:8081/api/book/detail/savecommment/3
        Route:: post ('book/detail/savecommment/{id}', 'store');

        // http://127.0.0.1:8081/api/17/books/17/delete
        Route::post('/books/{id}/delete', 'destroy');


    });

});
Route::controller(APIProfileController::class)->group(function() {
        // http://127.0.0.1:8081/api/registerUser
        Route::post('/registerUser','registerUser');
        // http://127.0.0.1:8081/api/
        Route::get('/', 'home');
        // http://127.0.0.1:8081/api/user/bookDetail/{id}
        Route::get('/user/bookDetail/{id}', 'bookDetail');

});


// Route::middleware('adminAuth:adminAuth')->group(function() {
//     Route::get('/admin', function (Request $request) {
//         return response()->json(['message' => "Welcome to admin API | Book Exchange"]);
//     });
// });
