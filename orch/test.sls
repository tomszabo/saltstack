{% set target = salt['pillar.get']('target',) %}
{% set comment = salt['pillar.get']('comment', 'No Comment') %}

test_runner:
  salt.runner:
    - name: test.arg
    - arg:
      - first
      - second
      - third
    - kwargs:
      one: this is the first kwarg
      two: this is the second kwarg
      three: this is the third kwarg
      
test_state:
  salt.state:
    - tgt: {{ target }}
    - sls:
      - mysql
    - test: True
    
test_function:
  salt.function:
    - tgt: {{ target }}
    - name: test.echo
    - arg:
      - '{{ comment }}'
