server {
    listen  80; ## listen for ipv4
    listen  [::]:80 default ipv6only=on; ## listen for ipv6
    listen  443 default ssl;

    server_name .kelder.zeus.ugent.be .irc.zeus.ugent.be .zeusgw.ugent.be .endymion.ugent.be clarke;


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
    index index.php index.html;

    rewrite ^/$ https://zeus.ugent.be/ permanent;

    # Aliases
    location /alias {
        alias /var/www/alias;
    }

    # Webcam
    location /webcam/ {
         #proxy_pass http://cammie.kelder.zeus.ugent.be/;
         proxy_pass http://10.0.0.7/;
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
