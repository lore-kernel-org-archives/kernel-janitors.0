From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 03 Aug 2013 16:04:22 +0000
Subject: build regressions 2013-08-03
Message-Id: <51fd2a06.WrcDRlQ+xqbIB97F%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/kernel/tsc.c:573:4: error: implicit declaration of function 'cpufreq_scale' [-Werror=implicit-function-declaration]
drivers/cpufreq/cpufreq.c:273:15: error: 'loops_per_jiffy' undeclared (first use in this function)
fs/f2fs/acl.c:91:21: error: 'struct posix_acl_entry' has no member named 'e_id'
fs/f2fs/acl.c:129:47: error: 'const struct posix_acl_entry' has no member named 'e_id'

[warnings]
mm/madvise.c:101: warning: integer constant is too large for 'long' type
mm/madvise.c:105: warning: integer constant is too large for 'long' type
mm/madvise.c:109: warning: integer constant is too large for 'long' type
mm/memory.c:3231: warning: integer constant is too large for 'long' type
mm/memory.c:3261: warning: integer constant is too large for 'long' type
<stdin>:1226:2: warning: #warning syscall remap_anon_pages not implemented [-Wcpp]
mm/huge_memory.c:1481:17: warning: unused variable 'page' [-Wunused-variable]

[sparse]
drivers/usb/serial/mos7840.c:2193:46: sparse: incorrect type in initializer (different base types) @@    expected unsigned short [unsigned] [usertype] product @@    got  short [unsigned] [usertype] product @@
kernel/sched/fair.c:1172:16: sparse: no member 'numa_next_reset' in struct mm_struct
fs/f2fs/f2fs.h:920:28: sparse: multiple definitions for function 'file_inode'
fs/f2fs/dir.c:694:10: sparse: unknown field name in initializer
fs/f2fs/file.c:42:9: sparse: undefined identifier 'vfs_check_frozen'
fs/f2fs/inode.c:269:9: sparse: undefined identifier 'end_writeback'
fs/f2fs/namei.c:194:32: sparse: unknown field name in initializer
fs/f2fs/super.c:369:57: sparse: undefined identifier 'PDE'
fs/f2fs/gc.c:47:28: sparse: no member 's_frozen' in struct super_block
fs/f2fs/gc.h:100:37: sparse: no member 'rq' in struct request_queue

[coccinelle]
arch/x86/kernel/sysfb.c:68:8-14: WARNING: PTR_RET can be used
arch/x86/kernel/sysfb_simplefb.c:91:1-3: WARNING: PTR_RET can be used

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
