FROM ubuntu:16.04
MAINTAINER saranjeet <sasingh@luxoft.com>
RUN apt-get update -qq && apt-get install -y curl git software-properties-common apt-utils python-minimal python3-pip python3-dev python3-apt
RUN add-apt-repository ppa:deadsnakes/ppa && apt-get update &&  apt-get install python3.7 -y
RUN apt-get update && apt-get install linux-headers-4.15.0-50-generic linux-modules-4.15.0-50-generic -y
RUN python3 --version && unlink /usr/bin/python3
RUN ln -s /usr/bin/python3.7 /usr/bin/python3
RUN cp /usr/lib/python3/dist-packages/apt_pkg.cpython-35m-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so
RUN cp /usr/lib/python3/dist-packages/apt_inst.cpython-35m-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_inst.so
RUN curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
RUN pip3 install --force-reinstall pip==19.1.1
RUN pip3 install ansible
COPY ubuntu/hello.txt /Ubuntu1604-CIS
COPY ubuntu/playbook.yml /playbook.yml
