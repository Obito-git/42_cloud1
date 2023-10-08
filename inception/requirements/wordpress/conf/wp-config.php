<?php
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define("DB_NAME", getenv("DB_DATABASE_NAME"));

/** MySQL database username */
define("DB_USER", getenv("DB_USER"));

/** MySQL database password */
define("DB_PASSWORD", getenv("DB_PASSWORD"));

/** MySQL hostname */
define("DB_HOST", getenv("WORDPRESS_DB_HOST") . ":3306");

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/** https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'd&Nm=xH2!tMjxvubiHG-MM~in>1wm~+qp0jOdwtxhN/C(,=j0M&.ei?a*oa`c0du');
define('SECURE_AUTH_KEY',  'M3k?J9C#7FN_MB1?#m|82B7S>dt/`ytf{I)1>{iRxfz80 x+> /_4|(Jv=SpGY/Q');
define('LOGGED_IN_KEY',    '*Y5-3vJHfD*LjioJDO*ZjU2b6G@?/{3XNB{zf`:VD),upPRI=WtcYx-.qoh42JDf');
define('NONCE_KEY',        't7AaOY|)g97EDnZPsC?v[O5O+*kkBLUziuxxf|RdR{V+GB|Wp&ZW7c(kz[&<%ft<');
define('AUTH_SALT',        '8Wc(t]ITr#lJ?C ;0y$V;{~z} b%GoFJIbjvPa? ]9Xl!~o3MVP(cBR<c*GI,=;z');
define('SECURE_AUTH_SALT', 'ct2359T@wd&}v~ qtDqr-39+XU]c-cDx e+bEBW$gu<YYcHbHe.R.sT(vNA*J`%&');
define('LOGGED_IN_SALT',   '7g.pqw.P|v7:j]=T$+HzKvXb@tt.8,C]1%|<m2*mKaGL_w*wVO6ewC:@fO9L@/3M');
define('NONCE_SALT',       'cyan4gC`ev[7*/CN#E$}Dtyc}*6W+8*tSO-w4o{YKQax,I~l_<?-1 cj4AHlOVA!');
define("CONCATENATE_SCRIPTS",	false);

$table_prefix  = 'wp_';
define("WP_DEBUG", true);
if (!defined("ABSPATH"))
	define("ABSPATH", __DIR__ . "/");

require_once ABSPATH . "wp-settings.php";
/* That's all, stop editing! Happy blogging. */
