--
-- Структура таблицы `wp_termmeta`
--
CREATE TABLE
    `wp_termmeta` (
        `meta_id` bigint UNSIGNED NOT NULL,
        `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
        `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
        `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_termmeta`
--
INSERT INTO
    `wp_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`)
VALUES
    (1, 15, 'product_count_product_cat', '1');

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta` ADD PRIMARY KEY (`meta_id`),
ADD KEY `term_id` (`term_id`),
ADD KEY `meta_key` (`meta_key` (191));

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `wp_termmeta`
--
ALTER TABLE `wp_termmeta` MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 2;

COMMIT;