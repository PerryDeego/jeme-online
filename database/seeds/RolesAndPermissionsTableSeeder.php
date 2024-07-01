<?php

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RolesAndPermissionsTableSeeder extends Seeder
{
     /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // create permissions
        Permission::create(['name' => 'Edit Installations']);
        Permission::create(['name' => 'Delete Installations']);
        Permission::create(['name' => 'Create Installations']);

        // create roles and assign created permissions

        // this can be done as separate statements
        $role = Role::create(['name' => 'Construction']);
        $role->givePermissionTo(['Edit Installations', 'Delete Installations', 'Create Installations']);

        $role = Role::create(['name' => 'Super-admin']);
        $role->givePermissionTo(Permission::all());
    }
}