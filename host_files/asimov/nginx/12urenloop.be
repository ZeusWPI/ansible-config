upstream 12urenloop-site {
   server localhost:8080;
   keepalive 32;
}

server {
    listen 80;
    server_name 12urenloop.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name 12urenloop.be;

    ssl_certificate     /etc/ssl/private/12urenloop.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/12urenloop.be.pem;
    include snippets/ssl_options_preload.conf;

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
        proxy_pass http://12urenloop-site;
    }
}
