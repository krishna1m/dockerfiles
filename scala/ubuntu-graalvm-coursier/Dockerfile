FROM ubuntu
RUN apt-get update && apt-get install -y curl wget gzip
WORKDIR /opt
ARG JAVA_VERSION=11
ARG GRAALVM_VERSION=22.3.1
RUN wget -c https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java${JAVA_VERSION}-linux-amd64-${GRAALVM_VERSION}.tar.gz -O- | tar -xz
ENV JAVA_HOME=/opt/graalvm-ce-java${JAVA_VERSION}-${GRAALVM_VERSION}
ENV PATH="${PATH}:${JAVA_HOME}/bin"
ENV COURSIER_HOME=/opt/coursier
RUN curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup --install-dir ${COURSIER_HOME} -y
ENV PATH="${PATH}:${COURSIER_HOME}"
RUN apt-get remove -y --auto-remove curl wget && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /
