# 安裝composer
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"  
# php composer-setup.php 
# php -r "unlink('composer-setup.php');"
# sudo mv composer.phar /usr/local/bin/composer

# 取得當前資料夾
path=`cd $(dirname $0);pwd -P`

if [ -d "$path/code" ]
then
	# mysql 需先建立好資料庫
	echo "laravel-admin"
	docker-compose up -d
	# cd code
	# php artisan admin:install
else
	# 建立laravel專案 php 7.4
	mkdir code
	composer create-project --prefer-dist laravel/laravel  "code" 6.*

	# # 安裝laravel-admin前置準備
	# cd code
	# composer require encore/laravel-admin
	# php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"

	# 複製.env 並在執行一次
	# cd ..
	cp .env.example code/.env
	cp Dockerfile code/Dockerfile
	docker-compose build
	docker-compose up -d
fi