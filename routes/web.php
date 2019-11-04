<?php

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/welcome', function () {
    return view('welcome');
});

Auth::routes(['register'=>false]); //Auth routes except register

//Route active users to Admin dashboard.
Route::post('login', [
    'uses' => 'Auth\LoginController@login',
    'middleware' => 'checkstatus',
]);

//Route::get('/', 'HomeController@index')->name('home');

Route::get('/', 'DashboardController@index')->name('dashboard');

Route::post('dashboard.addEvent', 'DashboardController@addEvent');

Route::resource('buildings', 'BuildingController');

Route::resource('charges', 'ChargeController');

Route::resource('events', 'EventController');

Route::resource('faults', 'FaultController');

Route::resource('locations', 'LocationController');

Route::resource('installations', 'InstallationController');

Route::resource('machine-numbers', 'MachineNumberController');

Route::resource('permissions', 'PermissionController');

Route::get('/profile', 'ProfileController@index');

Route::resource('roles', 'RoleController');

Route::resource('service-orders', 'ServiceOrderController');

Route::get('service-orders.index', 'ServiceOrderController@export');

Route::resource('service-numbers', 'ServiceNumberController');

Route::resource('users', 'UserController');
Route::get('users.index', 'UserController@search');


Route::get('list','ServiceOrderController@list');
Route::get('get-building-list','ServiceOrderController@getBuildingList');
Route::get('get-machine-list','ServiceOrderController@getMachineList');
Route::get('get-location-list','ServiceOrderController@getLocationList');



/* Create default Admin.
    Used in browser to give role & permission to current user create_role_permission.
*/
/*
Route::get('/create_role_permission', function(){
    $role = Role::create(['name' => 'Super-admin']);
    $permission = Permission::create(['name' => 'Super-admin roles & permissions']);
    auth()->user()->assignRole('Super-admin');
    auth()->user()->givePermissionTo('Super-admin roles & permissions');
}); 

Route::get('/create_role_permission', function(){
    $role = Role::create(['name' => 'Super-admin']);
    auth()->user()->assignRole('Super-admin');
    auth()->user()->givePermissionTo(Permission::all());
});
*/
