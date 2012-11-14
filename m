From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 14 Nov 2012 16:07:45 +0000
Subject: build regressions 2012-11-14
Message-Id: <50a3c1d1.o5WHLE41L9JgKFh8%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/page-flags-layout.h:5:30: fatal error: generated/bounds.h: No such file or directory
drivers/block/drbd/drbd_receiver.c:4057:10: error: 'mdev' undeclared (first use in this function)
drivers/media/v4l2-core/videobuf2-dma-contig.c:194:2: error: implicit declaration of function 'dma_mmap_coherent' [-Werror=implicit-function-declaration]
drivers/media/v4l2-core/videobuf2-dma-contig.c:382:2: error: implicit declaration of function 'dma_get_sgtable' [-Werror=implicit-function-declaration]
kernel/bounds.c:21:2: error: 'CONFIG_NR_CPUS' undeclared (first use in this function)
ERROR: ".dma_common_get_sgtable" undefined!
net/netfilter/ipvs/ip_vs_core.c:945:21: error: 'IP6T_FH_F_FRAG' undeclared (first use in this function)
ERROR: "sms_ir_exit" undefined!
ERROR: "sms_ir_event" undefined!
ERROR: "sms_ir_init" undefined!
net/mac80211/rc80211_minstrel_ht.c:422:42: error: expected ';' before ')' token
net/mac80211/rc80211_minstrel_ht.c:422:42: error: expected statement before ')' token
videobuf2-dma-contig.c:(.text+0x2f231e): undefined reference to `dma_common_get_sgtable'

[warnings]
mm/memory.c:74:2: warning: #warning Unfortunate NUMA config, growing page-frame for last_cpu. [-Wcpp]
fs/btrfs/file-item.c:171:2: warning: 'len' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/firmware/efivars.c:838:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/firmware/efivars.c:838:2: warning: (near initialization for 'efi_pstore_info.erase') [enabled by default]
drivers/firmware/efivars.c:841:2: warning: (near initialization for 'efi_pstore_info.write') [enabled by default]
drivers/regulator/gpio-regulator.c:187:3: warning: passing argument 1 of 'dev_err' from incompatible pointer type [enabled by default]

[sparse]
mm/memory.c:74:2: sparse: Unfortunate NUMA config, growing page-frame for last_cpu.
drivers/scsi/be2iscsi/be_main.c:156:1: sparse: symbol 'dev_attr_beiscsi_drvr_ver' was not declared. Should it be static?
drivers/scsi/be2iscsi/be_main.c:4349:5: sparse: symbol 'beiscsi_iotask_v2' was not declared. Should it be static?
arch/x86/kernel/cpu/intel_cacheinfo.c:167:33: sparse: symbol 'num_cache_leaves' was not declared. Should it be static?
drivers/staging/fwserial/fwserial.h:356:19: sparse: symbol 'fwtty_driver' was not declared. Should it be static?

[smatch]
drivers/staging/comedi/drivers/addi-data/addi_common.c:166 addi_auto_attach() error: we previously assumed 'this_board->pc_EepromChip' could be null (see line 121)
drivers/staging/fwserial/fwserial.c:1306 get_serial_info() warn: check that 'tmp.port' doesn't leak information
drivers/staging/vt6656/rxtx.c:1536 s_bPacketToWirelessUsb() warn: variable dereferenced before check 'pTransmitKey' (see line 1536)
drivers/staging/vt6656/iwctl.c:660 iwctl_giwaplist() warn: possible memory leak of 'qual'
drivers/staging/vt6656/iwctl.c:660 iwctl_giwaplist() warn: possible memory leak of 'sock'

[coccinelle]
arch/x86/kernel/cpuid.c:152:8-14: WARNING: PTR_RET can be used
block/ioctl.c:66:10-16: WARNING: PTR_RET can be used
drivers/media/rc/imon.c:1058:1-7: preceding lock on line 1044
drivers/media/radio/si470x/radio-si470x-i2c.c:444:10-30: ERROR: Threaded IRQ with no primary handler requested without IRQF_ONESHOT
drivers/net/ethernet/amd/ni65.c:1243:8-14: WARNING: PTR_RET can be used
drivers/net/ethernet/i825xx/3c507.c:925:8-14: WARNING: PTR_RET can be used
drivers/staging/media/lirc/lirc_bt829.c:161:21-22: WARNING comparing pointer to 0
drivers/staging/media/go7007/go7007-usb.c:591:6-63: duplicated argument to && or ||
drivers/staging/media/go7007/go7007-i2c.c:140:1-7: preceding lock on line 76
drivers/staging/media/solo6x10/v4l2.c:418:1-3: WARNING: PTR_RET can be used
drivers/hid/uhid.c:146:17-24: WARNING opportunity for memdup_user
drivers/staging/csr/drv.c:1748:14-23: WARNING: casting value returned by k[cmz]alloc to (udi_log_t *) is useless.
drivers/staging/csr/netdev.c:2525:21-42: WARNING: casting value returned by k[cmz]alloc to (rx_buffered_packets_t *) is useless.
drivers/staging/csr/sdio_mmc.c:907:16-31: WARNING: casting value returned by k[cmz]alloc to (CsrSdioFunction *) is useless.
drivers/staging/csr/unifi_pdu_processing.c:3199:26-47: WARNING: casting value returned by k[cmz]alloc to (tx_buffered_packets_t *) is useless.

[cppcheck]
arch/powerpc/platforms/cell/spufs/file.c:1138: error: unsupported page size
arch/powerpc/include/asm/hw_irq.h:138: style: Statements following return, break, continue, goto or throw will never be executed.
include/asm-generic/cmpxchg-local.h:24: warning: Redundant code: Found a statement that begins with numeric constant
include/asm-generic/cmpxchg-local.h:24: error: Uninitialized variable: __dummy

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
