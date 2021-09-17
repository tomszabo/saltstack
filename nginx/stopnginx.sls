disable_nginx:
  service.dead:
    - enable: false
    - name: nginx
