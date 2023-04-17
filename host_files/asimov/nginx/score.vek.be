upstream zeusss {
    server localhost:6000;
    keepalive 32;
}

server {
    listen 80;
    server_name score.vek.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name score.vek.be;

    ssl_certificate     /etc/ssl/private/score.vek.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/score.vek.be.pem;
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
        proxy_pass http://zeusss;
    }

    location /admin {
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
        proxy_pass http://zeusss;

        auth_basic           "ZEUSSS";
        auth_basic_user_file /etc/nginx/zeusss.passwd;
    }

    location /api/admin {
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
        proxy_pass http://zeusss;

        auth_basic           "ZEUSSS";
        auth_basic_user_file /etc/nginx/zeusss.passwd;
    }
}
