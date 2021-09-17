{% if grains.os_family == 'RedHat' %}
  {% set my_cfg = '/etc/myfile.conf' %}
{% elif grains.os_family == 'Debian' %}
  {% set my_cfg = '/etc/tmpfiles.d/myfile.conf' %}
{% endif %}

copy file:
  file.managed:
    - source: salt://myfile/files/myfile.conf
    - name: {{ my_cfg }}
