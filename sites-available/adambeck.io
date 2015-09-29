server {
	listen 80 default_server;
	listen [::]:80 default_server ipv6only=on;

	#root /usr/share/nginx/html;
	#index index.html index.htm;

	# Make site accessible from http://localhost/
  # server_name localhost;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		# try_files $uri $uri/ =404;
		# Uncomment to enable naxsi on this location
		# include /etc/nginx/naxsi.rules
    proxy_pass http://localnode:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    client_max_body_size 20m;
	}

  location /photos {
    root /;
  }
}