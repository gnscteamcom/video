DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `uid` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` int(11) NOT NULL,
  `expiry` int(11) NOT NULL
) DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `link` text NOT NULL,
  `embed` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `subtitle` text DEFAULT NULL,
  `preview` varchar(500) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT '3',
  `source` varchar(20) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `user` int(11) NOT NULL
) DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `loginlog`;
CREATE TABLE `loginlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `info` text NOT NULL,
  `datetime` datetime DEFAULT NULL
) DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `uid` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `added` int(11) NOT NULL
) DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` text DEFAULT NULL
) DEFAULT CHARSET=latin1;

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'url', 'WEBSITE_URL'),
(2, 'license', 'LICENSE_KEY'),
(3, 'embed_slug', 'embed'),
(4, 'download_slug', 'download'),
(5, 'logo', NULL),
(6, 'default_title', WEBSITE_TITLE),
(7, 'default_preview', '{ASSETS}/no-preview.png'),
(8, 'default_video', '{ASSETS}/no-video.mp4'),
(9, 'timezone', 'UTC'),
(10, 'page_limit', '15'),
(11, 'subtitle', 'on'),
(12, 'auto_cc', 'disable'),
(13, 'auto_preview', 'enable'),
(14, 'custom_preview', 'show'),
(15, 'embed_player', 'enable'),
(16, 'file_download', 'enable'),
(17, 'player', 'jcplayer'),
(18, 'jwp_key', NULL),
(19, 'about_text', 'JUICYCODES'),
(20, 'about_link', 'https://juicycodes.com'),
(21, 'width', '100%'),
(22, 'height', '100%'),
(23, 'aspect_ratio', '16:9'),
(24, 'player_controls', 'true'),
(25, 'autostart', 'false'),
(26, 'primary', 'html5'),
(27, 'font_size', '14'),
(28, 'font_color', '#ffffff'),
(29, 'font_family', 'Trebuchet MS, Sans Serif'),
(30, 'bg_color', NULL),
(31, 'share_btn', 'on'),
(32, 'dl_btn', 'on'),
(33, 'caching', 'on'),
(34, 'cache_expire', '3'),
(35, 'allowed_qualities', '1080p,720p,480p,360p'),
(36, 'quality_order', 'asc'),
(37, 'minify_html', 'enable'),
(38, 'encrypt_js', 'enable'),
(39, 'accs_restriction', 'disable'),
(40, 'allowed_domains', NULL),
(41, 'pop_ad', 'disable'),
(42, 'pop_ad_code', NULL),
(43, 'banner_ad', 'disable'),
(44, 'banner_ad_code', NULL),
(45, 'login_log', "enable"),
(46, 'blocked_countries', NULL),
(47, 'blocked_ips', NULL),
(48, 'rely', 'core'),
(49, 'chunk_size', '5');

DROP TABLE IF EXISTS `stats`;
CREATE TABLE `stats` (
  `date` date DEFAULT NULL,
  `views` int(11) NOT NULL
) DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `role` int(1) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `date` datetime DEFAULT NULL
) DEFAULT CHARSET=latin1;

ALTER TABLE `cache`
  ADD PRIMARY KEY (`uid`,`type`);

ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);
  
ALTER TABLE `loginlog`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `links`
  ADD PRIMARY KEY (`uid`);

ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `stats`
  ADD PRIMARY KEY (`date`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `loginlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
