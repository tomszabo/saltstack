include:
  - systemupdate.update

apache2:
  pkg.installed:
    - require:
      - cmd: ubuntu_update
  
apache2 Service:
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2
      
tune_apache:
  file.managed:
    - source: salt://apache/files/tune_apache.conf
    - name: /etc/apache2/conf-available/tune_apache.conf
    - require:
      - pkg: apache2
      
enable_tune_apache:
  apache_conf.enabled:
    - name: tune_apache
    - require:
      - pkg: apache2
      
index_file:
  file.managed:
    - source: salt://apache/files/index.html
    - name: /var/www/html/index.html
    - require:
      - apache2
      
