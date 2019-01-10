FROM openresty/openresty:alpine-fat
EXPOSE 80
RUN opm install                                       \
      bungle/lua-resty-template                       \
      jprjr/lua-resty-exec                            \
      agentzh/lua-resty-http                          \
      xiangnanscu/lua-resty-random                    \
      thibaultcha/lua-resty-jit-uuid


RUN luarocks install inspect
RUN luarocks install router

ADD backend/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
ADD backend/entrypoint.sh /usr/local/bin/entrypoint.sh
ADD database.json /opt/bingo/database.json
#ADD backend/lua/ /usr/local/openresty/site/lualib/silverkey
