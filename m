From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 15:01:30 +0000
Subject: [PATCH][next] mqprio: fix potential null pointer dereference on opt
Message-Id: <20171017150130.23606-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer opt has a null check however before for this check opt is
dereferenced when len is initialized, hence we potentially have a null
pointer deference on opt.  Avoid this by checking for a null opt before
dereferencing it.

Detected by CoverityScan, CID#1458234 ("Dereference before null check")

Fixes: 4e8b86c06269 ("mqprio: Introduce new hardware offload mode and shaper in mqprio")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sched/sch_mqprio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/sched/sch_mqprio.c b/net/sched/sch_mqprio.c
index f1ae9be83934..37d5fd9b617c 100644
--- a/net/sched/sch_mqprio.c
+++ b/net/sched/sch_mqprio.c
@@ -142,7 +142,7 @@ static int mqprio_init(struct Qdisc *sch, struct nlattr *opt)
 	struct nlattr *tb[TCA_MQPRIO_MAX + 1];
 	struct nlattr *attr;
 	int rem;
-	int len = nla_len(opt) - NLA_ALIGN(sizeof(*qopt));
+	int len;
 
 	BUILD_BUG_ON(TC_MAX_QUEUE != TC_QOPT_MAX_QUEUE);
 	BUILD_BUG_ON(TC_BITMASK != TC_QOPT_BITMASK);
@@ -160,6 +160,7 @@ static int mqprio_init(struct Qdisc *sch, struct nlattr *opt)
 	if (mqprio_parse_opt(dev, qopt))
 		return -EINVAL;
 
+	len = nla_len(opt) - NLA_ALIGN(sizeof(*qopt));
 	if (len > 0) {
 		err = parse_attr(tb, TCA_MQPRIO_MAX, opt, mqprio_policy,
 				 sizeof(*qopt));
-- 
2.14.1

