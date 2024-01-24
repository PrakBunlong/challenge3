<?php

namespace App\Http\Controllers;
use App\Models\User;
use App\Models\Books;
use App\Models\Genres;
use GuzzleHttp\Client;
use App\Models\Comment;
use App\Models\BookGenres;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class APIProfileController extends Controller
{
    public function home(Request $request)
    {
        // dd($request);
        $query = $request->query('searchQuery');
        $genresQuery = $request->query('genres');
        // dd($genresQuery);
        $sortDesc = $request->query('sortDesc');
    
        $user = Auth::user() ;
    
        if ($genresQuery) {
            $books = Books::where('title', 'like', '%' . $query . '%')
                ->whereHas('genres', function ($query) use ($genresQuery) {
                    $query->where('genre_id', $genresQuery);
                });
        } else {
            $books = Books::where('title', 'like', '%' . $query . '%');
        }
    
        if ($sortDesc == true) {
            $books = $books->orderBy('title', 'desc');
        }
        elseif ($sortDesc == false){
            $books = $books->orderBy('title', 'asc');
        }
    
        $books = $books->get();
        $genres = Genres::get();
    
        return response()->json([
            'books' => $books,
            'genres' => $genres,
            'genresQuery' => $genresQuery,
            'user' => $user,
            'sortDesc' => $sortDesc
        ], 200);
    }
    public function registerUser(Request $request)
    {
        $createUser = User::create([
            'username' => $request->input('username'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'password' => $request->input('password')
        ]);

        do {
            $token = Str::random(80);
        } while (User::where('api_token', $token)->first());

        User::where('id', $createUser->id)->update([
            'api_token' => $token
        ]);


        if ($createUser) {
            // return redirect()->route('login');
            return response()->json([
                'message' => 'User created successfully'
            ], 200);
        } else {
            // return redirect()->back();
            return response()->json([
                'message' => 'User created failed'
            ], 401);
        }
    }
    public function bookDetail($id)
    {
        $book = Books::with("comments.user",'user', 'genres.genre_name')->where('id', $id)->first();
        // return response()->json($book);
        // return view('bookDetail', [
        //     'book' => $book,
        // ]);
        return response()->json([
            'book' => $book,
        ]);
    }
}
