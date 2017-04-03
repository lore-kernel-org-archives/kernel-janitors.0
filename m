From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Apr 2017 18:18:41 +0000
Subject: [PATCH -next] net: sched: choke: remove some dead code
Message-Id: <20170403181629.GA22938@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@mellanox.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally left this dead code behind after commit 5952fde10c35
("net: sched: choke: remove dead filter classify code").

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
index 040625fdc82b..f11f8732b0d5 100644
--- a/net/sched/sch_choke.c
+++ b/net/sched/sch_choke.c
@@ -223,7 +223,6 @@ static bool choke_match_random(const struct choke_sched_data *q,
 static int choke_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			 struct sk_buff **to_free)
 {
-	int ret = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
 	struct choke_sched_data *q = qdisc_priv(sch);
 	const struct red_parms *p = &q->parms;
 
@@ -290,11 +289,6 @@ static int choke_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 congestion_drop:
 	qdisc_drop(skb, sch, to_free);
 	return NET_XMIT_CN;
-
-	if (ret & __NET_XMIT_BYPASS)
-		qdisc_qstats_drop(sch);
-	__qdisc_drop(skb, to_free);
-	return ret;
 }
 
 static struct sk_buff *choke_dequeue(struct Qdisc *sch)
