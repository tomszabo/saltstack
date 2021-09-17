{% if data['cron']['running'] == False %}
start_service:
  local.service.start:
    - tgt: {{ data['id'] }}
    - arg:
      - cron
{% endif %}
