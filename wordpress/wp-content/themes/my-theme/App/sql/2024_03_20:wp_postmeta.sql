--
-- Структура таблицы `wp_postmeta`
--
CREATE TABLE
    `wp_postmeta` (
        `meta_id` bigint UNSIGNED NOT NULL,
        `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
        `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
        `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_postmeta`
--
INSERT INTO
    `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
    (1, 2, '_wp_page_template', 'default'),
    (2, 3, '_wp_page_template', 'default'),
    (
        3,
        5,
        '_wp_attached_file',
        'woocommerce-placeholder.png'
    ),
    (
        4,
        5,
        '_wp_attachment_metadata',
        'a:8:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:8:\"filesize\";i:102644;s:5:\"sizes\";a:4:{s:6:\"medium\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:10659;}s:5:\"large\";a:5:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:80210;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:3738;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:48652;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"dominant_color\";s:6:\"fafbfb\";s:16:\"has_transparency\";b:0;}'
    ),
    (5, 3, '_wp_trash_meta_status', 'draft'),
    (6, 3, '_wp_trash_meta_time', '1708401366'),
    (7, 3, '_wp_desired_post_slug', 'privacy-policy'),
    (8, 2, '_wp_trash_meta_status', 'publish'),
    (9, 2, '_wp_trash_meta_time', '1708401367'),
    (10, 2, '_wp_desired_post_slug', 'sample-page'),
    (11, 7, '_wp_trash_meta_status', 'publish'),
    (12, 7, '_wp_trash_meta_time', '1708401368'),
    (13, 7, '_wp_desired_post_slug', 'cart'),
    (14, 6, '_wp_trash_meta_status', 'publish'),
    (15, 6, '_wp_trash_meta_time', '1708401370'),
    (16, 6, '_wp_desired_post_slug', 'shop'),
    (17, 9, '_wp_trash_meta_status', 'publish'),
    (18, 9, '_wp_trash_meta_time', '1708401371'),
    (19, 9, '_wp_desired_post_slug', 'my-account'),
    (20, 8, '_wp_trash_meta_status', 'publish'),
    (21, 8, '_wp_trash_meta_time', '1708401372'),
    (22, 8, '_wp_desired_post_slug', 'checkout'),
    (23, 10, '_wp_trash_meta_status', 'draft'),
    (24, 10, '_wp_trash_meta_time', '1708401373'),
    (25, 10, '_wp_desired_post_slug', 'refund_returns'),
    (26, 18, '_edit_lock', '1708401232:1'),
    (27, 19, '_edit_lock', '1708401235:1'),
    (28, 20, '_edit_lock', '1708401241:1'),
    (29, 21, '_edit_lock', '1708401398:1'),
    (30, 22, '_edit_lock', '1708431944:1'),
    (31, 24, '_edit_lock', '1708401325:1'),
    (32, 25, '_edit_last', '1'),
    (33, 25, '_edit_lock', '1708517695:1'),
    (34, 25, 'total_sales', '0'),
    (35, 25, '_tax_status', 'taxable'),
    (36, 25, '_tax_class', ''),
    (37, 25, '_manage_stock', 'no'),
    (38, 25, '_backorders', 'no'),
    (39, 25, '_sold_individually', 'no'),
    (40, 25, '_virtual', 'no'),
    (41, 25, '_downloadable', 'no'),
    (42, 25, '_download_limit', '-1'),
    (43, 25, '_download_expiry', '-1'),
    (44, 25, '_stock', NULL),
    (45, 25, '_stock_status', 'instock'),
    (46, 25, '_wc_average_rating', '0'),
    (47, 25, '_wc_review_count', '0'),
    (48, 25, '_product_version', '8.3.1'),
    (49, 25, '_price', '1000'),
    (50, 22, '_edit_last', '1'),
    (51, 22, '_crb_text', 'dsdsad'),
    (52, 22, '_crb_faq|||0|value', '_'),
    (53, 22, '_crb_faq|||1|value', '_'),
    (
        54,
        22,
        '_crb_faq|question|0|0|value',
        'dsfdsfdsf'
    ),
    (55, 22, '_crb_faq|answer|0|0|value', 'dfsdfdsf'),
    (
        56,
        22,
        '_crb_faq|question|1|0|value',
        'dsfdsfdsf'
    ),
    (57, 22, '_crb_faq|answer|1|0|value', 'dfsdfdsf'),
    (58, 23, '_crb_text', 'dsdsad'),
    (59, 23, '_crb_faq|||0|value', '_'),
    (60, 23, '_crb_faq|||1|value', '_'),
    (
        61,
        23,
        '_crb_faq|question|0|0|value',
        'dsfdsfdsf'
    ),
    (62, 23, '_crb_faq|answer|0|0|value', 'dfsdfdsf'),
    (
        63,
        23,
        '_crb_faq|question|1|0|value',
        'dsfdsfdsf'
    ),
    (64, 23, '_crb_faq|answer|1|0|value', 'dfsdfdsf'),
    (
        66,
        27,
        '_wp_attached_file',
        '2024/02/Резюме-scaled.webp'
    ),
    (
        67,
        27,
        '_wp_attachment_metadata',
        'a:10:{s:5:\"width\";i:1941;s:6:\"height\";i:2560;s:4:\"file\";s:32:\"2024/02/Резюме-scaled.webp\";s:8:\"filesize\";i:197994;s:5:\"sizes\";a:9:{s:6:\"medium\";a:6:{s:4:\"file\";s:25:\"Резюме-227x300.webp\";s:5:\"width\";i:227;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:10186;s:7:\"sources\";a:1:{s:10:\"image/webp\";a:2:{s:4:\"file\";s:25:\"Резюме-227x300.webp\";s:8:\"filesize\";i:10186;}}}s:5:\"large\";a:6:{s:4:\"file\";s:26:\"Резюме-776x1024.webp\";s:5:\"width\";i:776;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:68942;s:7:\"sources\";a:1:{s:10:\"image/webp\";a:2:{s:4:\"file\";s:26:\"Резюме-776x1024.webp\";s:8:\"filesize\";i:68942;}}}s:9:\"thumbnail\";a:6:{s:4:\"file\";s:25:\"Резюме-150x150.webp\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:4166;s:7:\"sources\";a:1:{s:10:\"image/webp\";a:2:{s:4:\"file\";s:25:\"Резюме-150x150.webp\";s:8:\"filesize\";i:4166;}}}s:12:\"medium_large\";a:6:{s:4:\"file\";s:26:\"Резюме-768x1013.webp\";s:5:\"width\";i:768;s:6:\"height\";i:1013;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:67548;s:7:\"sources\";a:1:{s:10:\"image/webp\";a:2:{s:4:\"file\";s:26:\"Резюме-768x1013.webp\";s:8:\"filesize\";i:67548;}}}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:27:\"Резюме-1165x1536.webp\";s:5:\"width\";i:1165;s:6:\"height\";i:1536;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:112284;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:27:\"Резюме-1553x2048.webp\";s:5:\"width\";i:1553;s:6:\"height\";i:2048;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:154520;}s:21:\"woocommerce_thumbnail\";a:6:{s:4:\"file\";s:25:\"Резюме-300x300.webp\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:13896;s:9:\"uncropped\";b:0;}s:18:\"woocommerce_single\";a:5:{s:4:\"file\";s:25:\"Резюме-600x791.webp\";s:5:\"width\";i:600;s:6:\"height\";i:791;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:48288;}s:29:\"woocommerce_gallery_thumbnail\";a:5:{s:4:\"file\";s:25:\"Резюме-100x100.webp\";s:5:\"width\";i:100;s:6:\"height\";i:100;s:9:\"mime-type\";s:10:\"image/webp\";s:8:\"filesize\";i:2100;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:16:\"Резюме.jpg\";s:14:\"dominant_color\";s:6:\"cdd2cd\";s:16:\"has_transparency\";b:0;s:7:\"sources\";a:1:{s:10:\"image/jpeg\";a:2:{s:4:\"file\";s:24:\"Резюме-scaled.webp\";s:8:\"filesize\";i:197994;}}}'
    ),
    (70, 25, '_crb_text', 'dfdfdsfds'),
    (
        71,
        25,
        '_crb_image',
        'http://localhost/wp-content/uploads/2024/02/Резюме-scaled.webp'
    );

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta` ADD PRIMARY KEY (`meta_id`),
ADD KEY `post_id` (`post_id`),
ADD KEY `meta_key` (`meta_key` (191));

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `wp_postmeta`
--
ALTER TABLE `wp_postmeta` MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 72;

COMMIT;