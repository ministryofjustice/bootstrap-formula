
Migration to v3.0.0
-------------------

v3.0.0 will upgrade GRUB to v2 (grub-pc) if it is downgraded. You can set pillar 
`bootstrap.upgrade_grub` to `False` if you wish to postpone this.

v3.0.0 will also upgrade to a known-secure and supported kernel. This means for 12.04 LTS boxes
you will be upgraded to the 'lts-trusty' kernel. 14.04 LTS users will be upgraded to the version
specified in map.jinja.

This process can be postponed by setting grain `lock_kernel_version` to `True` on your nodes.

Eg, to roll this out piecemeal, do the following:

    salt '*' grains.setval lock_kernel_version True

    salt 'node01' grains.setval lock_kernel_version False

Though it should be fine to just upgrade all nodes, and reboot as required by your application.
