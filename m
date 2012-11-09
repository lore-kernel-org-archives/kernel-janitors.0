From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 09 Nov 2012 17:23:53 +0000
Subject: build regressions 2012-11-09
Message-Id: <509d3c29.8PS3Hp3whtRHxw9y%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
mm/rmap.c:59:23: error: linux/rtm.h: No such file or directory
mm/rmap.c:110: error: implicit declaration of function '_xtest'
mm/mmap.c:34:23: error: linux/rtm.h: No such file or directory
mm/mmap.c:2155: error: implicit declaration of function 'disable_txn'
mm/mmap.c:2159: error: implicit declaration of function 'reenable_txn'
mm/mprotect.c:26:23: error: linux/rtm.h: No such file or directory
mm/mprotect.c:265: error: implicit declaration of function 'disable_txn'
mm/mprotect.c:333: error: implicit declaration of function 'reenable_txn'
arch/x86/mm/hugetlbpage.c:299:20: error: 'mm' undeclared (first use in this function)
include/linux/shm.h:57:20: error: redefinition of 'do_shmat'
include/linux/shm.h:63:19: error: redefinition of 'is_file_shm_hugepages'
include/linux/shm.h:67:20: error: redefinition of 'exit_shm'
mm/mmap.c:1878:6: error: 'mm' undeclared (first use in this function)
mm/mmap.c:1158:15: error: 'MAP_HUGE_SHIFT' undeclared (first use in this function)
mm/mmap.c:1158:33: error: 'MAP_HUGE_MASK' undeclared (first use in this function)
arch/sh/mm/mmap.c:50:16: error: unused variable 'start_addr' [-Werror=unused-variable]
arch/sparc/kernel/sys_sparc_32.c:41:26: error: unused variable 'vmm' [-Werror=unused-variable]
arch/sparc/kernel/sys_sparc_64.c:103:16: error: unused variable 'start_addr' [-Werror=unused-variable]
arch/sparc/kernel/sys_sparc_64.c:205:20: error: 'do_colour_align' undeclared (first use in this function)
arch/sparc/kernel/sys_sparc_64.c:205:51: error: 'shm_align_mask' undeclared (first use in this function)
arch/sparc/mm/hugetlbpage.c:63:25: error: unused variable 'vma' [-Werror=unused-variable]
arch/tile/mm/hugetlbpage.c:256:20: error: 'mm' undeclared (first use in this function)
mm/mmap.c:34:23: fatal error: linux/rtm.h: No such file or directory
mm/mprotect.c:26:23: fatal error: linux/rtm.h: No such file or directory
kernel/sysctl.c:282:13: error: 'max_lbr_stack' undeclared here (not in a function)
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/aes-x86_64.ko := ' > arch/x86/crypto/.aes-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/cast6-avx-x86_64.ko := ' > arch/x86/crypto/.cast6-avx-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/ghash-clmulni-intel.ko := ' > arch/x86/crypto/.ghash-clmulni-intel.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/serpent-avx-x86_64.ko := ' > arch/x86/crypto/.serpent-avx-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/blowfish-x86_64.ko := ' > arch/x86/crypto/.blowfish-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/serpent-sse2-x86_64.ko := ' > arch/x86/crypto/.serpent-sse2-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/sha1-ssse3.ko := ' > arch/x86/crypto/.sha1-ssse3.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_arch/x86/crypto/twofish-x86_64.ko := ' > arch/x86/crypto/.twofish-x86_64.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_crypto/cast5_generic.ko := ' > crypto/.cast5_generic.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_crypto/cast6_generic.ko := ' > crypto/.cast6_generic.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_crypto/hmac.ko := ' > crypto/.hmac.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_crypto/md5.ko := ' > crypto/.md5.ko.cmd'
/bin/bash: -c: line 0: `set -e;  ; echo 'cmd_crypto/sha1_generic.ko := ' > crypto/.sha1_generic.ko.cmd'

[warnings]
drivers/virtio/virtio_balloon.c:142:4: warning: format '%zu' expects argument of type 'size_t', but argument 3 has type 'long unsigned int' [-Wformat]
mm/page_alloc.c:5825:15: warning: unused variable 'zone' [-Wunused-variable]
drivers/md/dm-integrity.c:238:3: warning: comparison of distinct pointer types lacks a cast [enabled by default]
fs/binfmt_elf.c:574:18: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/of/fdt.c:490:10: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
drivers/md/dm-integrity.c:407:1: warning: 'dm_int_verify_io' uses dynamic stack allocation [enabled by default]
drivers/md/dm-integrity.c:391:1: warning: 'dm_int_calc_hmac' uses dynamic stack allocation [enabled by default]
WARNING: security/integrity/built-in.o(.text+0x824c): Section mismatch in reference from the function integrity_init_keyring() to the variable .init.data:ima_use_tcb
arch/x86/kernel/cpu/perf_event_intel_lbr.c:349:3: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 5 has type 'long unsigned int' [-Wformat]
kernel/cgroup_freezer.c:479:2: warning: initialization from incompatible pointer type [enabled by default]
kernel/cgroup_freezer.c:479:2: warning: (near initialization for 'freezer_subsys.post_create') [enabled by default]
drivers/scsi/tmscsim.h:389:0: warning: "INTERRUPT" redefined [enabled by default]
drivers/video/sis/sis_accel.h:53:0: warning: "BR" redefined [enabled by default]
drivers/tty/synclinkmp.c:359:0: warning: "SAR" redefined [enabled by default]
drivers/net/ethernet/smsc/smc91c92_cs.c:218:0: warning: "INTERRUPT" redefined [enabled by default]
drivers/net/fddi/skfp/h/cmtdef.h:112:0: warning: "PS" redefined [enabled by default]
arch/xtensa/include/asm/regs.h:59:0: warning: "PS" redefined [enabled by default]
drivers/net/fddi/skfp/smt.c:1415:14: warning: array subscript is above array bounds [-Warray-bounds]
drivers/net/fddi/skfp/cfm.c:507:13: warning: array subscript is above array bounds [-Warray-bounds]
include/linux/sh_dma.h:74:0: warning: "SAR" redefined [enabled by default]
drivers/net/hippi/rrunner.h:482:0: warning: "INTERRUPT" redefined [enabled by default]

[sparse]
drivers/block/drbd/drbd_interval.h:12:22: sparse: dubious one-bit signed bitfield
drivers/block/drbd/drbd_proc.c:246:30: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_worker.c:1627:38: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_receiver.c:4408:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_int.h:2066:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_req.c:349:22: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_main.c:854:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_nl.c:263:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_state.c:494:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/block/drbd/drbd_actlog.c:138:14: sparse: incompatible types in comparison expression (different address spaces)
drivers/virtio/virtio_balloon.c:374:5: sparse: symbol 'virtballoon_migratepage' was not declared. Should it be static?
net/bluetooth/hci_core.c:683:19: sparse: incorrect type in assignment (different base types)
drivers/md/dm-integrity.c:360:22: sparse: bad constant expression
drivers/md/dm-integrity.c:435:60: sparse: cannot size expression
arch/x86/mm/hugetlbpage.c:299:27: sparse: undefined identifier 'mm'

[smatch]
drivers/block/drbd/drbd_state.c:536 is_valid_state() error: we previously assumed 'nc' could be null (see line 495)
drivers/input/tablet/wacom_sys.c:1102 wacom_wireless_work() error: potential NULL dereference 'wacom_wac2->input'.
drivers/input/tablet/wacom_sys.c:1105 wacom_wireless_work() error: potential NULL dereference 'wacom_wac1->input'.
drivers/virtio/virtio_balloon.c:159 fill_balloon() warn: inconsistent returns mutex:&vb->balloon_lock: locked (156) unlocked (159)
sound/soc/codecs/wm0010.c:477 wm0010_firmware_load() warn: possible memory leak of 'out'

[coccinelle]
drivers/block/drbd/drbd_state.c:216:1-7: preceding lock on line 158
drivers/md/dm-integrity.c:730:5-11: inconsistent IS_ERR and PTR_ERR, PTR_ERR on line 732

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
