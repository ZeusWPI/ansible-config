server {
    listen 80;
    server_name dataset.12urenloop.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name dataset.12urenloop.be;

    ssl_certificate     /etc/ssl/private/12urenloop.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/12urenloop.be.pem;
    include snippets/ssl_options_preload.conf;

    location ~ /(.+)  {
        root /var/www/dataset;
        autoindex on;
    }
}
