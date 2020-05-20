server {
    listen 80;
    server_name blokmap.be www.blokmap.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;

    include snippets/letsencrypt.conf;
}

server {
    listen 443 ssl http2;
    server_name blokmap.be www.blokmap.be;
    root /home/blok/public/current/;
    index index.html;

    ####################
    # SSL OPTIONS
    ####################
    include snippets/ssl_options_preload.conf;
    ssl_certificate     /root/.acme.sh/blokmap.be/fullchain.cer;
    ssl_certificate_key /root/.acme.sh/blokmap.be/blokmap.be.key;
    include snippets/letsencrypt.conf;

    ####################
    # DEFAULT LOG PATHS
    ####################

    access_log /home/blok/log_blokmap.be/access.log;
    error_log  /home/blok/log_blokmap.be/error.log notice;

    rewrite_log on;
}
