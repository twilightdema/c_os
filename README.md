### Installation for Ubuntu ###

* Install all prerequistics
```
sudo apt-get install install nasm
sudo apt-get install qemu
sudo apt-get install libgmp-dev
sudo apt-get install libmpfr-dev
sudo apt-get install libmpc-dev
sudo apt-get install gcc
```

* Install cross-compiling build tools
```
. script/set_env_ubuntu.sh

sudo mkdir /usr/local/i386elfgcc
sudo chmod 777 /usr/local/i386elfgcc

mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz # If the link 404's, look for a more recent version
tar xf binutils-2.24.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
make all install 2>&1 | tee make.log

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
mkdir gcc-build
cd gcc-build
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 
```

Always use /usr/local/bin/nasm to assembly all .asm files.
To start testing the OS, use: qemu-system-x86_64 boot_loader.


### Installation for OSX ###

* Install all prerequistics
```
brew install nasm
brew install qemu
brew install gmp
brew install mpfr
brew install libmpc
brew install gcc
```

* Install cross-compiling build tools
```
. script/set_env_osx.sh

sudo mkdir /usr/local/i386elfgcc
sudo chmod 777 /usr/local/i386elfgcc

mkdir /tmp/src
cd /tmp/src
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz # If the link 404's, look for a more recent version
tar xf binutils-2.24.tar.gz
mkdir binutils-build
cd binutils-build
../binutils-2.24/configure --target=$TARGET --enable-interwork --enable-multilib --disable-nls --disable-werror --prefix=$PREFIX 2>&1 | tee configure.log
make all install 2>&1 | tee make.log

cd /tmp/src
curl -O https://ftp.gnu.org/gnu/gcc/gcc-4.9.1/gcc-4.9.1.tar.bz2
tar xf gcc-4.9.1.tar.bz2
mkdir gcc-build
cd gcc-build
../gcc-4.9.1/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --disable-libssp --enable-languages=c --without-headers
make all-gcc 
make all-target-libgcc 
make install-gcc 
make install-target-libgcc 
```

Always use /usr/local/bin/nasm to assembly all .asm files.
To start testing the OS, use: qemu-system-x86_64 boot_loader.

