server {
    listen 80;
    server_name docs.12urenloop.be;
    location / {
        return 302 https://github.com/12urenloop/docs.12urenloop;
    }
}

server {
    listen 443 ssl http2;
    server_name docs.12urenloop.be;

    ssl_certificate     /etc/ssl/private/12urenloop.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/12urenloop.be.pem;
    include snippets/ssl_options_preload.conf;

    location /  {
        return 302 https://github.com/12urenloop/docs.12urenloop;
    }
}
