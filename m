From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 14 Oct 2013 20:01:30 +0000
Subject: build regressions 2013-10-14
Message-Id: <525c4d9a.phWIbeuPeGuj11dR%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
make: *** No rule to make target `BF526-EZBRD_defconfig'.  Stop.
make: *** No rule to make target `BF533-EZKIT_defconfig'.  Stop.
make: *** No rule to make target `BF561-EZKIT-SMP_defconfig'.  Stop.
make: *** No rule to make target `TCM-BF537_defconfig'.  Stop.
make: *** No rule to make target `etrax-100lx_v2_defconfig'.  Stop.
make: *** No rule to make target `allyesconfig'.  Stop.
fs/cifs/cifssmb.c:3217:40: error: 'COMPRESSION_FORMAT_DEFAULT' undeclared (first use in this function)
Makefile:49: Your system does not have libxml, disabling c2xml
Makefile:49: Your system does not have libxml, disabling c2xml
Makefile:79: Your system does not have llvm, disabling sparse-llvm
Makefile:79: Your system does not have llvm, disabling sparse-llvm
/bin/sh: 1: llvm-config: not found
/bin/sh: 1: llvm-config: not found
make: *** No rule to make target `alldefconfig'.  Stop.
make: *** No rule to make target `m32104ut_defconfig'.  Stop.
make: *** No rule to make target `mappi3.smp_defconfig'.  Stop.
make: *** No rule to make target `opsput_defconfig'.  Stop.
make: *** No rule to make target `usrv_defconfig'.  Stop.
/bin/sh: llvm-config: command not found
/bin/sh: llvm-config: command not found
/bin/sh: llvm-config: command not found
make: *** No rule to make target `fuloong2e_defconfig'.  Stop.
make: *** No rule to make target `b180_defconfig'.  Stop.
make: *** No rule to make target `c3000_defconfig'.  Stop.
make: *** No rule to make target `chroma_defconfig'.  Stop.
make: *** No rule to make target `corenet64_smp_defconfig'.  Stop.
make: *** No rule to make target `gamecube_defconfig'.  Stop.
make: *** No rule to make target `linkstation_defconfig'.  Stop.
make: *** No rule to make target `ppc64_defconfig'.  Stop.
make: *** No rule to make target `wii_defconfig'.  Stop.
make: *** No rule to make target `allmodconfig'.  Stop.
make: *** No rule to make target `rsk7269_defconfig'.  Stop.
make: *** No rule to make target `sh7785lcr_32bit_defconfig'.  Stop.
make: *** No rule to make target `titan_defconfig'.  Stop.
make: *** No rule to make target `defconfig'.  Stop.
make: *** No rule to make target `allnoconfig'.  Stop.
make: *** No rule to make target `oldconfig'.  Stop.
make: *** No rule to make target `oldnoconfig'.  Stop.
arch/xtensa/include/asm/pgalloc.h:49:7: error: 'i' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:78:2: error: 'page' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:49:7: error: 'i' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:78:2: error: 'page' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:49:7: error: 'i' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:78:2: error: 'page' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:49:7: error: 'i' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:78:2: error: 'page' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:49:7: error: 'i' undeclared (first use in this function)
arch/xtensa/include/asm/pgalloc.h:78:2: error: 'page' undeclared (first use in this function)
make: *** No rule to make target `common_defconfig'.  Stop.
make: *** No rule to make target `iss_defconfig'.  Stop.

[warnings]
fs/cifs/ioctl.c:40:8: warning: unused variable 'ExtAttrMask' [-Wunused-variable]
arch/xtensa/include/asm/pgalloc.h:51:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
drivers/staging/media/lirc/lirc_bt829.c:156:17: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got uvoid volatile [noderef] <asn:2>*addr @@
drivers/staging/media/lirc/lirc_bt829.c:168:17: sparse: incorrect type in argument 1 (different address spaces) @@    expected void volatile [noderef] <asn:2>*addr @@    got uvoid volatile [noderef] <asn:2>*addr @@
drivers/staging/media/solo6x10/solo6x10-disp.c:188:24: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [short] [usertype] <noident> @@    got unsigned] [short] [usertype] <noident> @@
net/wireless/radiotap.c:139:45: sparse: Expected ) at end of sizeof
net/wireless/radiotap.c:139:45: sparse: got >

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
