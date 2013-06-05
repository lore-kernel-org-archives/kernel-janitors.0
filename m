From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 05 Jun 2013 16:19:41 +0000
Subject: build regressions 2013-06-05
Message-Id: <51af651d.Fcv8KiiPf/zInFQ2%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
dvb-bt8xx.c:(.text+0x24c091): undefined reference to `nxt6000_attach'
dvb-bt8xx.c:(.text+0x24c10c): undefined reference to `sp887x_attach'
cx88-dvb.c:(.text.unlikely+0x6953): undefined reference to `or51132_attach'
cx88-dvb.c:(.text.unlikely+0x6b8d): undefined reference to `nxt200x_attach'
cx88-dvb.c:(.text.unlikely+0x70af): undefined reference to `mb86a16_attach'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:227: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:227: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:228: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:228: Error: junk at end of line: `eax'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:235: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:235: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:282: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:282: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:283: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:283: Error: junk at end of line: `eax'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:284: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:284: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:285: Error: Unrecognized opcode: `jge'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:312: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:312: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:320: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:320: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:321: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:321: Error: junk at end of line: `eax'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:322: Error: syntax error; found `e', expected `,'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:322: Error: junk at end of line: `edx'
drivers/staging/lustre/lustre/libcfs/crc32-pclmul_asm.S:323: Error: Unrecognized opcode: `jge'
ERROR: "list_lru_destroy" [fs/xfs/xfs.ko] undefined!

[warnings]
drivers/iio/trigger/iio-trig-interrupt.c:53:2: warning: format '%d' expects argument of type 'int', but argument 2 has type 'resource_size_t' [-Wformat]
drivers/staging/lustre/lustre/llite/lproc_llite.c:386:2: warning: passing argument 3 of 'lprocfs_find_named_value' from incompatible pointer type [enabled by default]
drivers/staging/lustre/lustre/osc/lproc_osc.c:187:2: warning: passing argument 3 of 'lprocfs_find_named_value' from incompatible pointer type [enabled by default]
fs/ext4/inode.c:2211:6: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
drivers/staging/vt6656/wctl.c:76:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:81:56: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:84:52: sparse: cast from restricted __le16
drivers/staging/vt6656/wctl.c:94:30: sparse: incorrect type in assignment (different base types)
drivers/staging/vt6656/wctl.c:96:28: sparse: incorrect type in assignment (different base types)
drivers/staging/vt6656/wctl.c:157:57: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:158:56: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:200:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:205:79: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:206:78: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:227:85: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:228:84: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/wctl.c:247:13: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/rxtx.c:1978:9: sparse: cast from restricted __le16
drivers/staging/vt6656/rxtx.c:2437:9: sparse: cast from restricted __le16
drivers/staging/vt6656/mib.c:331:9: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:333:16: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:335:16: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/mib.c:346:9: sparse: cast from restricted __le16
drivers/staging/vt6656/aes_ccmp.c:285:32: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/aes_ccmp.c:287:32: sparse: restricted __le16 degrades to integer
drivers/staging/vt6656/aes_ccmp.c:295:32: sparse: restricted __le16 degrades to integer
drivers/iio/magnetometer/ak8975.c:330:22: sparse: cast to restricted __le16
drivers/staging/dwc2/platform.c:111:25: sparse: incorrect type in argument 1 (different address spaces)
drivers/staging/dwc2/platform.c:112:37: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/core.c:411:20: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/core.c:412:32: sparse: incorrect type in argument 1 (different address spaces)
drivers/usb/chipidea/udc.c:407:37: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:408:37: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:410:45: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:421:29: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:422:28: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:423:28: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:425:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:427:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:429:43: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:431:29: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:435:36: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:447:46: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:449:45: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:463:32: sparse: incorrect type in assignment (different base types)
drivers/usb/chipidea/udc.c:464:31: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:465:26: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:487:14: sparse: restricted __le32 degrades to integer
drivers/usb/chipidea/udc.c:491:22: sparse: restricted __le32 degrades to integer
drivers/usb/chipidea/udc.c:501:28: sparse: cast to restricted __le32
drivers/usb/chipidea/udc.c:509:30: sparse: cast to restricted __le32
drivers/usb/chipidea/udc.c:1010:34: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:1012:34: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:1014:34: sparse: invalid assignment: &drivers/usb/chipidea/udc.c:1016:26: sparse: invalid assignment: |drivers/usb/chipidea/udc.c:1018:30: sparse: invalid assignment: |drivers/rtc/rtc-ds1286.c:343:24: sparse: incorrect type in argument 1 (different address spaces)
drivers/rtc/rtc-ds1286.c:344:36: sparse: incorrect type in argument 1 (different address spaces)
drivers/spi/spi-pxa2xx.c:1093:23: sparse: incorrect type in argument 1 (different address spaces)
drivers/spi/spi-pxa2xx.c:1094:35: sparse: incorrect type in argument 1 (different address spaces)
drivers/spi/spi-pxa2xx.c:1094:31: sparse: incorrect type in return expression (different base types)
arch/x86/kernel/cpu/perf_event_intel_uncore.c:524:16: sparse: Using plain integer as NULL pointer
fs/proc/base.c:2024:13: sparse: context imbalance in 'timers_start' - wrong count at exit
fs/proc/base.c:2050:36: sparse: context imbalance in 'timers_stop' - unexpected unlock
net/ipv6/icmp.c:375:13: sparse: context imbalance in 'icmp6_send' - different lock contexts for basic block
net/ipv6/icmp.c:375:13: sparse: context imbalance in 'icmp6_send' - different lock contexts for basic block
drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:1722:5: sparse: symbol 'bnx2x_setup_irqs' was not declared. Should it be static?

[coccinelle]
drivers/net/wireless/rtlwifi/pci.c:360:7-12: ERROR: iterator variable bound on line 358 cannot be NULL
drivers/rtc/rtc-pcf8583.c:286:1-3: WARNING: PTR_RET can be used

[cppcheck]
drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:312: error: "Unkown compiler"
drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:312: error: "Unkown compiler"
drivers/staging/lustre/include/linux/libcfs/libcfs_debug.h:312: error: "Unkown compiler"

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
