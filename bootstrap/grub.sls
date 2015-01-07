{% from "bootstrap/map.jinja" import bootstrap with context %}
{% if salt['grains.get']('virtual') == 'xen' %}
# we do not support updating grub on AWS
{% else %}
{%   if bootstrap.upgrade_grub %}
# upgrade grub if we are not using grub-pc
# NB: This is done via cmd.run as pkg.installed would barf on questions asked.
upgrade_to_grub_pc:
  cmd.run:
    - env: 
      - DEBIAN_FRONTEND: 'noninteractive'
    - name: "yes '' | apt-get -y -o Dpkg::Options::='--force-confdef' -o Dpkg::Options::='--force-confold' install grub-pc"
    - unless: 'dpkg -l | grep -q grub-pc'
    - watch_in:
      - cmd: grub_install_bootsector

grub_install_bootsector:
  cmd.wait:
    - name: "grub-install {{bootstrap.grub_install_device}}"

{%   else %}
upgrade_to_grub_pc:
  cmd.run:
    - name: 'echo "You must upgrade to grub-pc. See bootstrap-formula/README.rst" && false'
    - unless: 'dpkg -l | grep -q grub-pc'

{%   endif %}
{% endif %}
