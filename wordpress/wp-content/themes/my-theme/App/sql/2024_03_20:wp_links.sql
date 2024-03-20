CREATE TABLE
    `wp_links` (
        `link_id` bigint UNSIGNED NOT NULL,
        `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
        `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
        `link_rating` int NOT NULL DEFAULT '0',
        `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
        `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
        `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `wp_links`
--
ALTER TABLE `wp_links` ADD PRIMARY KEY (`link_id`),
ADD KEY `link_visible` (`link_visible`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `wp_links`
--
ALTER TABLE `wp_links` MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

COMMIT;