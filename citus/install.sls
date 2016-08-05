install gcc:
  pkg.installed:
    - names:
      - git
      - gcc
      - libxml2-devel
      - pam-devel
      - libxslt-devel
      - openssl-devel
      - readline-devel
      - flex
      - postgresql95-devel

make pg_shard:
  git.latest:
    - name: git://github.com/citusdata/citus
    - target: /citus
    - always_fetch: True

  file.absent:
    - name: /citus/src/backend/distributed/citus.so
    - onchanges:
      - git: make pg_shard

  cmd.run:
    - names: 
      - ./configure
      - make
    - cwd: /citus
    - env:
      - PATH: '/usr/pgsql-9.5/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin'
    - creates: /citus/src/backend/distributed/citus.so
    - onchanges:
      - git: make pg_shard

install pg_shard:
  cmd.run:
    - name: make install
    - cwd: /citus
    - env:
      - PATH: '/usr/pgsql-9.4/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin'
    - onchanges:
      - cmd: make pg_shard
    - creates: /usr/pgsql-9.5/lib/citus.so
