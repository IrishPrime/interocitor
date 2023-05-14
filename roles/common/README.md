# Common

Things which need to be done on all systems. Installs basic utilities and
configurations that no system should be without.

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

## Role Variables

- `standard_packages` - A list of packages which should be installed on all hosts.
- `graphical_packages` - A list of packages which should be installed on hosts in the `graphical` inventory group.
- `headless_packages` - A list of packages which should be installed on hosts in the `headless` inventory group.
- `user` - The user who should own files copied to the remote system.
- `group` - The group who should own the files copied to the remote system.
- `theme` - The suffix of the `Xresources` and `dir_colors` files to copy. E.g. `nord` or `solarized`.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: graphical
      roles:
         - role: common
           user: <your username>
           group: users
           theme: nord

## Author Information

Michael "Irish" O'Neill
