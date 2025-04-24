upstream live-12urenloop {
    server localhost:4040;
    keepalive 32;
}

server {
    listen 80;
    server_name live.12urenloop.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name live.12urenloop.be;

    ssl_certificate     /etc/ssl/private/12urenloop.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/12urenloop.be.pem;

    # include snippets/ssl_options_preload.conf;

	### Manually include options_preload to disable X-Frame-Options
	include snippets/ssl_options_common.conf;

	# HSTS: lets a web site tell browsers that it should only be communicated with
	#       using HTTPS, instead of using HTTP.
	more_clear_headers Strict-Transport-Security;
	add_header Strict-Transport-Security 'max-age=31536000; includeSubDomains; preload';

	more_clear_headers Referrer-Policy X-XSS-Protection X-Frame-Options X-Content-Type-Options Expect-CT;

	add_header Referrer-Policy same-origin;
	add_header X-XSS-Protection "1; mode=block";
	add_header X-Content-Type-Options "nosniff";
	more_clear_headers X-Powered-By Server;

	add_header Permissions-Policy interest-cohort=();

  location / {
      client_max_body_size 50M;
      proxy_buffers 256 16k;
      proxy_buffer_size 16k;
      client_body_timeout 60;
      send_timeout 300;
      lingering_timeout 5;
      proxy_connect_timeout 90;
      proxy_send_timeout 300;
      proxy_read_timeout 90s;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header Host $host;
      proxy_pass http://live-12urenloop;
  }
}
