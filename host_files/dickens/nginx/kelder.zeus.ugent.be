server {
    listen 80;
    server_name kelder.zeus.ugent.be zeusgw.ugent.be;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    # kelder.zeus.ugent.be irc.zeus.ugent.be zeusgw.ugent.be endymion.ugent.be
    # all point to here
    server_name kelder.zeus.ugent.be zeusgw.ugent.be;


    ###############
    # SSL OPTIONS #
    ###############

    include snippets/letsencrypt.conf;
    include snippets/ssl_options.conf;
    ssl_certificate /root/.acme.sh/kelder.zeus.ugent.be/fullchain.cer;
    ssl_certificate_key /root/.acme.sh/kelder.zeus.ugent.be/kelder.zeus.ugent.be.key;

    #############
    # LOCATIONS #
    #############

    root   /var/www;
    index index.html;

    rewrite ^/$ https://zeus.ugent.be/ permanent;

    # Aliases
    location /alias {
        alias /var/www/alias;
    }


    # Webcam
    location ~ ^/webcam/(video/mjpg.cgi)$ {
         # Cammie video stream
         proxy_pass http://10.0.0.7/$1$is_args$args;
    }

    location /webcam/cgi/ptdc.cgi {
        add_header 'Access-Control-Allow-Origin' '*';
        try_files /tmp/freeze_camera @cammie_movement;
    }

    location @cammie_movement {
         # Cammie movement commands
         proxy_pass http://10.0.0.7/cgi/ptdc.cgi$is_args$args;
         expires off;
    }

    # Slotmachien
    location /lockbot {
        proxy_pass http://10.0.1.5/;
    }

    location /messages {
        proxy_pass http://10.0.0.11:5000/messages;
        add_header 'Access-Control-Allow-Origin' '*';
    }

    location /kelderapi/ {
        proxy_pass http://10.0.0.8:5000/kelderapi/;
    }

    location /socket.io/ {
        proxy_redirect off;
        proxy_pass_request_headers on;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $http_host;
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_pass http://10.0.0.5:5000/socket.io/;
    }
}
