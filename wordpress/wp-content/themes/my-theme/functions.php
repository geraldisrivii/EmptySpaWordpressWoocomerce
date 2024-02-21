<?php


require_once get_template_directory() . '/vendor/autoload.php';

require_once(get_template_directory() . '/App/index.php');


function my_theme_setup()
{
    load_theme_textdomain('my-theme', get_template_directory() . '/languages');
}
add_action('after_setup_theme', 'my_theme_setup');



add_filter('redirect_canonical', 'disable_woocommerce_redirect_canonical');
function disable_woocommerce_redirect_canonical($redirect_url)
{
    return false;
}


add_action('after_setup_theme', 'crb_load');
function crb_load()
{
    \Carbon_Fields\Carbon_Fields::boot();
}
