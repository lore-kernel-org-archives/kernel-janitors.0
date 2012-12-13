From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Dec 2012 16:17:34 +0000
Subject: build regressions 2012-12-13
Message-Id: <50c9ff9e.LKa3xysgMYUWosXv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/swapfile.c:1479: error: previous definition of 'enable_swap_info' was here
mm/swapfile.c:1495: error: previous definition of 'reinsert_swap_info' was here
initramfs.c:(.init.text+0x32f6): undefined reference to `__initramfs_size'
drivers/gpio/gpio-pl061.c:26:26: fatal error: asm/mach/irq.h: No such file or directory
arch/parisc/hpux/fs.c:47:6: error: too many arguments to function 'do_execve'
/tmp/ccIeV2M2.s:5: Error: file not found: efi_signature_list
mm/swapfile.c:1485:13: error: redefinition of 'enable_swap_info'
mm/swapfile.c:1501:13: error: redefinition of 'reinsert_swap_info'
mm/mmap.c:392:13: error: redefinition of 'validate_mm_rb'
{standard input}:5: Error: file not found: efi_signature_list
mm/slab.h:107:11: error: 'struct kmem_cache' has no member named 'memcg_params'
mm/memcontrol.c:2803:18: error: 'struct kmem_cache' has no member named 'memcg_params'

[warnings]
drivers/spi/spi-pl022.c:1338:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
drivers/spi/spi-pl022.c:2093:9: warning: format '%x' expects argument of type 'unsigned int', but argument 2 has type 'resource_size_t' [-Wformat]
drivers/dma/pl330.c:2057:2: warning: passing argument 3 of 'dma_alloc_attrs' from incompatible pointer type [enabled by default]
drivers/dma/amba-pl08x.c:848:3: warning: format '%x' expects argument of type 'unsigned int', but argument 4 has type 'dma_addr_t' [-Wformat]
warning: (XILINX_ZED_USB_OTG) selects USB_ULPI which has unmet direct dependencies (USB_SUPPORT && (USB || USB_GADGET) && ARM)
warning: (XILINX_ZED_USB_OTG) selects USB_XUSBPS_OTG which has unmet direct dependencies (USB_SUPPORT && (USB || USB_GADGET) && USB && ARCH_ZYNQ && USB_EHCI_XUSBPS && USB_GADGET_XUSBPS && USB_OTG)
mm/slab.h:111:1: warning: control reaches end of non-void function [-Wreturn-type]

[sparse]
net/bridge/br_multicast.c:265:17: sparse: incorrect type in assignment (different address spaces)
drivers/net/ethernet/brocade/bna/bna_tx_rx.c:1932:17: sparse: incorrect type in initializer (different base types)
drivers/net/ethernet/brocade/bna/bna_tx_rx.c:3260:9: sparse: too many warnings
net/bridge/br_multicast.c:677:54: sparse: incorrect type in argument 3 (different address spaces)
crypto/asymmetric_keys/efi_test.c:20:12: sparse: symbol 'efi_keyring' was not declared. Should it be static?
drivers/dma/pl330.c:2085:34: sparse: incorrect type in argument 3 (different type sizes)
drivers/tty/serial/amba-pl011.c:1075:13: sparse: context imbalance in 'pl011_rx_chars' - unexpected unlock
drivers/gpio/gpio-pl061.c:26:11: sparse: unable to open 'asm/mach/irq.h'
include/uapi/linux/swab.h:60:33: sparse: not a function <noident>
include/uapi/linux/swab.h:71:33: sparse: too many errors
drivers/dma/virt-dma.c:22:14: sparse: symbol 'vchan_tx_submit' was not declared. Should it be static?
include/uapi/linux/swab.h:60:16: sparse: undefined identifier '__builtin_bswap32'
include/uapi/linux/swab.h:71:16: sparse: undefined identifier '__builtin_bswap64'

[smatch]
net/bridge/br_mdb.c:330 br_mdb_add_group() error: potential null dereference 'mp'.  (br_multicast_new_group returns null)

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
