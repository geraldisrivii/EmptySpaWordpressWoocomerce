<?php


define('MAIL_SETTINGS', [
    'mail_settings_dev' => [
        'host' => 'smtp.gmail.com',
        'auth' => true,
        'port' => 465,
        'username' => 'sasamaltsev981@gmail.com',
        'password' => 'rzdd nftp wqal vcxh',
        'secure' => 'ssl',
        'charset' => 'UTF-8',
        'from_email' => 'sasamaltsev981@gmail.com',
        'from_name' => 'Alexander Maltsev',
        'is_html' => true
    ],
    'mail_settings_prod' => [
        'host' => 'smtp.gmail.com',
        'auth' => true,
        'port' => 465,
        'username' => 'sasamaltsev981@gmail.com',
        'password' => 'rzdd nftp wqal vcxh',
        'secure' => 'ssl',
        'charset' => 'UTF-8',
        'from_email' => 'sasamaltsev981@gmail.com',
        'from_name' => 'Alexander Maltsev',
        'is_html' => true
    ],
]);

// for admin panel
define('GENERALY_SETTINGS_ID', 22);

define('PATHS_NAMES_ARRAY', [
    '/' => '558',
    '/katalog' => '868',
]);

define('WP_ENVIRONMENT_TYPE', 'local');

// For yookassa

define('SHOP_ID', '321321');
define('SHOP_KEY', 'test_VmUiqwqcRNY8Kqk03ipeMBwrUt6ZpVB_ZZMHGvL8jtY');
define('RETURNED_URL', 'http://localhost');


require_once get_template_directory() . '/vendor/autoload.php';

require_once (get_template_directory() . '/App/index.php');



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

