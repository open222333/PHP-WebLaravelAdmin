# 安裝composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"  
php composer-setup.php 
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# 建立laravel專案
composer create-project --prefer-dist laravel/laravel  "code"

# 安裝laravel-admin
cd code
composer require encore/laravel-admin
php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"

# mysql 需先建立好資料庫
php artisan admin:install