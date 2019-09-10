FROM fedora
RUN yum -y update && yum clean all
RUN yum -y install openssh netcat-gnu php composer make && yum clean all
RUN useradd -ms /bin/bash  user