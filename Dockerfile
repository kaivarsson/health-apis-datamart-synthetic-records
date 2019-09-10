FROM flyway/flyway:6.0.1

ENTRYPOINT []
RUN curl -svL https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.2%2B10/OpenJDK12U-jre_x64_linux_hotspot_12.0.2_10.tar.gz -o /tmp/OpenJDK12U-jre_x64_linux_hotspot_12.tar.gz
ENV EXTRA_JRES=/flyway/jre/
RUN mkdir -p $EXTRA_JRES && tar -x -C $EXTRA_JRES -f /tmp/OpenJDK12U-jre_x64_linux_hotspot_12.tar.gz

