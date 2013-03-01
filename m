From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 01 Mar 2013 17:32:11 +0000
Subject: build regressions 2013-03-01
Message-Id: <5130e61b.7Y0UJVLwAr4QnS4B%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[warnings]
fs/namei.c:3870: warning: 'vfs_whiteout' defined but not used
fs/namei.c:3935: warning: 'do_whiteout' defined but not used
Warning(fs/namei.c:1280): No description found for parameter 'nd'
Warning(fs/namei.c:1280): No description found for parameter 'name'
Warning(fs/namei.c:1280): No description found for parameter 'topmost'
Warning(fs/namei.c:3870): No description found for parameter 'old_path'
Warning(fs/namei.c:3870): No description found for parameter 'isdir'
Warning(fs/namei.c:3870): Excess function parameter 'dentry' description in 'vfs_whiteout'

[sparse]
kernel/posix-timers.c:638:24: sparse: context imbalance in '__lock_timer' - different lock contexts for basic block

[smatch]
fs/union.c:242 union_copyup_one_dirent() error: 'dentry' dereferencing possible ERR_PTR()
fs/open.c:92 vfs_truncate() error: we previously assumed 'parent' could be null (see line 79)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
