FROM node:6

# INSTALL LIBAIO1 & UNZIP (NEEDED FOR NODE-ORACLEDB)
RUN apt-get update \
 && apt-get install -y libaio1 \
 && apt-get install -y build-essential \
 && apt-get install -y unzip \
 && apt-get install -y curl

# ADD ORACLE INSTANT CLIENT (instant client zip should be in ./oracle/linux dir)
RUN mkdir -p opt/oracle
ADD ./oracle/linux/ .

# 12.2
RUN unzip instantclient-basic-linux.x64-12.2.0.1.0 -d /opt/oracle

ENV LD_LIBRARY_PATH="/opt/oracle/instantclient_12_2"

ENV TNS_ADMIN="/usr/src/app/Wallet_ATPDemoDB"

ENV WALLET_LOCATION="/usr/src/app/Wallet_ATPDemoDB"

WORKDIR /usr/src/app




COPY package*.json ./

RUN npm install



COPY . .

EXPOSE 8080
CMD npm start
