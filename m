From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 25 Mar 2013 16:11:16 +0000
Subject: build regressions 2013-03-25
Message-Id: <51507724.7snIKkdZ8CnwgGxa%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
(.init.text+0x0): multiple definition of `init_module'
drivers/md/bcache/super.o:super.c:(.init.text+0x0): first defined here
drivers/gpu/drm/drm_pci.c:485:2: error: implicit declaration of function 'pcie_capability_read_dword' [-Werror=implicit-function-declaration]
drivers/md/bcache/bset.c:727:3: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
drivers/md/bcache/btree.c:932:3: error: implicit declaration of function 'prefetch' [-Werror=implicit-function-declaration]
drivers/md/bcache/super.o:(.opd+0x540): first defined here
drivers/md/bcache/super.o:(.init.text+0x0): first defined here
ftrace.c:(.toc+0xd90): undefined reference to `epapr_ev_idle_start'
ftrace.c:(.toc+0xda0): undefined reference to `epapr_ev_idle'
drivers/staging/dwc2/pci.c:171:21: error: 'IRQ_LEVEL' undeclared (first use in this function)
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:16:24: error: array type has incomplete element type
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:17:2: error: array index in non-array initializer
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:18:3: error: field name not in record or union initializer
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:19:3: error: field name not in record or union initializer
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:20:3: error: field name not in record or union initializer
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:20:12: error: 'IORESOURCE_MEM' undeclared here (not in a function)
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:27:11: error: implicit declaration of function 'BUILD_BUG_ON_ZERO' [-Werror=implicit-function-declaration]
drivers/acpi/acpi_uart.c:181:2: error: implicit declaration of function 'ACPI_NODE_GET' [-Werror=implicit-function-declaration]
ERROR: "pm_generic_complete" [drivers/i2c/i2c-core.ko] undefined!
ERROR: "pm_generic_prepare" [drivers/i2c/i2c-core.ko] undefined!

[warnings]
drivers/md/bcache/bset.c:164:2: warning: format '%li' expects argument of type 'long int', but argument 4 has type 'size_t' [-Wformat]
drivers/md/bcache/debug.c:86:4: warning: format '%li' expects argument of type 'long int', but argument 4 has type 'size_t' [-Wformat]
drivers/md/bcache/btree.c:245:8: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Wformat]
WARNING: vmlinux.o(.text+0x97f8): Section mismatch in reference from the function .start_secondary_prolog() to the function .cpuinit.text:.start_secondary()
WARNING: vmlinux.o(.text+0x980c): Section mismatch in reference from the function .start_secondary_resume() to the function .cpuinit.text:.start_secondary()
drivers/md/bcache/sysfs.c:730:1: warning: '__bch_cache_show' uses dynamic stack allocation [enabled by default]
drivers/s390/kvm/virtio_ccw.c:598:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/s390/kvm/virtio_ccw.c:598:2: warning: (near initialization for 'virtio_ccw_config_ops.get_features') [enabled by default]
arch/sh/kernel/cpu/sh2a/pinmux-sh7269.c:28:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/pinctrl/sh-pfc/core.c:76:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/block/aoe/aoecmd.c:931:20: warning: 'bv' is used uninitialized in this function [-Wuninitialized]
drivers/acpi/acpi_uart.c:181:9: warning: assignment makes pointer from integer without a cast [enabled by default]

[sparse]
drivers/staging/media/go7007/go7007-priv.h:93:31: sparse: dubious one-bit signed bitfield
drivers/staging/media/go7007/go7007-priv.h:94:31: sparse: dubious one-bit signed bitfield
drivers/staging/media/go7007/go7007-loader.c:32:18: sparse: symbol 'fw_configs' was not declared. Should it be static?
drivers/md/dm-cache-target.c:670:24: sparse: incorrect type in assignment (different argument counts)
fs/btrfs/raid56.c:2013:32: sparse: incorrect type in assignment (different argument counts)
net/nfc/llcp/commands.c:423:14: sparse: incorrect type in assignment (different base types)
net/nfc/llcp/commands.c:479:14: sparse: incorrect type in assignment (different base types)

[cppcheck]
include/uapi/linux/aio_abi.h:70: error: edit for your odd byteorder.
include/uapi/linux/aio_abi.h:70: error: edit for your odd byteorder.
include/uapi/linux/aio_abi.h:70: error: edit for your odd byteorder.
include/uapi/linux/aio_abi.h:70: error: edit for your odd byteorder.
include/uapi/linux/raid/md_p.h:159: error: unspecified endianness
include/uapi/linux/raid/md_p.h:159: error: unspecified endianness
include/linux/slab.h:250: error: "Unknown slab allocator"
include/linux/slab.h:250: error: "Unknown slab allocator"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
