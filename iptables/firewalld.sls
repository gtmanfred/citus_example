disable firewalld:
  service.dead:
    - name: firewalld
    - enable: False
  module.run:
    - name: service.mask
    - m_name: firewalld.service
    - onlyif: systemctl is-enabled firewalld.service
