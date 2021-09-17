install_redis:
  pkg.installed:
    - name: redis
    
start_redis:
  service.running:
    - name: redis
