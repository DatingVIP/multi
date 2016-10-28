
function install_libmemcached() {

    wget "https://launchpad.net/libmemcached/1.0/${LIBMEMCACHED_VERSION}/+download/libmemcached-${LIBMEMCACHED_VERSION}.tar.gz" -O libmemcached-${LIBMEMCACHED_VERSION}.tar.gz

    tar xvfz libmemcached-${LIBMEMCACHED_VERSION}.tar.gz
    pushd "libmemcached-${LIBMEMCACHED_VERSION}"

        local protocol_flag=""
        if test "x$ENABLE_PROTOOCOL" = "xyes"; then
            protocol_flag="--enable-libmemcachedprotocol"
        fi

        ./configure --prefix="$LIBMEMCACHED_PREFIX" $protocol_flag LDFLAGS="-lpthread"
        make
        make install
    popd
}

install_libmemcached