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

class APIController extends Controller
{
    protected $userData;

    public function __construct(Request $request)
    {
        // This check is for fetching data from api using api_token
        if ($request->header('Authorization')) {
            $api_token = $request->header('Authorization');

            $user = User::where('api_token', $api_token)->first();

            if ($user) {
                $this->userData = $user;
            }
        }
    }

    public function uploadToImgur($image)
    {
        $client_id = env('IMGUR_CLIENT_ID');

        // https://stackoverflow.com/questions/63060351/how-to-upload-images-to-imgur-using-laravel
        // upload image to imgur api to my account
        $client = new Client;
        $response = $client->request('POST', 'https://api.imgur.com/3/image', [
            'headers' => [
                'authorization' => 'Client-ID ' . $client_id,
                // if we want to store the image to our account
                // 'authorization' => 'Bearer '. env('IMGUR_ACCESS_TOKEN'),
                'content-type' => 'application/x-www-form-urlencoded',
            ],
            'form_params' => [
                'image' => base64_encode(file_get_contents($image)),
            ],
        ]);

        // get link
        return json_decode($response->getBody()->getContents())->data->link;
    }

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

    public function upload()
    {
        $genres = Genres::get();
        // return view('upload', [
        //     'genres' => $genres,
        // ]);
        return response()->json([
            'genres' => $genres,
        ]);
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

        public function loginUser(Request $request)
    {
        Auth::attempt([
            'email' => $request->input('email'),
            'password' => $request->input('password')
        ]);

        if (Auth::check()) {
            if (Auth::user()->is_banned == 1) {
                Auth::logout();
                return response()->json(['success' => false, 'message' => 'Your account has been banned']);
            }

            do {
                $token = Str::random(80);
            } while (User::where('api_token', $token)->first());

            User::where('id', Auth::user()->id)->update([
                'api_token' => $token
            ]);

            return response()->json(['success' => true, 'message' => 'User logged in successfully', 'api_token' => $token]);
        } else {
            return response()->json(['success' => false, 'message' => 'Failed to log in user']);
        }
    }


    public function bookUploadSave(Request $request)
    {
       
        // check if user is logged in before process the request
        // if (Auth::check()) {
        if ($this->userData) {
            $cover_url = $this->uploadToImgur($request->file('cover_img'));

            $createBook = Books::create([
                'title' => $request->input('title'),
                'author' => $request->input('author'),
                'description' => $request->input('description'),
                'cover_img' => $cover_url,
                // 'user_id' => Auth::user()->id,
                'user_id' => $this->userData->id,
                'location' => $request->input('location'),
            ]);

            if ($createBook) {
                foreach ($request->input('genres') as $genre_id) {
                    $saveGenres = BookGenres::create([
                        'book_id' => $createBook->id,
                        'genre_id' => $genre_id
                    ]);
                }
            }

            if ($saveGenres && $createBook) {
                return response()->json(['success' => true, 'message' => 'Book Upload successfully']);
            } else {
                return response()->json(['fail' => true, 'message' => 'Book Upload fail']);
            }
        }
    }

    public function update(Request $request, $book_id)
    {
        
        $update_data =
            [
                'title' => $request->input('title'),
                'author' => $request->input('author'),
                'description' => $request->input('description'),
                'location' => $request->input('location')
            ];

        if ($request->has("cover_img")) {
            $update_data["cover_img"] = $this->uploadToImgur($request->file('cover_img'));
        }

    
        $save_update = Books::where([["id", $book_id], ["user_id", $this->userData->id]])->update($update_data);
        if ($save_update) {
            if ($request->has("genres")) {
                $delete_book_genres = BookGenres::where("book_id", $book_id)->delete();

                if (count($request->input("genres")) > 0) {
                    foreach ($request->input('genres') as $genre_id) {
                        $saveGenres = BookGenres::create([
                            'book_id' => $book_id,
                            'genre_id' => $genre_id
                        ]);
                    }

                    return response()->json(['success' => true, 'message' => 'Book Update successfully']);
                }
            }
        }
        return response()->json(['fail' => true, 'message' => 'Book Update fail']);
    }
    public function store(Request $request, $bookid)
    {
        if ($this->userData) {
            $comment = new Comment;
            $comment->user_id = $this->userData->id;
            $comment->book_id = $bookid;
            $comment->comment = $request->input('comment');
            $comment->save();

            return response()->json(['success' => true, 'message' => 'Comment Upload successfully']);
        }
        return response()->json(['fail' => true, 'message' => 'Comment Upload fail']);
    }

        public function destroy($id)
    {
        $user = Auth::User();
        $book = Books::where('user_id', $this->userData->id)->findOrfail($id);

        $book->delete();

        return response()->json(['success' => 'Book deleted successfully'], 200);
    }

    
}
