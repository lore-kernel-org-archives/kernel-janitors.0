From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 29 Jul 2013 19:36:51 +0000
Subject: [patch] net_sched: stack info leak in cbq_dump_wrr()
Message-Id: <20130729193651.GA12525@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

opt.__reserved isn't cleared so we leak a byte of stack information.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sched/sch_cbq.c b/net/sched/sch_cbq.c
index 71a5688..6398a61 100644
--- a/net/sched/sch_cbq.c
+++ b/net/sched/sch_cbq.c
@@ -1469,6 +1469,7 @@ static int cbq_dump_wrr(struct sk_buff *skb, struct cbq_class *cl)
 	opt.allot = cl->allot;
 	opt.priority = cl->priority + 1;
 	opt.cpriority = cl->cpriority + 1;
+	opt.__reserved = 0;
 	opt.weight = cl->weight;
 	if (nla_put(skb, TCA_CBQ_WRROPT, sizeof(opt), &opt))
 		goto nla_put_failure;
