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
         #proxy_pass http://cammie.kelder.zeus.ugent.be/;
         proxy_pass http://10.0.0.7/$1$is_args$args;
         add_header 'Access-Control-Allow-Origin' '*';
    }

    location ~ ^/webcam/(cgi/ptdc.cgi)$ {
         #proxy_pass http://cammie.kelder.zeus.ugent.be/;
         proxy_pass http://10.0.0.7/$1$is_args$args;
         expires off;
         add_header 'Access-Control-Allow-Origin' '*';
    }

    # Slotmachien
    location /slotmachien {
        proxy_pass http://10.0.1.5/slotmachien;
        add_header 'Access-Control-Allow-Origin' '*';
    }

    location /messages {
        proxy_pass http://10.0.0.5:5000/messages;
        add_header 'Access-Control-Allow-Origin' '*';
    }
}
