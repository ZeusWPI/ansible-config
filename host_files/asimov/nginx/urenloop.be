server {
    listen 80;
    server_name urenloop.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
  listen 443 ssl http2;
  server_name urenloop.be;

  ssl_certificate     /etc/ssl/private/urenloop.be.fullchain.pem;
  ssl_certificate_key /etc/ssl/private/urenloop.be.pem;


  add_header Permissions-Policy interest-cohort=();

  location / {
    root /var/www/html/urenloop.be;
  }
}
