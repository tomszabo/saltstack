copy_reactor:
  file.managed:
    - name: /etc/salt/master.d/reactor.conf
    - source: salt://reactor/reactor.conf
    
restart_master:
  service.running:
    - name: salt-master
    - watch:
      - copy_reactor
