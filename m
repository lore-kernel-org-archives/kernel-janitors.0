From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 18 Aug 2013 16:07:46 +0000
Subject: build regressions 2013-08-18
Message-Id: <5210f152.rULvXhwTmSBBJ1wB%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
cx23885-dvb.c:(.text+0x26060c): undefined reference to `tda18271_attach'
cx23885-dvb.c:(.text+0x2627ae): undefined reference to `tda18271_attach'

[warnings]
include/trace/events/rcu.h:202:20: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/rcu.h:204:19: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/rcu.h:202:20: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
include/trace/events/rcu.h:204:19: warning: assignment discards 'const' qualifier from pointer target type [enabled by default]
kernel/rcutree_plugin.h:2150:7: warning: passing argument 1 of 'atomic_read' from incompatible pointer type [enabled by default]
kernel/rcutree_plugin.h:2151:7: warning: passing argument 1 of 'atomic_read' from incompatible pointer type [enabled by default]
kernel/rcutree_plugin.h:2154:8: warning: passing argument 1 of 'atomic_read' from incompatible pointer type [enabled by default]
kernel/rcutree_plugin.h:2155:8: warning: passing argument 1 of 'atomic_read' from incompatible pointer type [enabled by default]

[sparse]
drivers/usb/serial/mos7720.c:385:33: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] wValue @@    got 16 [usertype] wValue @@
drivers/usb/serial/mos7720.c:386:33: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] wIndex @@    got 16 [usertype] wIndex @@
security/keys/keyring.c:511:50: sparse: incorrect type in initializer (different address spaces) @@    expected struct cred const *cred @@    got struct cred conststruct cred const *cred @@
arch/x86/kernel/cpu/perf_event_intel_ds.c:874:56: sparse: constant 0xff00000000 is so big it is long
drivers/net/usb/r8152.c:1020:29: sparse: incorrect type in assignment (different base types) @@    expected unsigned int [unsigned] [usertype] opts2 @@    got ed int [unsigned] [usertype] opts2 @@
drivers/net/usb/r8152.c:906:25: sparse: cast to restricted __le16
include/trace/events/rcu.h:189:1: sparse: incorrect type in assignment (different modifiers) @@    expected char *rcuname @@    got char cchar *rcuname @@
include/trace/events/rcu.h:189:1: sparse: incorrect type in assignment (different modifiers) @@    expected char *reason @@    got char cchar *reason @@
include/trace/events/rcu.h:189:1: sparse: incorrect type in assignment (different modifiers) @@    expected char *rcuname @@    got char cchar *rcuname @@
include/trace/events/rcu.h:189:1: sparse: incorrect type in assignment (different modifiers) @@    expected char *reason @@    got char cchar *reason @@
kernel/rcutree_plugin.h:2150:56: sparse: incorrect type in argument 1 (different base types) @@    expected struct atomic_t const [usertype] *v @@    got  const [usertype] *v @@
kernel/rcutree_plugin.h:2151:56: sparse: incorrect type in argument 1 (different base types) @@    expected struct atomic_t const [usertype] *v @@    got  const [usertype] *v @@
kernel/rcutree_plugin.h:2154:50: sparse: incorrect type in argument 1 (different base types) @@    expected struct atomic_t const [usertype] *v @@    got  const [usertype] *v @@
kernel/rcutree_plugin.h:2155:50: sparse: incorrect type in argument 1 (different base types) @@    expected struct atomic_t const [usertype] *v @@    got  const [usertype] *v @@
drivers/target/iscsi/iscsi_target_nego.c:407:6: sparse: symbol 'iscsi_target_set_sock_callbacks' was not declared. Should it be static?
drivers/target/iscsi/iscsi_target_nego.c:424:6: sparse: symbol 'iscsi_target_restore_sock_callbacks' was not declared. Should it be static?
mm/hugetlb.c:545:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:547:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:579:56: sparse: incorrect type in argument 3 (different base types) @@    expected restricted gfp_t [usertype] gfp_flags @@    got e] gfp_flags @@
mm/hugetlb.c:545:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:547:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:583:71: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] gfp_mask @@    got e] gfp_mask @@
mm/hugetlb.c:545:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:547:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:749:36: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:749:47: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:750:49: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:750:62: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:750:61: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] gfp_mask @@    got  [usertype] gfp_mask @@
mm/hugetlb.c:545:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:547:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:976:55: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:977:36: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:977:49: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:977:48: sparse: incorrect type in argument 1 (different base types) @@    expected restricted gfp_t [usertype] gfp_mask @@    got  [usertype] gfp_mask @@
mm/hugetlb.c:545:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:547:24: sparse: incorrect type in return expression (different base types) @@    expected int @@    got restricted gfint @@
mm/hugetlb.c:981:44: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:981:55: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:982:25: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:982:38: sparse: restricted gfp_t degrades to integer
mm/hugetlb.c:982:37: sparse: incorrect type in argument 2 (different base types) @@    expected restricted gfp_t [usertype] gfp_mask @@    got  [usertype] gfp_mask @@
drivers/staging/vt6656/rxtx.c:843:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:858:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:652:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:700:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:728:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:760:37: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:788:29: sparse: incorrect type in assignment (different base types) @@    expected restricted __le16 [usertype] duration @@    got unsignedrestricted __le16 [usertype] duration @@
drivers/staging/vt6656/rxtx.c:489:16: sparse: incorrect type in return expression (different base types) @@    expected unsigned short @@    got restricted __leunsigned short @@
drivers/media/v4l2-core/v4l2-ctrls.c:559:17: sparse: duplicate const
drivers/media/v4l2-core/v4l2-ctrls.c:568:17: sparse: symbol 'v4l2_ctrl_get_int_menu' was not declared. Should it be static?

[coccinelle]
net/tipc/server.c:422:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
