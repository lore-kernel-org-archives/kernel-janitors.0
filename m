From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 25 Dec 2012 19:36:34 +0000
Subject: build regressions 2012-12-25
Message-Id: <50da0042.OI/NGvXE3kkBqK0q%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/signal.c:2657:12: error: conflicting types for 'do_sigpending'

[warnings]
sound/soc/atmel/atmel-pcm.c:105:2: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
kernel/signal.c:2652:2: warning: passing argument 2 of 'sys_rt_sigprocmask' from incompatible pointer type [enabled by default]
kernel/signal.c:2703:2: warning: passing argument 1 of 'sys_rt_sigpending' from incompatible pointer type [enabled by default]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U6980>.<U68e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U2850>.<U27b8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U3850>.<U37b8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<Ubbe0>.<Ubb48>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<Ub850>.<Ub7b8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U 850>.<U 7b8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U 980>.<U 8e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U9be0>.<U9b48>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]
fs/f2fs/recovery.c:224:52: warning: 'sum.<U9980>.<U98e8>.ofs_in_node' may be used uninitialized in this function [-Wmaybe-uninitialized]

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
