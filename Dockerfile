FROM ubuntu:16.04

# Install Java.
RUN \
  apt-get update && \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Install Maven 3.3.9
RUN cd /opt/ && \
    wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -xvzf apache-maven-3.3.9-bin.tar.gz && \
    mv apache-maven-3.3.9 maven && \
    echo "export M2_HOME=/opt/maven" > /etc/profile.d/mavenenv.sh && \
    echo "export PATH=/opt/maven/bin:$PATH" >> /etc/profile.d/mavenenv.sh && \
    /bin/bash -c "source /etc/profile.d/mavenenv.sh"


# Install nodejs
RUN apt-get update && \
    apt-get install curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs


RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list && \
    wget https://dl.google.com/linux/linux_signing_key.pub && \
    apt-key add linux_signing_key.pub && \
    apt update && \
    apt install -y google-chrome-stable


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

WORKDIR /var/
COPY swarm* ./

CMD ["sh", "swarm.sh"]
