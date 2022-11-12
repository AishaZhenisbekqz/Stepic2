sudo rm /etc/nginx/sites-enabled/test.conf
sudo ln -s /home/box/web/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo rm /etc/nginx/sites-enabled/default
sudo /etc/init.d/nginx restart

sudo ln -sf /home/box/web/etc/ask_conf.py /etc/gunicorn.d/ask_conf.py

sudo gunicorn -c /etc/gunicorn.d/ask_conf.py ask.wsgi:application

sudo /etc/init.d/mysql restart
mysql -u root -e "CREATE DATABASE qa CHARACTER SET utf8"
