{% from "bootstrap/map.jinja" import bootstrap with context %}
{# See grub.sls for more info on what this outer loop if is for #}
{% if not(salt['grains.get']('virtual') == 'xen' and salt['grains.get']('productname', '') != 'HVM domU') %}
{%   if not salt['grains.get']("lock_kernel_version") or salt['grains.get']("lock_kernel_version") == False %}
include:
  - .grub

install_specific_linux_kernel:
  pkg.installed:
    - name: {{ bootstrap.kernel.meta_package }}
{%     if bootstrap.kernel.version %}
    - version: {{ bootstrap.kernel.version }}
{%     endif %}
    - require:
      - cmd: upgrade_to_grub_pc
    - watch_in:
      - cmd: grub_install_bootsector
{%   endif %}
{% endif %}
