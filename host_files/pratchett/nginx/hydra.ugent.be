server {
    listen 80;
    server_name hydra.ugent.be www.hydra.ugent.be;
    include snippets/letsencrypt.conf;

    return 302 https://$server_name$request_uri;
}

server {
    listen 10443 ssl http2;
    server_name hydra.ugent.be www.hydra.ugent.be;

    include snippets/letsencrypt.conf;
    include snippets/ssl_options_preload.conf;

    ssl_certificate /etc/ssl/private/hydra.ugent.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/hydra.ugent.be.key;

    location /api {
        add_header 'Access-Control-Allow-Origin' '*';
        alias /home/hydra/public/api/;
        autoindex on;
    }

    location / {
        alias /home/hydra/public/website/;
    }

    location /git {
        return 302 http://github.com/ZeusWPI/hydra;
    }

    location /androidbeta {
        return 302 https://play.google.com/apps/testing/be.ugent.zeus.hydra;
    }

    location /android {
        return 302 https://play.google.com/store/apps/details?id=be.ugent.zeus.hydra;
    }

    location /ios {
        return 302 https://itunes.apple.com/be/app/hydra/id602640924;
    }

    access_log /home/hydra/log/access.log;
    error_log  /home/hydra/log/error.log;
}
