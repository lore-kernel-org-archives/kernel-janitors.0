From: Colin King <colin.king@canonical.com>
Date: Sun, 05 May 2019 21:50:19 +0000
Subject: [PATCH][next] taprio: add null check on sched_nest to avoid potential null pointer dereference
Message-Id: <20190505215019.4639-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to nla_nest_start_noflag can return a null pointer and currently
this is not being checked and this can lead to a null pointer dereference
when the null pointer sched_nest is passed to function nla_nest_end. Fix
this by adding in a null pointer check.

Addresses-Coverity: ("Dereference null return value")
Fixes: a3d43c0d56f1 ("taprio: Add support adding an admin schedule")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sched/sch_taprio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 539677120b9f..9ecfb8f5902a 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -1087,6 +1087,8 @@ static int taprio_dump(struct Qdisc *sch, struct sk_buff *skb)
 		goto done;
 
 	sched_nest = nla_nest_start_noflag(skb, TCA_TAPRIO_ATTR_ADMIN_SCHED);
+	if (!sched_nest)
+		goto options_error;
 
 	if (dump_schedule(skb, admin))
 		goto admin_error;
-- 
2.20.1
