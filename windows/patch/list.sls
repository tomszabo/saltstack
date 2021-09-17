enable_bits:
  service.running:
    - name: enable_bits
    - enable: True
    
list_patches:
  module.run:
    - name: win_wua.list
