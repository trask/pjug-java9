FROM ubuntu:trusty

# install java 9
RUN apt-get update \
  && apt-get -y install software-properties-common \
  && add-apt-repository ppa:webupd8team/java \
  && apt-get update \
  && echo oracle-java9-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && apt-get -y install oracle-java9-installer

# install pre-built project kulla jar
ENV KULLA_JENKINS_BUILD 65
ENV KULLA_VERSION 0.508-20150514005848
RUN apt-get -y install curl \
  && curl https://adopt-openjdk.ci.cloudbees.com/view/OpenJDK/job/langtools-1.9-linux-x86_64-kulla-dev/$KULLA_JENKINS_BUILD/artifact/kulla-$KULLA_VERSION.jar > kulla-$KULLA_VERSION.jar

CMD java -jar kulla-$KULLA_VERSION.jar
