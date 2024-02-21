<?php


use Carbon_Fields\Container;
use Carbon_Fields\Field;


add_action('carbon_fields_register_fields', 'crb_attach_theme_options');
function crb_attach_theme_options()
{
    Container::make('theme_options', __('Theme Options'))
        ->add_tab('Главные настройки', [
            Field::make('text', 'crb_text', __('Text Field', 'my-theme'))->set_visible_in_rest_api(true),
        ])
        ->add_tab('FAQ', [
            Field::make('complex', 'crb_faq', __('FAQ', 'my-theme'))->set_visible_in_rest_api(true)
                ->setup_labels(['plural_name' => __('FAQ', 'my-theme'), 'singular_name' => __('FAQ', 'my-theme')])
                ->set_collapsed(true)
                ->add_fields([
                    Field::make('text', 'question', __('Question', 'my-theme')),
                    Field::make('text', 'answer', __('Answer', 'my-theme')),
                ]),
        ]);
}
