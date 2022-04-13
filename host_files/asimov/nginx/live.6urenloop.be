server {
    listen 80;
    server_name live.6urenloop.be;

	return 404;

    #if ($request_method = GET) {
    #    return 301 https://$server_name$request_uri;
    #}
    #return 308 https://$server_name$request_uri;

    include snippets/letsencrypt.conf;
}

# server {
#     listen 443 ssl http2;
#     server_name live.6urenloop.be;
#
#     include snippets/letsencrypt.conf;
#     ssl_certificate     /etc/ssl/private/12urenloop.be.fullchain.pem;
#     ssl_certificate_key /etc/ssl/private/12urenloop.be.pem;
#     include snippets/ssl_options_preload.conf;
#     return 404;
# }
