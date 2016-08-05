base:
  '*':
    - hosts
    - iptables
    - citus
  'master*':
    - citus.worker
