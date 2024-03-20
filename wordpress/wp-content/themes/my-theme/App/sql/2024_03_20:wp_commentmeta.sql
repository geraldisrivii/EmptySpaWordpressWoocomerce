CREATE TABLE
    `wp_commentmeta` (
        `meta_id` bigint UNSIGNED NOT NULL,
        `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
        `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
        `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta` ADD PRIMARY KEY (`meta_id`),
ADD KEY `comment_id` (`comment_id`),
ADD KEY `meta_key` (`meta_key` (191));

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta` MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

COMMIT;