FROM ruby:2

RUN set -x && \
  apt-get update -qq && \
  apt-get install -y build-essential && \
  : "Softether VPN" && \
  cd /tmp && \
  git clone https://github.com/SoftEtherVPN/SoftEtherVPN_Stable.git && \
  cd SoftEtherVPN_Stable && \
  ./configure && \
  make && \
  make install && \
  : "Cleanup" && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/bin/vpncmd", "/TOOLS", "/CMD", "HELP"]
