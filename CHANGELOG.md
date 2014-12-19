## Version 3.0.0

* Upgrade GRUB to grub-pc (v2), since GRUBv1 on vCD templates was in error
* Permit upgrade of kernel -- encourage by default, set grain 'lock_kernel_version' to postpone.

## Version 2.1.0

* Reduce swapping: vm.swappiness = 1. This should discourage Linux from
  swapping, but still allow it to happen

## Version 2.0.0

* Added policy-rc blocking all services from auto starting when installing a
  package. As we are already fully managing daemons status through salt and we
  need to configure service before starting it

## Version 1.0.1

* Manage /etc/sudoers file

## Version 1.0.0

* Initial Release
