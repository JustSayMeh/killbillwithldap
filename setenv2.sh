# Java Properties
export CATALINA_OPTS="$CATALINA_OPTS
                      -Dorg.killbill.queue.creator.name=localhost
                      -Dorg.killbill.server.properties=file:///var/lib/killbill/killbill.properties
                      -Dkillbill.server.ldap=true
                      -Dlogback.configurationFile=/var/lib/killbill/logback.xml
                      "

# Strip newlines (https://bz.apache.org/bugzilla/show_bug.cgi?id=63815)
export CATALINA_OPTS="$(echo $CATALINA_OPTS)"