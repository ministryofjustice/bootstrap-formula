## Version 2.1.2

* Fix. Make locales generation idempotent.

## Version 2.1.1

* Add recipe that updates locales and "/etc/default/locale". This was moved
  out of application-centric Salt recipes, where having such thing is a bad
  idea inherently.

* Add recipe that provides "/etc/grub.conf" symbolic link. This was moved
  out of application-centric Salt recipes.

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
