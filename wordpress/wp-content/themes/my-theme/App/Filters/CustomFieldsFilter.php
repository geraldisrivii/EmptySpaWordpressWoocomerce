<?php

namespace App\Filters;

use \WP_REST_Request;
use \WP_REST_Response;

use App\Filters\Filter;


class CustomFieldsFilter extends Filter
{

    public static function register()
    {
        $namespaceOfClass = self::class;

        add_filter('add_carbon_fields_to_response', "{$namespaceOfClass}::add_carbon_fields_to_response", 10, 2);
    }

    public static function add_carbon_fields_to_response(WP_REST_Response $response, \WC_Product $post)
    {
        $meta_fields = get_post_meta($post->get_id());

        $data = $response->get_data();

        if (empty($data['meta'])) {
            $data['meta'] = array();
        }

        foreach ($meta_fields as $key => $field) {
            // $data['meta'][$key] = $field;
            $field = carbon_get_post_meta($post->get_id(), substr($key, 1));
            if ($field) {
                $data['meta'][substr($key, 1)] = $field;
            }
        }

        $response->set_data($data);

        return $response;
    }


}