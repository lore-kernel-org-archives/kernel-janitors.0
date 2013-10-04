From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 04 Oct 2013 18:20:26 +0000
Subject: build regressions 2013-10-04
Message-Id: <524f06ea.Q6/iLvLFTU24zhk/%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/namei.c:3756:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]
fs/utimes.c:110:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]
fs/open.c:486:3: error: implicit declaration of function 'break_deleg_wait' [-Werror=implicit-function-declaration]
drivers/gpu/drm/nouveau/core/engine/software/nv50.c:212:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
drivers/gpu/drm/nouveau/core/engine/software/nvc0.c:219:1: internal compiler error: in expand_expr_real_1, at expr.c:10478
include/linux/fs.h:2045:81: error: conflicting types for 'inode'
drivers/staging/lustre/lustre/lvfs/lvfs_linux.c:222:2: error: too few arguments to function 'vfs_rename'
drivers/tty/serial/sccnxp.c:910:3: error: assignment of read-only member 'pdata'

[warnings]
drivers/net/wireless/ath/ath10k/mac.c:2853:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
drivers/net/wireless/ath/ath10k/mac.c:2883:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/namei.c:3684:4: warning: passing argument 2 of 'try_break_deleg' from incompatible pointer type [enabled by default]
fs/attr.c:266:2: warning: passing argument 2 of 'try_break_deleg' from incompatible pointer type [enabled by default]
include/linux/fs.h:2045:63: warning: 'struct delegated_inode' declared inside parameter list [enabled by default]
include/linux/fs.h:2045:63: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]

[sparse]
drivers/staging/lustre/lustre/lvfs/lvfs_linux.c:222:15: sparse: not enough arguments for function vfs_rename

[coccinelle]
drivers/media/dvb-frontends/cx24117.c:1211:2-8: preceding lock on line 1202

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
