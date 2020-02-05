From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Feb 2020 11:53:30 +0000
Subject: [PATCH v2 net] net: sched: prevent a use after free
Message-Id: <20200205115330.7x2qgaks7racy5wj@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAM_iQpVrckjFViizKZH+S=8GC_3T5Gm1vTAUeFkpmqJ_A66x1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Mohit Bhasi <mohitbhasi1998@gmail.com>, "V. Saicharan" <vsaicharan1998@gmail.com>, Leslie Monis <lesliemonis@gmail.com>, "Sachin D. Patil" <sdp.sachin@gmail.com>, Gautam Ramakrishnan <gautamramk@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The bug is that we call kfree_skb(skb) and then pass "skb" to
qdisc_pkt_len(skb) on the next line, which is a use after free.
Also Cong Wang points out that it's better to delay the actual
frees until we drop the rtnl lock so we should use rtnl_kfree_skbs()
instead of kfree_skb().

Cc: Cong Wang <xiyou.wangcong@gmail.com>
Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use rtnl_kfree_skbs() instead of kfree_skb().  From static analysis.
    Not tested, but I have audited the code pretty close and I think
    switing to rtnl_kfree_skbs() is harmless.

 net/sched/sch_fq_pie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index bbd0dea6b6b9..214657eb3dfd 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -349,9 +349,9 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
 	while (sch->q.qlen > sch->limit) {
 		struct sk_buff *skb = fq_pie_qdisc_dequeue(sch);
 
-		kfree_skb(skb);
 		len_dropped += qdisc_pkt_len(skb);
 		num_dropped += 1;
+		rtnl_kfree_skbs(skb, skb);
 	}
 	qdisc_tree_reduce_backlog(sch, num_dropped, len_dropped);
 
-- 
2.11.0
