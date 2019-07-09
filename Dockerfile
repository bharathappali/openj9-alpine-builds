FROM alpine:3.10

RUN apk update && apk add libunwind && mkdir -p /opt/java/openjdk

ENV JAVA_VERSION jdk-11.0.3+7_openj9-0.14.3

RUN set -eux; \
    apk add --virtual .fetch-deps curl; \
    ARCH="$(apk --print-arch)"; \
    case "${ARCH}" in \
       amd64|x86_64) \
         ESUM='140b09d4790d6cd5b41c77f4e21c3ac3c502b0a204ed170f4bafcd45b97c2442'; \
         BINARY_URL='https://github.com/bharathappali/openj9-alpine-builds/raw/master/build/jdk11/x86_64/alpine/310/openj9-jdk11-alpine.tar.gz'; \
         ;; \
	 *) \
         echo "Unsupported arch: ${ARCH}"; \
         exit 1; \
         ;; \
    esac; \
    curl -LfsSo /tmp/openjdk.tar.gz ${BINARY_URL}; \
    echo "${ESUM} */tmp/openjdk.tar.gz" | sha256sum -c -; \
    mkdir -p /opt/java/openjdk; \
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    apk del --purge .fetch-deps; \
    rm -rf /var/cache/apk/*; \
    rm -rf /tmp/openjdk.tar.gz;

ENV JAVA_HOME=/opt/java/openjdk \
    PATH="/opt/java/openjdk/bin:$PATH"
ENV JAVA_TOOL_OPTIONS="-XX:+IgnoreUnrecognizedVMOptions -XX:+UseContainerSupport -XX:+IdleTuningCompactOnIdle -XX:+IdleTuningGcOnIdle" 

