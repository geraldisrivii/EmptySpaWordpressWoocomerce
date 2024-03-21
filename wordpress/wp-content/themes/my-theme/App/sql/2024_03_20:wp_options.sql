CREATE TABLE wp_options (
  option_id bigint UNSIGNED NOT NULL,
  option_name varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  option_value longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  autoload varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



ALTER TABLE wp_options
  ADD PRIMARY KEY (option_id),
  ADD UNIQUE KEY option_name (option_name),
  ADD KEY autoload (autoload);


ALTER TABLE wp_options
  MODIFY option_id bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=530;
