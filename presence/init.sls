######################################################
# Name: presence/init.sls
#
# Description: Install status beacon
#
# verified OS: CentOS 6.5, 7, Ubuntu 14.04
#
# usage:
# salt \* state.sls presence
#
######################################################
{% set status_beacon_interval = salt['pillar.get']('status-beacon-interval', '600') %}

######################################################
# Make sure the beacon modules are on the minion
# 
###################################################### 
sync-modules:
  module.run:
    - name: saltutil.sync_beacons
    - refresh: True

######################################################
# Make sure the beacon modules are on the minion for older versions
# 
###################################################### 
{% if salt['test.version']() < '2016.9.0' %}
status_beacon:
  file.managed:
    - source: salt://_beacons/status.py
    - name: {{grains['saltpath']}}/beacons/status.py
    - require_in:
      - beacon: status
{% endif %}

######################################################
# set the beacon to update every XX seconds
# 
###################################################### 
status:
  beacon.present:
    - interval: {{ status_beacon_interval }}

######################################################
# save the beacon settings
# 
###################################################### 
beacons.save:
  module.run:
    - require:
      - beacon: status
