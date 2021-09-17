nginx_install:
  pkg.installed:
    - name: nginx
    
nginx_restart_service:
  service.running:
    - name: nginx
    
configure_nginx_html:
  file.managed:
    - name: /var/www/html/index.html
    - source: salt://nginx/files/index.html
    - makedirs: True
    
restart_nginx:
  service.running:
    - name: nginx
    - watch:
      - file:  configure_nginx_html
