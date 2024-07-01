<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use Auth;
use App\Models\User;
//Enables us to output flash messaging
use Session;

//Importing laravel-permission models
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class UserController extends Controller
{

    public function __construct() {
        $this->middleware(['auth', 'isAdmin']); //isAdmin middleware lets only users with a //specific permission permission to access these resources
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //Get all users and pass it to the view
        $users = User::orderby('name', 'asc')->paginate(1000); //Show only 10 items at a time in descending order.
        return view('users.index', compact('users'))->with('i', ($request->input('page', 1) - 1) * 1000); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //Get all roles and pass it to the view
        $roles = Role::get();
        return view('users.create', ['roles'=>$roles]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Validate name, email and password fields
        $this->validate($request, [
            'name'=>'required|max:120',
            'email'=>'required|email|unique:users',
            'password'=>'required|min:8|confirmed',
            'status' => 'required'
        ]);

        $user = new User();
        
        $user->created_by = Auth::user()->name;
        $user->name = $request['name'];
        $user->email = $request['email'];
        $user->password = $request['password'];
        $user->status = $request['status'];

        $log = $user->save();
        $roles = $request['roles']; //Retrieving the roles field

        //Checking if a role was selected
        if (isset($roles)) {

            foreach ($roles as $role) 
            {
                $role_r = Role::where('id', '=', $role)->firstOrFail();            
                $user->assignRole($role_r); //Assigning role to user
            }
        }  
        
        // Validate if User instance was created.
        if ($log) {
            return redirect()->route('users.index')->with('success_message', 'User successfully added.');
        } else {
            return redirect()->route('users.index')->with('error_message', 'Failed To create Usre!');
        }
    } 

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect('users'); 
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id); //Get user with specified id
        $roles = Role::get(); //Get all roles

        return view('users.edit', compact('user', 'roles')); //pass user and roles data to view
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id); //Get role specified by id

		//Validate name, email and password fields    
        $this->validate($request, [
            'name'=>'required|max:120',
            'email'=>'required|email|unique:users,email,'.$id,
            'status' => 'nullable'
        ]);
        $user->modified_by = Auth::user()->name;

        $input = $request->only(['name', 'email', 'status']); //Retreive the name, email and password fields
        $roles = $request['roles']; //Retreive all roles
        $user->fill($input)->save();

        if (isset($roles)) {        
            $user->roles()->sync($roles);  //If one or more role is selected associate user to roles          
        }        
        else {
            $user->roles()->detach(); //If no role is selected remove exisiting role associated to a user
        }

        return redirect()->route('users.index')->with('success_message', 'User successfully edited.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Find a user with a given id and delete
        $user = User::findOrFail($id); 
        $user->delete();

        return redirect()->route('users.index')->with('success_message', 'User successfully deleted.');
    }

    /**
     * Display a listing of the resource for search.
     *
     * @return \Illuminate\Http\Response
     */
	
    public function search(Request $request)
    {
       
		if($request->has('search')) {
            $search = $request->get('search');

            $roles = Role::get();

			$users = User::with('roles')->where('name', 'like', '%'.$search.'%')
            ->orWhere('email', 'like', '%'.$search.'%')
            ->orWhere('created_at', 'like', '%'.$search.'%')
            ->orWhere('status', 'like', '%'.$search.'%')
            ->paginate(10); //Show only 10 items.
            
        }
        
        if($users->count() > 0) {
            return view('users.index', compact('users'));
        }
        else{
            return redirect()->route('users.index')->with('success_message', 'No User exist with that details.');
        } //End else.
    }

}
