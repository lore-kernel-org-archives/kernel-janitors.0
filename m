From: Yue Haibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 13:58:08 +0000
Subject: [PATCH] sch_cake: Remove unused including <linux/version.h>
Message-Id: <1534859888-170263-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 net/sched/sch_cake.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/sched/sch_cake.c b/net/sched/sch_cake.c
index 35fc725..4d26b08 100644
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@ -64,7 +64,6 @@
 #include <linux/vmalloc.h>
 #include <linux/reciprocal_div.h>
 #include <net/netlink.h>
-#include <linux/version.h>
 #include <linux/if_vlan.h>
 #include <net/pkt_sched.h>
 #include <net/pkt_cls.h>
