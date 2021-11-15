export JAVA_HOME=${JAVA_HOME-"/usr/lib/jvm/default-java"}

# JVM Options
CATALINA_OPTS="-server
               -showversion
               -XX:+PrintCommandLineFlags
               -XX:+HeapDumpOnOutOfMemoryError
               -XX:HeapDumpPath=/var/lib/tomcat/logs/
               -XX:+UseCodeCacheFlushing
               -Xms512m
               -Xmx2G
               -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=12345
               -XX:+CMSClassUnloadingEnabled
               -XX:-OmitStackTraceInFastThrow
               -XX:+UseParNewGC
               -XX:+UseConcMarkSweepGC
               -XX:+CMSConcurrentMTEnabled
               -XX:+ScavengeBeforeFullGC
               -XX:+CMSScavengeBeforeRemark
               -XX:+CMSParallelRemarkEnabled
               -XX:+UseCMSInitiatingOccupancyOnly
               -XX:CMSInitiatingOccupancyFraction=50
               -XX:NewSize=256m
               -XX:MaxNewSize=1024m
               -XX:SurvivorRatio=10
               -XX:+DisableExplicitGC
               -Xloggc:/var/lib/tomcat/logs/gc.log
               -XX:+PrintGCApplicationConcurrentTime
               -XX:+PrintGCApplicationStoppedTime
               -XX:+PrintGCDateStamps
               -XX:+PrintGCDetails
               -XX:+PrintTenuringDistribution
               -XX:+UseGCLogFileRotation
               -XX:NumberOfGCLogFiles=14
               -XX:GCLogFileSize=100M
               "

# Java Properties
export CATALINA_OPTS="$CATALINA_OPTS
                      -Dcom.sun.xml.bind.v2.bytecode.ClassTailor.noOptimize=true
                      -Dcom.sun.management.jmxremote=true
                      -Dcom.sun.management.jmxremote.authenticate=false
                      -Dcom.sun.management.jmxremote.port=8000
                      -Dcom.sun.management.jmxremote.rmi.port=8000
                      -Dcom.sun.management.jmxremote.ssl=false
                      -Djava.rmi.server.hostname=$ENV_HOST_IP
                      -Djava.security.egd=file:/dev/./urandom
                      -Djruby.compile.invokedynamic=false
                      -Dlog4jdbc.sqltiming.error.threshold=1000
                      -Dkillbill.server.ldap=true
                      -Dlogback.configurationFile=/var/lib/killbill/logback.xml"

# Strip newlines (https://bz.apache.org/bugzilla/show_bug.cgi?id=63815)
export CATALINA_OPTS="$(echo $CATALINA_OPTS)"

# Allow for further customization
if [ -r "$CATALINA_BASE/bin/setenv2.sh" ]; then
  . "$CATALINA_BASE/bin/setenv2.sh"
fi