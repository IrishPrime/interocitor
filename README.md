# Interocitor

My personal [Ansible][ansible] inventory, playbooks, and roles
for managing the systems in my home. Others may find something of value in
inspecting this repository, or the application configuration files contained
herein, but the contents overall are unlikely to be of much use to anyone not
looking to run my particular setup.

## Requirements

- [Ansible][ansible]
- [Arch Linux][archlinux]

### Supported Systems

The [`common`](roles/common/) role installs most of the core packages I use.
While this, in theory, supports most any Linux distribution, package names vary
across them, so it's only been tested with [Arch Linux][archlinux].

## What's with the Name?

An [Ansible][ansible-wiki] is a category of fictional
devices or technology capable of near-instantaneous or faster-than-light
communication. The term was coined by author [Ursula K. Le
Guin](https://en.wikipedia.org/wiki/Ursula_K._Le_Guin).

The Interocitor is a fictional device from a few [Raymond F.
Jones](https://en.wikipedia.org/wiki/Raymond_F._Jones) stories that performs a
variety of computing tasks, including near-instantaneous long distance
communication.

Naming this repository after a similar fictional device seemed more sensible to
me than naming it "Ansible" when it isn't a fork of the [original][ansible-src].

[ansible]: https://ansible.com/
[ansible-src]: https://github.com/ansible/ansible
[ansible-wiki]: https://en.wikipedia.org/wiki/Ansible
[archlinux]: https://archlinux.org/
