{% set pghosts = salt['mine.get']('slave*', 'pgsql_ips') %}
{% set mhosts = salt['mine.get']('master*', 'pgsql_ips') %}

{%- for host, ip in pghosts.iteritems() %}
{{host}}-hosts:
  host.present:
    - name: {{host}}
    - ip: {{ip[0]}}
{%- endfor %}

{%- for host, ip in mhosts.iteritems() %}
{{host}}-hosts:
  host.present:
    - name: {{host}}
    - ip: {{ip[0]}}
{%- endfor %}
