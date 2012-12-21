From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Dec 2012 22:22:33 +0000
Subject: build regressions 2012-12-21
Message-Id: <50d4e129.e2oJApoShzasXAau%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/nfs/inode.c:887:2: error: implicit declaration of function 'nfs_fscache_wait_on_invalidate' [-Werror=implicit-function-declaration]
init/init_task.c:16:8: error: (near initialization for 'init_task.sched_info.pcount')
drivers/gpu/drm/i915/intel_display.c:1536:3: error: 'value' undeclared (first use in this function)
init/init_task.c:16:8: error: (near initialization for 'init_task.ftrace_timestamp')
arch/ia64/kernel/init_task.c:38:2: error: implicit declaration of function 'INIT_VTIME' [-Werror=implicit-function-declaration]
arch/ia64/kernel/init_task.c:38:2: error: initializer element is not constant
arch/ia64/kernel/init_task.c:38:2: error: (near initialization for 'init_task_mem.s.task.vfork_done')
arch/ia64/kernel/init_task.c:38:2: error: (near initialization for 'init_task_mem.s.task.cpuset_mem_spread_rotor')
init/init_task.c:16:8: error: (near initialization for 'init_task.vfork_done')
arch/s390/kernel/vtime.c:148:1: error: 'vtime_account' undeclared here (not in a function)
fs/hpfs/inode.c:285:3: error: implicit declaration of function 'hpfs_truncate' [-Werror=implicit-function-declaration]
kernel/context_tracking.c:99:3: error: implicit declaration of function 'vtime_account_user' [-Werror=implicit-function-declaration]
kernel/sched/cputime.c:448:0: error: unterminated #else
init/init_task.c:16:8: error: implicit declaration of function 'INIT_VTIME' [-Werror=implicit-function-declaration]
init/init_task.c:16:8: error: initializer element is not constant
init/init_task.c:16:8: error: (near initialization for 'init_task.cpuset_mem_spread_rotor')
kernel/context_tracking.c:59:3: error: implicit declaration of function 'vtime_user_enter' [-Werror=implicit-function-declaration]
mm/truncate.c:596:17: error: 'const struct inode_operations' has no member named 'truncate'
init/init_task.c:16:8: error: (near initialization for 'init_task.rcu.next')
kernel/sched/sched.h:948:28: error: 'struct rq' has no member named 'cpu'
init/init_task.c:16:8: error: (near initialization for 'init_task.journal_info')
kernel/time/tick-sched.c:517:6: error: 'have_full_nohz_mask' undeclared (first use in this function)
init/init_task.c:16:8: error: (near initialization for 'init_task.tasks.next')
init/init_task.c:16:8: error: (near initialization for 'init_task.mempolicy')

[warnings]
init/init_task.c:16:8: warning: (near initialization for 'init_task.sched_info') [-Wmissing-braces]
fs/f2fs/segment.c:806:1: warning: control reaches end of non-void function [-Wreturn-type]
drivers/rtc/rtc-max77686.c:147:6: warning: 'data' may be used uninitialized in this function [-Wmaybe-uninitialized]
make[3]: Warning: File `scripts/Makefile.host' has modification time 3.6e+08 s in the future
make[2]: Warning: File `arch/x86/Makefile' has modification time 3.6e+08 s in the future
init/init_task.c:16:8: warning: missing braces around initializer [-Wmissing-braces]
init/init_task.c:16:8: warning: (near initialization for 'init_task.rcu') [-Wmissing-braces]
init/init_task.c:16:8: warning: (near initialization for 'init_task.tasks') [-Wmissing-braces]

[sparse]
fs/btrfs/extent-tree.c:3722:6: sparse: symbol 'btrfs_writeback_inodes_sb_nr' was not declared. Should it be static?
drivers/block/rbd.c:2170:19: sparse: symbol 'rbd_dev_create' was not declared. Should it be static?
drivers/edac/mce_amd.c:68:12: sparse: symbol 'uu_msgs' was not declared. Should it be static?
arch/x86/kernel/apm_32.c:910:38: sparse: incorrect type in argument 3 (different modifiers)
arch/x86/kernel/apm_32.c:910:38: sparse: implicit cast to nocast type
fs/binfmt_elf.c:1326:34: sparse: incorrect type in argument 2 (different modifiers)
fs/binfmt_elf.c:1326:34: sparse: implicit cast to nocast type
kernel/acct.c:597:32: sparse: incorrect type in argument 2 (different modifiers)
kernel/acct.c:597:32: sparse: implicit cast to nocast type
kernel/cpu.c:231:34: sparse: implicit cast to nocast type
kernel/delayacct.c:118:28: sparse: incorrect type in argument 2 (different modifiers)
kernel/delayacct.c:118:28: sparse: implicit cast to nocast type
kernel/sched/cputime.c:313:36: sparse: incorrect type in argument 2 (different modifiers)
kernel/tsacct.c:70:28: sparse: incorrect type in argument 2 (different modifiers)
drivers/video/backlight/lms501kf03.c:421:6: sparse: symbol 'lms501kf03_shutdown' was not declared. Should it be static?
drivers/gpu/drm/i915/intel_display.c:1536:17: sparse: undefined identifier 'value'
fs/hpfs/inode.c:285:17: sparse: undefined identifier 'hpfs_truncate'
init/init_task.c:16:32: sparse: undefined identifier 'INIT_VTIME'
kernel/time/tick-sched.c:518:13: sparse: undefined identifier 'have_full_nohz_mask'

[smatch]
fs/btrfs/ioctl.c:1436 btrfs_ioctl_resize() error: 'device' dereferencing possible ERR_PTR()
drivers/hwmon/nct6775.c:2731 store_auto_temp() warn: '(((__x) - ((__d) / 2)) / (__d))' 18446744073709551 can't fit into 255 'data->auto_temp[nr][point]'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
