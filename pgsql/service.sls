include:
  - .setupdb

postgresql service:
  service.running:
    - name: postgresql-9.5
    - order: last
