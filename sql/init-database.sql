CREATE DATABASE IF NOT EXISTS `groovy_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Flywaaydb user
DROP USER IF EXISTS `groovydbusr`@'127.0.0.1';
DROP USER IF EXISTS `groovydbusr`@'%';

CREATE USER `groovydbusr`@'127.0.0.1' IDENTIFIED BY 'NicePassword';
CREATE USER `groovydbusr`@'%' IDENTIFIED BY 'NicePassword';

GRANT ALL PRIVILEGES ON `groovy_db`.* to `groovydbusr`@'127.0.0.1';
GRANT ALL PRIVILEGES ON `groovy_db`.* to `groovydbusr`@'%';

FLUSH PRIVILEGES;

