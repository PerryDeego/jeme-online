<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

//Importing laravel-permission models
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Session;
use Auth;

class PermissionController extends Controller
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
        $permissions = Permission::orderby('name', 'asc')->paginate(1000); //Get all permissions

        return view('permissions.index', compact('permissions'))->with('i', ($request->input('page', 1) - 1) * 1000); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = Role::get(); //Get all roles

        return view('permissions.create')->with('roles', $roles);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name'=>'required|max:50',
        ]);

        $name = $request['name'];
        $permission = new Permission();
        $permission->name = $name;
        $permission->created_by = Auth::user()->name;

        $roles = $request['roles'];

        $permission->save();

        if (!empty($request['roles'])) 
        { 
            //If one or more role is selected
            foreach ($roles as $role)
             {
                $r = Role::where('id', '=', $role)->firstOrFail(); //Match input role to db record

                $permission = Permission::where('name', '=', $name)->first(); //Match input //permission to db record
                $r->givePermissionTo($permission);
            }
        }

        return redirect()->route('permissions.index')->with('success_message', 'Permission'. $permission->name.' added!');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return redirect('permissions');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $permission = Permission::findOrFail($id);

        return view('permissions.edit', compact('permission'));
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
        $permission = Permission::findOrFail($id);
        $this->validate($request, [
            'name'=>'required|max:50',
        ]);
        $input = $request->all();
        $permission->modified_by = Auth::user()->name;
        $permission->fill($input)->save();

        return redirect()->route('permissions.index')->with('success_message', 'Permission'. $permission->name.' updated!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $permission = Permission::findOrFail($id);

        //Make it impossible to delete this specific permission    
        if ($permission->name == "Administer roles & permissions") 
        {
            return redirect()->route('permissions.index')
            ->with('success_message',
             'Cannot delete this Permission!');
        }

        $permission->delete();

        return redirect()->route('permissions.index')->with('success_message', 'Permission deleted!');
    }
}
