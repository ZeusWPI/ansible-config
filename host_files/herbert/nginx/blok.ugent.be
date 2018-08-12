server {
    listen 80;

    server_name blok.ugent.be;
    root /home/blok/public/current/;
    index index.html;

    include snippets/letsencrypt.conf;
}

# Temporary turned off until dns is switched. When that's done, the http server
#  will need to be changed to a redirect

# server {
#     listen 443 ssl http2;
#     server_name blok.ugent.be blok;
#     root /home/blok/public/current/;
#     index index.html;
#
#     ####################
#     # SSL OPTIONS
#     ####################
#     include snippets/letsencrypt.conf;
#     include snippets/ssl_options.conf;
#     ssl_certificate /etc/letsencrypt/live/blok.ugent.be/fullchain.pem;
#     ssl_certificate_key /etc/letsencrypt/live/blok.ugent.be/privkey.pem;
#
#     ####################
#     # DEFAULT LOG PATHS
#     ####################
#
#     access_log /home/blok/log/access.log;
#     error_log  /home/blok/log/error.log notice;
#
#     rewrite_log on;
# }
