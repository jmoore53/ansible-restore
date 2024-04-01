# README 

Restore Ansible Playbook:

Requirements: 
- Vault Password
- Docker [24.0.2]
or:
- Ansible [core 2.12.10] with localhost access

```sh
# Default will list snapshots
docker build -t ansible-restore:latest .
docker run -it --rm --name restic_restore ansible-restore:latest 

# Update the role to restore the snapshot to /tmp/restore-work in the container 
# Not Ideal, but works.
docker build -t ansible-restore:latest .
docker run -it --rm -v /tmp/restore-work:/tmp/restore-work --name restic_restore ansible-restore:latest 

```
