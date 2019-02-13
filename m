From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 13 Feb 2019 01:42:00 +0000
Subject: [PATCH net-next] net: sched: remove duplicated include from cls_api.c
Message-Id: <20190213014200.120305-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/sched/cls_api.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/sched/cls_api.c b/net/sched/cls_api.c
index 02cf6d2fa0e1..774b663e07f1 100644
--- a/net/sched/cls_api.c
+++ b/net/sched/cls_api.c
@@ -38,7 +38,6 @@
 #include <net/tc_act/tc_csum.h>
 #include <net/tc_act/tc_gact.h>
 #include <net/tc_act/tc_skbedit.h>
-#include <net/tc_act/tc_mirred.h>
 
 extern const struct nla_policy rtm_tca_policy[TCA_MAX + 1];
