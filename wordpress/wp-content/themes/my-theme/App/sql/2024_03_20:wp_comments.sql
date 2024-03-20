CREATE TABLE
    `wp_comments` (
        `comment_ID` bigint UNSIGNED NOT NULL,
        `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
        `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
        `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
        `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
        `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
        `comment_karma` int NOT NULL DEFAULT '0',
        `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
        `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
        `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
        `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
        `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_comments`
--
INSERT INTO
    `wp_comments` (
        `comment_ID`,
        `comment_post_ID`,
        `comment_author`,
        `comment_author_email`,
        `comment_author_url`,
        `comment_author_IP`,
        `comment_date`,
        `comment_date_gmt`,
        `comment_content`,
        `comment_karma`,
        `comment_approved`,
        `comment_agent`,
        `comment_type`,
        `comment_parent`,
        `user_id`
    )
VALUES
    (
        1,
        1,
        'A WordPress Commenter',
        'wapuu@wordpress.example',
        'https://wordpress.org/',
        '',
        '2024-02-20 03:17:11',
        '2024-02-20 03:17:11',
        'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.',
        0,
        '1',
        '',
        'comment',
        0,
        0
    );

--
-- Индексы сохранённых таблиц
--
--
-- Индексы таблицы `wp_comments`
--
ALTER TABLE `wp_comments` ADD PRIMARY KEY (`comment_ID`),
ADD KEY `comment_post_ID` (`comment_post_ID`),
ADD KEY `comment_approved_date_gmt` (`comment_approved`, `comment_date_gmt`),
ADD KEY `comment_date_gmt` (`comment_date_gmt`),
ADD KEY `comment_parent` (`comment_parent`),
ADD KEY `comment_author_email` (`comment_author_email` (10)),
ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--
--
-- AUTO_INCREMENT для таблицы `wp_comments`
--
ALTER TABLE `wp_comments` MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
AUTO_INCREMENT = 2;

COMMIT;