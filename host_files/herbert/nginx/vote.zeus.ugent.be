upstream vote {
   server localhost:8001;
   keepalive 32;
}

server {
    listen 80;
    server_name vote.zeus.ugent.be;
    include snippets/letsencrypt.conf;

    if ($request_method = GET) {
        return 301 https://$server_name$request_uri;
    }

    return 308 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name vote.zeus.ugent.be;

    ssl_certificate     /root/.acme.sh/vote.zeus.ugent.be/fullchain.cer;
    ssl_certificate_key /root/.acme.sh/vote.zeus.ugent.be/vote.zeus.ugent.be.key;
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
       proxy_pass http://vote;
   }
}
