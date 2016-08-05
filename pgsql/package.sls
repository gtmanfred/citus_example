include:
  - .repo

postgresql package:
  pkg.latest:
    - name: postgresql95-server

  file.append:
    - name: /etc/profile.d/pgsql.sh
    - text: export PATH="/usr/pgsql-9.5/bin:$PATH"
