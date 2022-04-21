server {
    listen 80;
    server_name event.student.ugent.be events.student.ugent.be gandalf.student.ugent.be;

    if ($request_method = GET) {
        return 301 https://event.student.ugent.be$request_uri;
    }

    return 308 https://event.student.ugent.be$request_uri;

    include snippets/letsencrypt.conf;
}

server {
    listen 10443 ssl http2;
    server_name events.student.ugent.be gandalf.student.ugent.be;
    
    include snippets/ssl_options_preload.conf;
ssl_certificate     /etc/ssl/private/gandalf.student.ugent.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/gandalf.student.ugent.be.key;
    include snippets/letsencrypt.conf;
    return 308 https://event.student.ugent.be$request_uri;
}

upstream gandalf {
    server localhost:3003;
    keepalive 300;
}

server {
    listen 10443 ssl http2;
    server_name event.student.ugent.be;
    
    include snippets/ssl_options_preload.conf;
    ssl_certificate     /etc/ssl/private/gandalf.student.ugent.be.fullchain.pem;
    ssl_certificate_key /etc/ssl/private/gandalf.student.ugent.be.key;
    include snippets/letsencrypt.conf;

    location / {
      proxy_http_version 1.1;
      
      # set header for proxy protocol
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      
      # setup for image upload
      client_max_body_size 8192m;
      
      # adjust proxy buffer setting
      proxy_buffers 8 32k; 
      proxy_buffer_size 32k; 
      proxy_busy_buffers_size 64k;

      proxy_max_temp_file_size 8192m;
      
      proxy_read_timeout 300;
      proxy_connect_timeout 300;
      proxy_pass http://gandalf;
    }
    rewrite_log on;
}
