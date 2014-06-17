touch /etc/motd:
  cmd.run:
    - creates: /etc/motd

motd_quote:
  file.append:
    - name: /etc/motd
    - text: "Roles: {{ grains['roles'] }}"
