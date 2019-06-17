<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableProductLinking extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_linkings', function (Blueprint $table) {
            $table->increments('id_linking',250);
            $table->integer('id_product')->unsigned()->nullable();
            $table->integer('id_customer')->unsigned()->nullable();
            $table->timestamps();
        });

        Schema::table('product_linkings', function($table) {
            $table->foreign('id_product')->references('id')->on('products');
            $table->foreign('id_customer')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_linkings');
    }
}
