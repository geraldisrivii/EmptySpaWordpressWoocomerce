CREATE TABLE `wp_actionscheduler_actions` (
  `action_id` bigint UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scheduled_date_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime DEFAULT '0000-00-00 00:00:00',
  `priority` tinyint UNSIGNED NOT NULL DEFAULT '10',
  `args` varchar(191) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_520_ci,
  `group_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `attempts` int NOT NULL DEFAULT '0',
  `last_attempt_gmt` datetime DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Дамп данных таблицы `wp_actionscheduler_actions`
--

-- INSERT INTO `wp_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `priority`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
-- (6, 'action_scheduler/migration_hook', 'pending', '2024-02-20 03:20:45', '2024-02-20 03:20:45', 10, '[]', 'O:30:ActionScheduler_SimpleSchedule:2:{s:22:0*0scheduled_timestamp;i:1708399245;s:41:0ActionScheduler_SimpleSchedule0timestamp;i:1708399245;}', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
-- (7, 'woocommerce_cleanup_draft_orders', 'pending', '2024-02-20 03:19:47', '2024-02-20 03:19:47', 10, '[]', 'O:32:\"ActionScheduler_IntervalSchedule\":5:{s:22:\"\0*\0scheduled_timestamp\";i:1708399187;s:18:\"\0*\0first_timestamp\";i:1708399187;s:13:\"\0*\0recurrence\";i:86400;s:49:\"\0ActionScheduler_IntervalSchedule\0start_timestamp\";i:1708399187;s:53:\"\0ActionScheduler_IntervalSchedule\0interval_in_seconds\";i:86400;}', 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
-- (8, 'woocommerce_admin/stored_state_setup_for_products/async/run_remote_notifications', 'pending', '2024-02-20 12:09:42', '2024-02-20 12:09:42', 10, '[]', 'O:28:\"ActionScheduler_NullSchedule\":0:{}', 2, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL),
-- (9, 'woocommerce_run_product_attribute_lookup_update_callback', 'pending', '2024-02-20 12:09:43', '2024-02-20 12:09:43', 10, '[25,2]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1708430983;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1708430983;}', 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id_status_scheduled_date_gmt` (`claim_id`,`status`,`scheduled_date_gmt`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `wp_actionscheduler_actions`
--
ALTER TABLE `wp_actionscheduler_actions`
  MODIFY `action_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;
