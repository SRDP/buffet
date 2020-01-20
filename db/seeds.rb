# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dashboard.create( hostname: "ip-172-31-24-255",
                  kernel_version: "3.10.0-1062.4.3.el7.x86_64",
                  ipaddress: "172.31.24.255",
                  macaddress: "06:30:33:b2:40:e8",
                  cpuidle: 2, 
                  total_memory: " 93.5 id",
                  used_memory: "3787",
                  free_memory: "3022",
                  total_swap: "765",
                  used_swap: 0,
                  free_swap: 0,
                  userslist:  "{'stderr_lines': [], u'changed': True, u'end': u'2020-01-17 10:45:22.969258', u'stdout': u'root\nbin\ndaemon\nadm\nlp\nsync\nshutdown\nhalt\nmail\noperator\ngames\nftp\nnobody\nsystemd-network\ndbus\npolkitd\nsshd\npostfix\nchrony\nec2-user\nnginx\nmyappuser\nawx\nrabbitmq\nmemcached\ntss\npostgres', u'cmd': u'cut -d: -f1 /etc/passwd', u'rc': 0, 'failed': False, u'stderr': u'', u'delta': u'0:00:00.004435', 'stdout_lines': [u'root', u'bin', u'daemon', u'adm', u'lp', u'sync', u'shutdown', u'halt', u'mail', u'operator', u'games', u'ftp', u'nobody', u'systemd-network', u'dbus', u'polkitd', u'sshd', u'postfix', u'chrony', u'ec2-user', u'nginx', u'myappuser', u'awx', u'rabbitmq', u'memcached', u'tss', u'postgres'], u'start': u'2020-01-17 10:45:22.964823'}",
                  disk_free_space: "/dev/xvda2 : 2.9G",
                  disk_Used_space: "/dev/xvda2 : 7.9G")
