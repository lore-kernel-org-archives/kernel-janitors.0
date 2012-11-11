From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 11 Nov 2012 20:58:41 +0000
Subject: build regressions 2012-11-11
Message-Id: <50a01181.9WwOQ0PQ/WfNPJGZ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/signal.c:1164:9: error: implicit declaration of function 'task_pt_regs' [-Werror=implicit-function-declaration]
fs/coredump.c:477:3: error: implicit declaration of function 'task_pt_regs' [-Werror=implicit-function-declaration]
kernel/signal.c:2144:2: error: implicit declaration of function 'ptrace_signal_deliver' [-Werror=implicit-function-declaration]
kernel/signal.c:2362:4: error: too few arguments to function 'do_coredump'
drivers/net/can/usb/peak_usb/pcan_usb_core.h:134:6: error: conflicting types for 'dump_mem'
drivers/net/can/usb/peak_usb/pcan_usb_core.c:56:6: error: conflicting types for 'dump_mem'

[warnings]
kernel/signal.c:1164:25: warning: initialization makes pointer from integer without a cast [enabled by default]
fs/coredump.c:477:3: warning: initialization makes pointer from integer without a cast [enabled by default]
fs/coredump.c:477:3: warning: (near initialization for 'cprm.regs') [enabled by default]
kernel/user_namespace.c:157:6: warning: 'first' may be used uninitialized in this function [-Wmaybe-uninitialized]

[sparse]
fs/nfsd/nfs4callback.c:645:17: sparse: symbol 'get_backchannel_cred' was not declared. Should it be static?
fs/jbd2/commit.c:351:18: sparse: incorrect type in assignment (different base types)
fs/jbd2/journal.c:117:16: sparse: incorrect type in return expression (different base types)
fs/jbd2/journal.c:125:18: sparse: restricted __be32 degrades to integer
fs/jbd2/journal.c:120:5: sparse: symbol 'jbd2_superblock_csum_verify' was not declared. Should it be static?
fs/jbd2/journal.c:128:6: sparse: symbol 'jbd2_superblock_csum_set' was not declared. Should it be static?
fs/jbd2/recovery.c:193:20: sparse: cast to restricted __be32
fs/jbd2/recovery.c:411:20: sparse: cast from restricted __be16
fs/jbd2/recovery.c:413:28: sparse: restricted __be32 degrades to integer

[smatch]
security/apparmor/apparmorfs.c:216 __next_namespace() info: loop could be replaced with if statement.
security/apparmor/apparmorfs.c:214 __next_namespace() info: ignoring unreachable code.
security/apparmor/apparmorfs.c:224 __next_namespace() warn: inconsistent returns read_lock:&ns->lock: locked (207,216,224) unlocked (219)
security/apparmor/apparmorfs.c:224 __next_namespace() warn: inconsistent returns read_lock:&next->lock: locked (207) unlocked (216,219,224)
security/apparmor/apparmorfs.c:269 __next_profile() info: loop could be replaced with if statement.
security/apparmor/apparmorfs.c:267 __next_profile() info: ignoring unreachable code.

[coccinelle]
security/apparmor/policy_unpack.c:590:8-34: duplicated argument to && or ||

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
