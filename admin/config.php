<?php
// HTTP
define('HTTP_SERVER', 'https://pll.kz/admin/');
define('HTTP_CATALOG', 'https://pll.kz/');

// HTTPS
define('HTTPS_SERVER', 'https://pll.kz/admin/');
define('HTTPS_CATALOG', 'https://pll.kz/');

// DIR
define('BASE_PATH', dirname(__DIR__));
define('DIR_APPLICATION', BASE_PATH.'/admin/');
define('DIR_SYSTEM', BASE_PATH.'/system/');
define('DIR_IMAGE', BASE_PATH.'/image/');
define('DIR_LANGUAGE', BASE_PATH.'/admin/language/');
define('DIR_TEMPLATE', BASE_PATH.'/admin/view/template/');
define('DIR_CONFIG', BASE_PATH.'/system/config/');
define('DIR_CACHE', BASE_PATH.'/system/storage/cache/');
define('DIR_DOWNLOAD', BASE_PATH.'/system/storage/download/');
define('DIR_LOGS', BASE_PATH.'/system/storage/logs/');
define('DIR_MODIFICATION', BASE_PATH.'/system/storage/modification/');
define('DIR_UPLOAD', BASE_PATH.'/system/storage/upload/');
define('DIR_CATALOG', BASE_PATH.'/catalog/');

// DB
define('DB_DRIVER', 'mpdo');
define('DB_HOSTNAME', 'srv-db-plesk14.ps.kz');
define('DB_USERNAME', 'pllkz_pll');
define('DB_PASSWORD', 'M5mto3%9');
define('DB_DATABASE', 'pllkz_pll');
define('DB_PORT', '3306');
define('DB_PREFIX', 'pll');
