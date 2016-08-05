include:
  - .setupdb
  - .service

postgresql.conf file:
  file.managed:
    - name: /var/lib/pgsql/9.5/data/postgresql.conf
    - source: salt://pgsql/files/postgresql.conf
    - template: jinja
    - listen_in:
      - service: postgresql service

pg_hba.conf file:
  file.append:
    - name: /var/lib/pgsql/9.5/data/pg_hba.conf
    - text: host all all 172.16.0.0/24 trust
    - listen_in:
      - service: postgresql service
