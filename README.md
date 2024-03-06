# Take Home - Ubuntu Prometheus Terraform/Ansible

## Terraform

Provisions two e2-micro Ubuntu 22.04 VMs in GCP.

I used Terraform variables to hide my service account email and a few public ssh keys.

`secret.auto.tfvars`
```terraform
service_account_email = ""
ssh_keys = ""
```

## Ansible

Updates apt cache, installs prometheus, copies the modified config, and restarts the process.

Found in the `ansible`
```bash
ansible-playbook -i inventory/hosts.ini main.yml
```

`hosts.ini` uses hostnames instead of IPs
I have mine set in `~/.ssh/config` as seen below, but you could easily use DNS instead.

```config
Host prom_alpha
    HostName <insert instance ipv4>
Host prom_beta
    HostName <insert instance ipv4>
```

## Testing

Confirmed metrics from `prom_alpha` were being received on `prom_beta` using SSH port forwarding and the Prometheus web interface.

Reran Terraform/Ansible from scratch to confirm results.
