server {
    listen 80;
    server_name blok.ugent.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;

    include snippets/letsencrypt.conf;
}

server {
    listen 443 ssl http2;
    server_name blok.ugent.be;
    root /home/blok/public/current/;
    index index.html;

    ####################
    # SSL OPTIONS
    ####################
    include snippets/ssl_options_preload.conf;
    ssl_certificate     /root/.acme.sh/blok.ugent.be/fullchain.cer;
    ssl_certificate_key /root/.acme.sh/blok.ugent.be/blok.ugent.be.key;
    include snippets/letsencrypt.conf;

    ####################
    # DEFAULT LOG PATHS
    ####################

    access_log /home/blok/log/access.log;
    error_log  /home/blok/log/error.log notice;

    rewrite_log on;
}
