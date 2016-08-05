include:
  - citus

pg_worker_list.conf file:
  file.managed:
    - name: /var/lib/pgsql/9.5/data/pg_worker_list.conf
    - source: salt://citus/files/pg_worker_list.conf
    - template: jinja
    - listen_in:
      - service: postgresql service

activate pg_shard:
  postgres_extension.present:
    - name: citus
    - require:
      - service: postgresql service
