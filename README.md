lua-labs
-----------

**lua-labs**  is a set of sample codes whose main purpose is to experiment and test *Lua* and *[OpenResty]/[Apache]*

**CentOS 6.5/Ubuntu 14.04 LTS**
```shell
yum install readline-devel pcre-devel openssl-devel
apt-get install libreadline6-dev libpcre3-dev libssl-dev
wget http://openresty.org/download/ngx_openresty-1.5.11.1.tar.gz
tar xfva ngx_openresty-1.5.11.1.tar.gz
cd ngx_openresty-1.5.11.1
wget https://github.com/irr/nginx_tcp_proxy_module/raw/master/tcp-ngx-1.5.11.1.patch
patch -p1 < tcp-ngx-1.5.11.1.patch
./configure --prefix=/opt/lua/openresty --with-luajit --with-http_iconv_module --with-http_stub_status_module --with-debug --add-module=/opt/lua/modules/nginx/nginx_tcp_proxy_module
make install
```

* [nginx_tcp_proxy_module]: add the feature of tcp proxy with nginx, with health check and status monitor

```shell
cd /usr/sbin
ln -s /opt/lua/openresty/nginx/sbin/nginx
cd /usr/local/bin
ln -s /opt/lua/openresty/luajit/bin/luajit-2.1.0-alpha luajit

cd /usr/local
ln -s /opt/lua/openresty openresty
ln -s /opt/lua/openresty openresty-debug

cd /opt/lua
ln -s ~/.luarocks luarocks
```

**FreeBSD**
```shell
cd /usr/ports/devel/gmake
make install clean
cd /usr/ports/security/openssl
make install clean
cd /usr/ports/devel/pcre
make install clean

or

pkg_add -r -v gmake
pkg_add -r -v pcre
pkg_add -r -v openssl

# ... install openresty ...
```

```shell
cd /opt/openresty/luajit/bin/
ln -s luajit lua
cd /usr/local/bin
ln -s /opt/openresty/luajit/bin/lua
ln -s /opt/openresty/luajit/bin/luajit
cd /usr/sbin
ln -s /opt/openresty/nginx/sbin/nginx
```

```shell
tar xfvz luarocks-2.1.1.tar.gz
cd luarocks-2.1.1
./configure --with-lua=/opt/lua/openresty/luajit --with-lua-include=/opt/openresty/luajit/include/luajit-2.0 --with-lua-lib=/opt/openresty/luajit/lib
gmake build
gmake install
```

```shell
luarocks --local install luasql-mysql MYSQL_INCDIR=/usr/local/include/mysql MYSQL_LIBDIR=/usr/local/lib/mysql
```

Dependencies
-----------

```shell
yum install sqlite-devel mysql-devel pcre-devel perl-CPAN perl-Text-Diff perl-Test-LongString perl-List-MoreUtils perl-Test-Base perl-IO-Socket-SSL
apt-get install libsqlite3-dev libmysqlclient-dev libpcre3-dev cpanminus libtext-diff-perl libtest-longstring-perl liblist-moreutils-perl libtest-base-perl
```

* [OpenResty]: A full-fledged web application server by bundling the standard Nginx core, lots of 3rd-party Nginx modules, as well as most of their external dependencies

* [lua-cjson]: Lua CJSON provides JSON support for Lua
* [lua-iconv]: Lua binding to the POSIX 'iconv' library
* [lua-llthreads]: Low-Level threads(pthreads or WIN32 threads) for Lua
* [lualogging]: LuaLogging provides a simple API to use logging features in Lua
* [luaposix]: Lua bindings for POSIX APIs
* [luasec]: LuaSec is a binding for OpenSSL library to provide TLS/SSL communication
* [luafilesystem]: Lua library developed to complement the set of functions related to file systems offered by the standard Lua distribution 
* [luarocks]: Deployment and management system for Lua modules
* [luasql-mysql]: LuaSQL is a simple interface from Lua to a DBMS (MySQL)
* [luasql-sqlite3]: LuaSQL is a simple interface from Lua to a DBMS (sqlite3)
* [redis-lua]: A Lua client library for the redis key value storage system
* [underscore.lua]: A Lua library that provides a set of utility functions for dealing with iterators, arrays, tables, and functions

```shell
luarocks --local install lua-iconv
luarocks --local install lua-cjson
luarocks --local install lua-llthreads
luarocks --local install luafilesystem
luarocks --local install lualogging
luarocks --local install luaposix
luarocks --local install luasec OPENSSL_LIBDIR=/usr/lib64/ #CentOS 6.x
luarocks --local install luasec OPENSSL_LIBDIR=/usr/lib/x86_64-linux-gnu # Ubuntu LTS 12.04
luarocks --local install luasql-mysql MYSQL_INCDIR=/usr/include/mysql MYSQL_LIBDIR=/usr/lib64/mysql
luarocks --local install luasql-sqlite3
luarocks --local install redis-lua
luarocks --local install underscore.lua --from=http://marcusirven.s3.amazonaws.com/rocks/
```

Copyright and License
---------------------
Copyright 2012 Ivan Ribeiro Rocha

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[Apache]: http://httpd.apache.org/dev/devnotes.html
[OpenResty]: http://openresty.org/
[LuaJIT]: http://luajit.org/
[lua-iconv]: http://luaforge.net/projects/lua-iconv/
[lua-cjson]: http://www.kyne.com.au/~mark/software/lua-cjson.php
[lua-llthreads]: http://github.com/Neopallium/lua-llthreads
[lualogging]: http://www.keplerproject.org/lualogging/
[luaposix]: https://github.com/luaposix/luaposix
[luasec]: https://github.com/brunoos/luasec
[luafilesystem]: https://github.com/keplerproject/luafilesystem
[luarocks]: http://luarocks.org/entcp-ngx-1.4.3.6
[luasql-mysql]: http://www.keplerproject.org/luasql/
[luasql-sqlite3]: http://www.keplerproject.org/luasql/
[redis-lua]: http://github.com/nrk/redis-lua
[underscore.lua]: https://github.com/irr/underscore.lua
[nginx_tcp_proxy_module]: https://github.com/irr/nginx_tcp_proxy_module
