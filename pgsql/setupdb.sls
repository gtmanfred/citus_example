include:
  - .package

initdb:
  cmd.run:
    - name: /usr/pgsql-9.5/bin/postgresql95-setup initdb
    - unless: test -f /var/lib/pgsql/9.5/data/PG_VERSION
    - env:
      LC_ALL: en_US.utf8
