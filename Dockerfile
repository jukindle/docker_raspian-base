FROM navikey/raspbian-buster

# Update apt and install raspi libs
RUN apt update
RUN apt-get install -y --reinstall libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# Install python3 and opencv
RUN apt install -y python3 python3-pip
RUN apt install -y python3-opencv

# Install pip dependencies
RUN python3 -m pip install ftputil
RUN python3 -m pip install picamera
RUN python3 -m pip install numpy
RUN python3 -m pip install imutils
RUN python3 -m pip install requests
RUN python3 -m pip install rpi.gpio
RUN apt install -y curl

# Install gcloud
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
RUN python3 -m pip install google-cloud-storage
