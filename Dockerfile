# USE for client down
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html/

#RUN brook_new_ver=`wget -qO- https://github.com/txthinking/brook/tags| grep "/txthinking/brook/releases/tag/"| head -n 1| awk -F "/tag/" '{print $2}'| sed 's/\">//'` && \
ENV VERSION	v20171113
ENV HTTPDIR     /usr/share/nginx/html/

# Install packages.
RUN apk --update add asciidoc wget && \
    rm -rf /var/cache/apk/*

#Down client file
RUN wget --no-check-certificate -O ${HTTPDIR}/brook.exe "https://github.com/txthinking/brook/releases/download/${VERSION}/brook.exe"
#           wget --no-check-certificate -O ${HTTPDIR}/Brook.white.exe "https://github.com/txthinking/brook/releases/download/${VERSION}/Brook.white.exe" && \
#           wget --no-check-certificate -O ${HTTPDIR}/Brook.386.exe "https://github.com/txthinking/brook/releases/download/${VERSION}/Brook.386.exe" && \
#           wget --no-check-certificate -O ${HTTPDIR}/Brook.386.white.exe "https://github.com/txthinking/brook/releases/download/${VERSION}/Brook.386.white.exe" && \
#           wget --no-check-certificate -O ${HTTPDIR}/Brook.apk "https://github.com/txthinking/brook/releases/download/${VERSION}/Brook.apk"

ADD ./README.md /usr/share/nginx/html/
#for i in *.md; do asciidoc  $i;  done;
#for i in /some/directory/*.md; do pandoc -f markdown -t html -s "$i" > "$i".html; done;
RUN ["asciidoc","README.md"]

CMD ["nginx", "-g", "daemon off;"]
