<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsStocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products__stocks', function (Blueprint $table) {
            $table->integer("idwarehouse");
            $table->integer('stock');
            $table->integer('product_Id')->unsigned();
            $table->integer('reserved')->default("0");
            $table->integer('reservedbackorders')->default("0");
            $table->integer('reservedpicklists')->default("0");
            $table->integer('reservedallocations')->default("0");
            $table->integer("freestock");
            $table->timestamp('failed_at')->useCurrent();
            $table->foreign("product_Id")->references("id")->on("products")->onDelete("cascade");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products__stocks');
    }
}
