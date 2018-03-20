# ansible-role-tftpd-openbsd

Manage `tftpd(8)` from OpenBSD

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `tftpd_openbsd_user` | | `_tftpd` |
| `tftpd_openbsd_group` | | `_tftpd` |
| `tftpd_openbsd_service` | | `tftpd` |
| `tftpd_openbsd_flags` | | `""` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  pre_tasks:
    - name: Create /tftpboot
      file:
        path: /tftpboot
        state: directory
      changed_when: false
  roles:
    - ansible-role-tftpd-openbsd
  vars:
    tftpd_openbsd_flags: -v -4 /tftpboot
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
