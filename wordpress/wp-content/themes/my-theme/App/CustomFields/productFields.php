<?php


use Carbon_Fields\Container;
use Carbon_Fields\Field;

add_action('carbon_fields_register_fields', 'crb_attach_product_options');
function crb_attach_product_options()
{
    Container::make('post_meta', 'product_options')->where('post_type', '=', 'product')
        ->add_tab('Главные настройки', [
            Field::make('text', 'crb_text', __('Text Field', 'my-theme'))->set_visible_in_rest_api(true),
            Field::make('image', 'crb_image', __('Image', 'my-theme'))
                ->set_visible_in_rest_api(true)
                ->set_value_type('url'),
        ]);
}
