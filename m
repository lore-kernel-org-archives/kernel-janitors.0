From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Jan 2020 06:56:47 +0000
Subject: [PATCH net] net: sched: prevent a use after free
Message-Id: <20200131065647.joonbg3wzcw26x3b@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Mohit Bhasi <mohitbhasi1998@gmail.com>, "Mohit P. Tahiliani" <tahiliani@nitk.edu.in>, "V. Saicharan" <vsaicharan1998@gmail.com>, Gautam Ramakrishnan <gautamramk@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The code calls kfree_skb(skb); and then re-uses "skb" on the next line.
Let's re-order these lines to solve the problem.

Fixes: ec97ecf1ebe4 ("net: sched: add Flow Queue PIE packet scheduler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sched/sch_fq_pie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/sch_fq_pie.c b/net/sched/sch_fq_pie.c
index bbd0dea6b6b9..78472e0773e9 100644
--- a/net/sched/sch_fq_pie.c
+++ b/net/sched/sch_fq_pie.c
@@ -349,9 +349,9 @@ static int fq_pie_change(struct Qdisc *sch, struct nlattr *opt,
 	while (sch->q.qlen > sch->limit) {
 		struct sk_buff *skb = fq_pie_qdisc_dequeue(sch);
 
-		kfree_skb(skb);
 		len_dropped += qdisc_pkt_len(skb);
 		num_dropped += 1;
+		kfree_skb(skb);
 	}
 	qdisc_tree_reduce_backlog(sch, num_dropped, len_dropped);
 
-- 
2.11.0
