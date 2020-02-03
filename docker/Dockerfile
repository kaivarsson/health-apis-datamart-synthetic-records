#
# Adds Java 12 to flyway image so we can run our custom resource loader
#
FROM flyway/flyway:6.0.1


#
# Install VA certs. We'll need to be root user. Flyways sets the user as 'flyway',
# so we'll need to restore that after we download the certs. Speaking of which,
# this contain does not have curl, or wget, or really not much at all that
# can be used to download files. So here's a Java Nashorn JavaScript hack to
# download the cert.
#
USER root
RUN echo 'java.nio.file.Files.copy(new java.net.URL("http://aia.pki.va.gov/PKI/AIA/VA/VA-Internal-S2-RCA1-v1.cer").openStream(), java.nio.file.Paths.get("/usr/local/share/ca-certificates/VA-Internal-S2-RCA1-v1.cer"), java.nio.file.StandardCopyOption.REPLACE_EXISTING);' > /tmp/download.js \
  && /opt/java/openjdk/bin/jjs /tmp/download.js \
  && /usr/sbin/update-ca-certificates extract \
  && echo yes | keytool -import -cacerts -trustcacerts -storepass changeit \
     -alias VA-Internal-S2-RCA1-v1 \
     -file /usr/local/share/ca-certificates/VA-Internal-S2-RCA1-v1.cer
USER flyway

ENTRYPOINT []
RUN curl -sL http://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10/OpenJDK12U-jre_x64_linux_hotspot_12.0.2_10.tar.gz -o /tmp/OpenJDK12U-jre_x64_linux_hotspot_12.tar.gz
ENV EXTRA_JRES=/flyway/jre/
RUN mkdir -p $EXTRA_JRES && tar -x -C $EXTRA_JRES -f /tmp/OpenJDK12U-jre_x64_linux_hotspot_12.tar.gz

