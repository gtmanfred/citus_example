include:
  - .firewalld

iptables rules first:
  iptables.insert:
    - position: 1
    - save: True
    - table: filter
    - chain: INPUT
    - match:
      - state
    - connstate: ESTABLISHED,RELATED
    - jump: ACCEPT

iptables rules loopback:
  iptables.insert:
    - position: 2
    - save: True
    - table: filter
    - chain: INPUT
    - in-interface: lo
    - jump: ACCEPT

iptables rules icmp:
  iptables.insert:
    - position: 3
    - save: True
    - table: filter
    - chain: INPUT
    - proto: icmp
    - jump: ACCEPT

iptables rules ssh:
  iptables.append:
    - save: True
    - table: filter
    - chain: INPUT
    - match:
      - state
      - tcp
    - proto: tcp
    - dport: 22
    - connstate: NEW
    - jump: ACCEPT

iptables rules postgresql:
  iptables.append:
    - save: True
    - table: filter
    - chain: INPUT
    - match:
      - state
      - tcp
    - proto: tcp
    - dport: 5432
    - source: 172.16.0.0/24
    - connstate: NEW
    - jump: ACCEPT

iptables rules last:
  iptables.append:
    - save: True
    - table: filter
    - chain: INPUT
    - jump: REJECT


