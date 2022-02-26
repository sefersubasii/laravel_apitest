<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments("id");
            $table->integer('idvatgroup');
            $table->string('name');
            $table->float('price');
            $table->float("fixedstockprice")->nullable();
            $table->integer("idsupplier")->nullable();
            $table->string("productcode");
            $table->string("productcode_supplier")->nullable();
            $table->integer("deliverytime")->nullable();
            $table->text("description")->nullable();
            $table->string("barcode")->nullable();
            $table->boolean("unlimitedstock");
            $table->boolean("assembled");
            $table->string("type")->nullable();
            $table->integer("weight")->nullable();
            $table->integer("length")->nullable();
            $table->integer("width")->nullable();
            $table->integer("height")->nullable();
            $table->integer("minimum_purchase_quantity")->nullable();
            $table->integer("purchase_in_quantities_of")->nullable();
            $table->string("hs_code")->nullable();
            $table->string("country_of_origin")->nullable();
            $table->boolean("active")->default("1");
            $table->integer("idfulfilment_customer")->nullable();
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
        Schema::dropIfExists('products');
    }
}
