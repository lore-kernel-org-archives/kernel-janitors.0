From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 19 Oct 2013 16:07:27 +0000
Subject: build regressions 2013-10-19
Message-Id: <5262ae3f.1Y+9kNHQkHj1jr5D%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sysctl_net.c:(.text+0xe657c): undefined reference to `ieee80211_mesh_csa_beacon'
sysctl_net.c:(.text+0xe6c40): undefined reference to `ieee80211_mesh_finish_csa'
dns_query.c:(.text+0x1213dc): undefined reference to `ieee80211_mesh_csa_beacon'
dns_query.c:(.text+0x121bc4): undefined reference to `ieee80211_mesh_finish_csa'
mm/page_alloc.c:1026: error: request for member 'lru' in something not a structure or union
mm/page_alloc.c:1026: error: request for member 'lru' in something not a structure or union
mm/page_alloc.c:1026: error: request for member 'lru' in something not a structure or union
mm/page_alloc.c:1026: error: request for member 'lru' in something not a structure or union
kernel/time/tick-sched.c:1057:2: error: too few arguments to function 'tick_check_nohz'
mm/page_alloc.c:1026:22: error: 'page' undeclared (first use in this function)

[warnings]
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of '__mptr'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of '__mptr'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
mm/page_alloc.c:1026: warning: type defaults to 'int' in declaration of 'type name'
Warning(mm/page_alloc.c:620): No description found for parameter 'page'
Warning(mm/page_alloc.c:620): No description found for parameter 'old_list'
Warning(mm/page_alloc.c:620): No description found for parameter 'new_list'
Warning(mm/page_alloc.c:580): No description found for parameter 'free_list'
Warning(mm/page_alloc.c:521): Cannot understand  *

[coccinelle]
drivers/net/wireless/ath/dfs_pri_detector.c:292:2-8: Replace memcpy with struct assignment

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
