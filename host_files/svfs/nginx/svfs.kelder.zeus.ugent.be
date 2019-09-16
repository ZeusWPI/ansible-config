upstream svfs {
  server localhost:4567;
  keepalive 32;
}

server {
  listen 80;
  server_name svfs.kelder.zeus.ugent.be;

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
    proxy_pass http://svfs;
  }
}
