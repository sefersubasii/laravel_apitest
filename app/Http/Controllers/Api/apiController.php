<?php

namespace App\Http\Controllers\Api;

use App\Helper\ConnectKey;
use App\Http\Controllers\Controller;
use App\Products;
use App\Products_Stock;
use http\Env\Response;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Picqer\Api\Client;
use Psy\Util\Json;

class apiController extends Controller
{
    public function __construct()
    {
        $this->apiClient=ConnectKey::ApiKeyconnect();
    }
    public function index()
    {
        // API üzerinden geleb veriler eklenir varsa eklemez. Yeni ise eklenir.
        $status=array();
        $product=$this->apiClient->getAllProducts();
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
                    Products_Stock::firstOrCreate($datastocklist);
                }
            }
        }
        $status["message"]="API Veritabanı veriler eşleşti";
        $status["code"]=200;
        return json_encode($status);
    }
    public function create()
    {
        // Yeni eklenen Ürünlere API üzerinden senkron etme ve gösterme
        $datanewproduct=[
            "idvatgroup" => 11362,
            "name"=>"sefer deneme",
            "price"=>45.90,
            "fixedstockprice"=>0,
            "productcode"=>1638638060,
            "productcode_supplier"=>"",
            "description"=>"Deneme test",
            "barcode"=>9983762736270,
            "unlimitedstock"=>0,
            "assembled" =>0,
            "type" =>"normal",
            "weight"=>0,
            "length"=>0,
            "width"=>0,
            "height"=>0,
            "minimum_purchase_quantity"=>0,
            "purchase_in_quantities_of"=>0,
            "hs_code"=>"",
            "country_of_origin"=>"",
            "active"=>1,
        ];

            $id=Products::firstOrCreate($datanewproduct)->id;
            $lastaddproduct=Products::orderBy('created_at', 'desc')->first();

        $datastocklist[0]=[
            "idwarehouse" => 6621,
            "stock" => 21,
            "product_Id"=>$id,
            "reserved"=>5,
            "reservedbackorders"=>0,
            "reservedpicklists"=>0,
            "reservedallocations"=>0,
            "freestock"=>0,
        ];

        $datastocklist[1]=[
            "idwarehouse" => 5766,
            "stock" => 11,
            "product_Id"=>$id,
            "reserved"=>2,
            "reservedbackorders"=>0,
            "reservedpicklists"=>0,
            "reservedallocations"=>0,
            "freestock"=>0,
        ];

           if (sizeof($datastocklist)>0 && $id=$lastaddproduct["id"])
           {
               foreach ($datastocklist as $stocklistdata)
               {
                   //$control=Products_Stock::create($stocklistdata);
               }
           }

        $datanewproductapi=[
            "idvatgroup" => 11362,
            "name"=>"sefer deneme",
            "price"=>45.90,
            "fixedstockprice"=>0,
            "productcode"=>1638638060,
            "productcode_supplier"=>"",
            "description"=>"Deneme test",
            "barcode"=>9983762736270,
            "type" =>"normal",
            "weight"=>0,
            "length"=>0,
            "width"=>0,
            "height"=>0,
            "minimum_purchase_quantity"=>0,
            "purchase_in_quantities_of"=>0,
            "hs_code"=>"",
            "country_of_origin"=>"",
            "stock"=>$datastocklist,
        ];

         $this->apiClient->addProduct($datanewproductapi);

        $status["message"]="API yeni ürün veya ürünler eklendi";
        $status["Productlist"]=$datanewproductapi;
        $status["code"]=200;

        return json_encode($status);
    }
    public function show()
    {
        //API üzerinden gelen Veriler
        $product=$this->apiClient->getAllProducts();
        return response($product,200);
    }
    public function update($productcode,Products $products)
    {
        // Güncellenen Ürünlere API üzerinden senkron etme ve gösterme
        $product=$this->apiClient->getProductByProductcode($productcode);

        $data = [
            'name' => 'dx sefer'
        ];

        Products::where("productcode",$productcode)->update($data);

        $this->apiClient->updateProduct($product['data']['idproduct'], $data);

        $statu=$this->apiClient->updateProduct($product['data']['idproduct'], $data);

            if($statu["success"]==true)
            {
                return response(
                    [
                      'Product Code'=>$productcode,
                      'message'=>"Product kodlu Güncellendi"
                    ],201
                );
            }
            else
            {
                return response(
                    [
                        'Product Code'=>$productcode,
                        'message'=>"Product kodlu güncellenmedi Hata Oluştu"
                    ],402
                );
            }
    }
    public function delete($productcode,Products $products)
    {
        // Silinen Ürünlere API üzerinden senkron etme ve gösterme
        $product=$this->apiClient->getProductByProductcode($productcode);

        $dataproduct=Products::where("productcode",$productcode)->first();
        $productid=$dataproduct["id"];

        Products_Stock::where("product_id",$productid)->delete();
        Products::where("id",$productid)->delete();

        $this->apiClient->deleteProductPart($productid,$productcode);

        return response(
            [
                'Product Id'=>$productid,
                'message'=>"Product ID Silindi"
            ],201
        );
    }
    public function stockupdate($productid,Products $products)
    {
        // Veritabanından güncellediğinde API tarafında stok güncelleniyor.
        $productstockdata=Products_Stock::where("product_Id",$productid)->get();
        $productcode=Products::where("id",$productid)->first();

            foreach ($productstockdata as $key=>$productstockdatum)
            {
                $datastocklist[$key]=[
                    "stock" => $productstockdatum["stock"],
                ];
            }

            $data = [
                'stock' => $datastocklist,
            ];


          $product=$this->apiClient->getProductByProductcode($productcode["productcode"]);

          $statu=$this->apiClient->updateProduct($product['data']['idproduct'], $data);

                if($statu["success"]==true)
                {
                    return response(
                        [
                            'Product Code'=>$productcode,
                            'message'=>"Product kodlu ürün stoğu Güncellendi"
                        ],201
                    );
                }
                else
                {
                    return response(
                        [
                            'Product Code'=>$productcode,
                            'message'=>"Product kodlu ürün stoğu güncellenmedi  Hata Oluştu"
                        ],402
                    );
                }
        // Stok Güncellemesi yapılan ürüne API üzerinden senkron etme ve gösterme
    }
    public function productsingle($productcode)
    {
        $productsingle=$this->apiClient->getProductByProductcode($productcode);
        return response($productsingle,200);
    }
}
