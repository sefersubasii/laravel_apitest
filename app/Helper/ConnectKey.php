<?php

namespace App\Helper;

use Picqer\Api\Client;

class ConnectKey
{
    static function ApiKeyconnect()
    {
        $apiClient=new Client("fairweb","k2gHAyvpX6qVybd9WSVd3fIIZzWZWK9qwhgJZ0BnpkMja75i","19@d3mg!");
        return $apiClient;
    }
}
