server {
    listen 80;
    server_name haldis.student.ugent.be food.student.ugent.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;

    include snippets/letsencrypt.conf;
}

server {
    listen 10443 ssl http2;
    server_name haldis.student.ugent.be food.student.ugent.be;
    
    include snippets/ssl_options_preload.conf;
    ssl_certificate     /etc/ssl/private/haldis.student.ugent.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/haldis.student.ugent.be.key;
    include snippets/letsencrypt.conf;

    return 404;
    rewrite_log on;
}
