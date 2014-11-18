From: julio <julio7k@gmail.com>
Date: Tue, 18 Nov 2014 03:54:58 +0000
Subject: error while installing staging kernel GKH
Message-Id: <546AC312.7080805@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

I was following the tutorial on how to build your first patch and came 
across this error when running
sudo make modules_install install

INSTALL sound/firewire/fireworks/snd-fireworks.ko
   DEPMOD  3.18.0-rc4-01142-gcc03f9b
sh ./arch/x86/boot/install.sh 3.18.0-rc4-01142-gcc03f9b 
arch/x86/boot/bzImage \
     System.map "/boot"
run-parts: executing /etc/kernel/postinst.d/apt-auto-removal 
3.18.0-rc4-01142-gcc03f9b /boot/vmlinuz-3.18.0-rc4-01142-gcc03f9b
run-parts: executing /etc/kernel/postinst.d/dkms 
3.18.0-rc4-01142-gcc03f9b /boot/vmlinuz-3.18.0-rc4-01142-gcc03f9b
Error! Bad return status for module build on kernel: 
3.18.0-rc4-01142-gcc03f9b (x86_64)
Consult /var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/make.log for more 
information.
^Carch/x86/boot/Makefile:185: recipe for target 'install' failed
make[1]: *** [install] Interrupt
arch/x86/Makefile:239: recipe for target 'install' failed
make: *** [install] Interrupt

this is the staging tree GKH.

cat /var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/make.log

returns the following message:

DKMS make.log for bcmwl-6.30.223.248+bdcom for kernel 
3.18.0-rc4-01142-gcc03f9b (x86_64)
lun 17 nov 20:54:47 CST 2014
CFG80211 API is prefered for this kernel version
Using CFG80211 API
   LD      /var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/built-in.o
   CC [M] 
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/shared/linux_osl.o
   CC [M] 
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.o
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.c: In 
function ‘wl_alloc_linux_if’:
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.c:1316:64: 
error: macro "alloc_netdev" requires 4 arguments, but only 3 given
   dev = alloc_netdev(sizeof(priv_link_t), intf_name, ether_setup);
                                                                 ^
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.c:1316:8: 
error: ‘alloc_netdev’ undeclared (first use in this function)
   dev = alloc_netdev(sizeof(priv_link_t), intf_name, ether_setup);
         ^
/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.c:1316:8: 
note: each undeclared identifier is reported only once for each function 
it appears in
scripts/Makefile.build:257: recipe for target 
'/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.o' failed
make[3]: *** 
[/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build/src/wl/sys/wl_linux.o] 
Error 1
Makefile:1380: recipe for target 
'_module_/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build' failed
make[2]: *** [_module_/var/lib/dkms/bcmwl/6.30.223.248+bdcom/build] Error 2

the question is should I report a bug on a staging driver?
and how this could be fixed? did the alloc_netdev function changed?
this kernel was compiled with make allyesconfig
Thanks,
PD: I am a Kernel newbie trying to commit my first patch...
Sorry if this is not the right mailing list
Julio Ordonez-Viales
