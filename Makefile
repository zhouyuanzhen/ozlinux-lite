BUSYBOX_DIR=busybox-1.36.1
BUSYBOX_EXT=tar.bz2

debug:
	@echo $(BUSYBOX_DIR).$(BUSYBOX_EXT)

dl_busybox:
	mkdir -p ./cache
	wget -c https://busybox.net/downloads/$(BUSYBOX_DIR).$(BUSYBOX_EXT) -O ./cache/$(BUSYBOX_DIR).$(BUSYBOX_EXT)

build_busybox:
	mkdir -p ./build
	test -d ./build/$(BUSYBOX_DIR) || tar -xvf ./cache/$(BUSYBOX_DIR).$(BUSYBOX_EXT) -C ./build/
	mkdir -p ./build/$(BUSYBOX_DIR)/build
	test -f configs/busybox/$(BUSYBOX_DIR).config && cp configs/busybox/$(BUSYBOX_DIR).config ./build/$(BUSYBOX_DIR)/build/.config
	cd ./build/$(BUSYBOX_DIR); make O=build ARCH=arm64
	cd ./build/$(BUSYBOX_DIR); make O=build ARCH=arm64 install

pack_rootfs:
	cd rootfs && mkdir -pv {etc,proc,sys,usr/{bin,sbin}}
	cd rootfs && find . -print0 | cpio --null -ov --format=newc | gzip > ../initramfs.cpio.gz
	ls -lh initramfs.cpio.gz

clean:
	rm -fr ./build

purge:
	rm -fr ./build ./cache

all: dl_busybox build_busybox pack_rootfs
	@echo "All in one pipeline!"
