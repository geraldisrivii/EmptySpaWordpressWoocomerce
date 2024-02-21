<?php

namespace App\Filters;

use \WP_REST_Request;
use \WP_REST_Response;

use App\Filters\Filter;


class ProductFilter extends Filter
{

    public static function register()
    {
        $namespaceOfClass = self::class;

        add_filter('woocommerce_rest_product_optimize', "{$namespaceOfClass}::optimize_filter", 10, 3);
        add_filter('woocommerce_rest_prepare_product_object', "{$namespaceOfClass}::optimize", 999, 3);
    }

    public static function optimize(WP_REST_Response $response, \WC_Product $post, WP_REST_Request $request)
    {
        if ($request->get_param('optimize')) {
            $response = apply_filters('woocommerce_rest_product_optimize', $response);
        }

        return $response;
    }

    public static function optimize_filter(WP_REST_Response $response)
    {
        $data = $response->get_data();

        unset($data['meta_data']);
        unset($data['related_ids']);
        unset($data['price_html']);
        unset($data['post_password']);

        $response->set_data($data);

        $linsk = $response->get_links();
        foreach ($linsk as $key => $link) {
            $response->remove_link($key);
        }

        return $response;
    }


}