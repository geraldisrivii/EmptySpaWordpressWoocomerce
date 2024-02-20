<?php

namespace App\Filters;

use \WP_REST_Request;
use \WP_REST_Response;

use App\Filters\Filter;


class RestApiFilter extends Filter
{

    public static function register()
    {
        $namespaceOfClass = self::class;

        add_filter('woocommerce_rest_check_permissions', "{$namespaceOfClass}::disable_ssl_verification_for_local_development", 10, 4);
    }

    public static function disable_ssl_verification_for_local_development($permission, $context, $object_id, $post_type)
    {
        if (!is_ssl()) {
            return true;
        }
        return $permission;
    }


}