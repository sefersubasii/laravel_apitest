<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\product;
use App\Products;
use App\Products_Stock;
use Illuminate\Http\Request;
use Picqer\Api\Client;
use Picqer\Api\PicqerWebhook;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // API üzerinden geleb veriler eklenir varsa eklemez. Yeni ise eklenir.
            $apiClient=new Client("fairweb","k2gHAyvpX6qVybd9WSVd3fIIZzWZWK9qwhgJZ0BnpkMja75i","19@d3mg!");
            $product=$apiClient->getAllProducts();

            foreach ($product["data"] as $data)
            {
                   $dataproduct=[
                       "idvatgroup" => $data["idvatgroup"],
                       "name"=>$data["name"],
                       "price"=>$data["price"],
                       "fixedstockprice"=>$data["fixedstockprice"],
                       "idsupplier"=>$data["idsupplier"],
                       "productcode"=>$data["productcode"],
                       "productcode_supplier"=>$data["productcode_supplier"],
                       "deliverytime"=>$data["deliverytime"],
                       "description"=>$data["description"],
                       "barcode"=>$data["barcode"],
                       "unlimitedstock"=>$data["unlimitedstock"],
                       "assembled" =>$data["assembled"],
                       "type" =>$data["type"],
                       "weight"=>$data["weight"],
                       "length"=>$data["length"],
                       "width"=>$data["width"],
                       "height"=>$data["height"],
                       "minimum_purchase_quantity"=>$data["minimum_purchase_quantity"],
                       "purchase_in_quantities_of"=>$data["purchase_in_quantities_of"],
                       "hs_code"=>$data["hs_code"],
                       "country_of_origin"=>$data["country_of_origin"],
                       "active"=>$data["active"],
                   ];
                      $id=Products::firstOrCreate($dataproduct)->id;

                      if ($id!=null)
                      {
                          foreach ($data["stock"] as $stockdata)
                          {
                              $datastocklist=[
                                  "idwarehouse" => $stockdata["idwarehouse"],
                                  "stock" => $stockdata["stock"],
                                  "product_Id"=>$id,
                                  "reserved"=>$stockdata["reserved"],
                                  "reservedbackorders"=>$stockdata["reservedbackorders"],
                                  "reservedpicklists"=>$stockdata["reservedpicklists"],
                                  "reservedallocations"=>$stockdata["reservedallocations"],
                                  "freestock"=>$stockdata["freestock"],
                              ];
                                    Products_Stock::create($datastocklist);
                          }
                      }
            }
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // veritabanına yeni eklenen ürünü Oluşturma
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(product $product)
    {
        //Okuma

        $apiClient=new Client("fairweb","k2gHAyvpX6qVybd9WSVd3fIIZzWZWK9qwhgJZ0BnpkMja75i","19@d3mg!");
        $product=$apiClient->getAllProducts();
        dd($product);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, product $product)
    {
        // Veritabanında değişiklikleri güncelleme
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(product $product)
    {
        //Veritabanında siline ürün Apiye Yansıtılması
    }
}
