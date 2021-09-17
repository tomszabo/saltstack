api_token:
  file.managed:
    - name: /var/keys
    - makedirs: True
    - show_changes: False
    - contents: {{ pillar['api_token'] }}
