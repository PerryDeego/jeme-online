<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServiceOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('service_orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('user_id'); 
            $table->unsignedInteger('order_no');
            $table->unsignedInteger('service_id');
            $table->unsignedInteger('building_id');
            $table->unsignedInteger('location_id');
            $table->unsignedInteger('machine_id');
            $table->date('date');
            $table->string('address');
            $table->string('charge_to');
            $table->string('customer');
            $table->string('no_of_person');
            $table->string('order_type');
            $table->string('taken_by');
            $table->string('status');
            $table->text('work_description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('service_orders');
    }
}
