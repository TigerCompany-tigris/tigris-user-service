FROM ubuntu:16.04

# Build essentials
RUN apt-get update \
  && apt-get install -y autotools-dev autoconf automake \
  && apt-get install -y python3 python3-pip curl git sudo cron \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


# Mecab
WORKDIR /opt
RUN git clone https://github.com/hephaex/mecab.git
WORKDIR /opt/mecab/mecab
RUN ./configure  --enable-utf8-only \
  && make \
  && make check \
  && make install \
  && ldconfig

# mecab-ko-dic
WORKDIR /opt/mecab
RUN curl -fsSL https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.3-20170922.tar.gz |tar xvz
RUN mv mecab-ko-dic-2.0.3-20170922 mecab-ko-dic
WORKDIR /opt/mecab/mecab-ko-dic
RUN ./autogen.sh \
  && ./configure --with-charset=utf8
RUN make
RUN make install

RUN echo "dicdir = /usr/local/lib/mecab/dic/mecab-ko-dic" > /usr/local/etc/mecabrc

# Clean up
COPY . /opt/api
WORKDIR /opt/api
RUN pip3 instal -U pip setuptools
RUN pip3 install -r requirements.txt

COPY test.txt .
CMD ["python3", "server.py"]
