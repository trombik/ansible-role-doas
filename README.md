# Ansible role  doas

Configure `doas.conf(5)`.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `doas_conf_dir` | base directory of `doas.conf(5)` | `{{ __doas_conf_dir }}` |
| `doas_conf_file` | Path to `doas.conf(5)` | `{{ doas_conf_dir }}/doas.conf` |
| `doas_conf_file_mode` | Permission of `doas.conf(5)` | `0644` |
| `doas_config` | Content of `doas.conf(5)` | `""` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__doas_conf_dir` | `/etc` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-doas
  vars:
    doas_conf_file_mode: 0640
    doas_config: |
      permit nopass vagrant as root cmd sysctl
      permit persist setenv { PKG_CACHE PKG_PATH } aja cmd pkg_add
      permit setenv { -ENV PS1=$DOAS_PS1 SSH_AUTH_SOCK } :wheel
      permit nopass tedu as root cmd /usr/sbin/procmap
      permit nopass keepenv root as root
```

# License

```
Copyright (c) 2018 Tomoyuki Sakurai <y@trombik.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <y@trombik.org>

This README was created by [qansible](https://github.com/trombik/qansible)
