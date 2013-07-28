From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 28 Jul 2013 05:51:29 +0000
Subject: build regressions 2013-07-27
Message-Id: <51f4b161.uiuvFifh1uZMCLdq%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
include/linux/jiffies.h:60:39: error: division by zero in #if
include/linux/ktime.h:162:18: error: 'NSEC_PER_SEC' undeclared (first use in this function)
include/linux/ktime.h:187:21: error: 'NSEC_PER_SEC' undeclared (first use in this function)
include/linux/ktime.h:217:63: error: parameter 1 ('ts') has incomplete type
include/linux/ktime.h:229:61: error: parameter 1 ('tv') has incomplete type
include/linux/ktime.h:233:8: error: 'NSEC_PER_USEC' undeclared (first use in this function)
include/linux/ktime.h:242:31: error: return type is an incomplete type
include/linux/ktime.h:244:17: error: unknown field 'tv_sec' specified in initializer
include/linux/ktime.h:245:8: error: unknown field 'tv_nsec' specified in initializer
include/linux/ktime.h:254:30: error: return type is an incomplete type
include/linux/ktime.h:257:3: error: unknown field 'tv_sec' specified in initializer
include/linux/ktime.h:258:3: error: unknown field 'tv_usec' specified in initializer
include/linux/ktime.h:258:42: error: 'NSEC_PER_USEC' undeclared (first use in this function)
include/linux/ktime.h:269:27: error: 'NSEC_PER_SEC' undeclared (first use in this function)
include/linux/ktime.h:307:9: error: variable 'tv' has initializer but incomplete type
include/linux/ktime.h:307:17: error: storage size of 'tv' isn't known
include/linux/ktime.h:308:27: error: 'USEC_PER_SEC' undeclared (first use in this function)
include/linux/ktime.h:313:9: error: variable 'tv' has initializer but incomplete type
include/linux/ktime.h:313:17: error: storage size of 'tv' isn't known
include/linux/ktime.h:314:27: error: 'MSEC_PER_SEC' undeclared (first use in this function)
include/linux/ktime.h:314:55: error: 'USEC_PER_MSEC' undeclared (first use in this function)
include/linux/ktime.h:324:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
include/linux/ktime.h:329:33: error: 'NSEC_PER_MSEC' undeclared (first use in this function)
include/linux/ktime.h:334:33: error: 'NSEC_PER_USEC' undeclared (first use in this function)
include/linux/ktime.h:351:3: error: dereferencing pointer to incomplete type
include/asm-generic/cmpxchg-local.h:24:2: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
include/asm-generic/cmpxchg-local.h:45:2: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
arch/m68k/include/asm/cmpxchg.h:16:2: error: implicit declaration of function 'local_irq_save' [-Werror=implicit-function-declaration]
arch/m68k/include/asm/cmpxchg.h:39:2: error: implicit declaration of function 'local_irq_restore' [-Werror=implicit-function-declaration]
fs/ext4/ialloc.c:792:4: error: label 'next_inode' used but not defined

[warnings]
include/linux/jiffies.h:256:10: warning: "NSEC_PER_SEC" is not defined [-Wundef]
include/linux/jiffies.h:256:31: warning: "NSEC_PER_SEC" is not defined [-Wundef]
include/linux/jiffies.h:302:54: warning: 'struct timeval' declared inside parameter list [enabled by default]
include/linux/jiffies.h:302:54: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
include/linux/jiffies.h:304:18: warning: 'struct timeval' declared inside parameter list [enabled by default]
include/linux/ktime.h:217:23: warning: function declaration isn't a prototype [-Wstrict-prototypes]
include/linux/ktime.h:229:53: warning: 'struct timeval' declared inside parameter list [enabled by default]
include/linux/ktime.h:229:23: warning: function declaration isn't a prototype [-Wstrict-prototypes]
include/linux/ktime.h:244:17: warning: excess elements in struct initializer [enabled by default]
include/linux/ktime.h:244:17: warning: (near initialization for '(anonymous)') [enabled by default]
include/linux/ktime.h:245:8: warning: excess elements in struct initializer [enabled by default]
include/linux/ktime.h:245:8: warning: (near initialization for '(anonymous)') [enabled by default]
include/linux/ktime.h:244:2: warning: 'return' with a value, in function returning void [enabled by default]
include/linux/ktime.h:257:3: warning: excess elements in struct initializer [enabled by default]
include/linux/ktime.h:257:3: warning: (near initialization for '(anonymous)') [enabled by default]
include/linux/ktime.h:258:3: warning: excess elements in struct initializer [enabled by default]
include/linux/ktime.h:258:3: warning: (near initialization for '(anonymous)') [enabled by default]
include/linux/ktime.h:256:2: warning: 'return' with a value, in function returning void [enabled by default]
fs/ext4/ialloc.c:817:1: warning: label 'next_ino' defined but not used [-Wunused-label]
drivers/usb/serial/mos7840.c:2221:30: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/usb/serial/mos7840.c:2228:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/usb/serial/mos7840.c:2239:20: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/tty/serial/pch_uart.c:431:10: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
WARNING: drivers/built-in.o(.text+0x14b9cf): Section mismatch in reference from the function pch_uart_pci_probe() to the variable .init.data:pch_uart_dmi_table
fs/btrfs/extent_io.c:2908:11: warning: 'start' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/btrfs/extent_io.c:2945:29: warning: 'first_index' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
fs/ext4/ialloc.c:632:5: sparse: symbol 'recently_deleted' was not declared. Should it be static?
fs/ext4/ialloc.c:792:25: sparse: label 'next_inode' was not declared
kernel/context_tracking.c:31:14: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:32:17: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:65:14: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got int enum void const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:66:21: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:90:17: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got int enum void const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:154:13: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got int enum void const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:155:21: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got const [noderef] <asn:3>*__vpp_verify @@
kernel/context_tracking.c:163:17: sparse: incorrect type in initializer (different address spaces) @@    expected void const [noderef] <asn:3>*__vpp_verify @@    got int enum void const [noderef] <asn:3>*__vpp_verify @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
