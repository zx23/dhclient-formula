{% from "dhclient/map.jinja" import dhclient with context %}

dhclient.conf:
  file.managed:
    - name: {{ dhclient.config }}
    - source: salt://dhclient/files/dhclient.conf
    - template: jinja
    - user: root
{% if 'BSD' in salt['grains.get']('os') %}
    - group: wheel
{% else %}
    - group: root
{% endif %}
    - mode: 644
