From: Dan Carpenter <error27@gmail.com>
Date: Sat, 14 Aug 2010 21:09:49 +0000
Subject: [patch] net/sched: remove unneeded NULL check
Message-Id: <20100814210949.GB645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <hadi@cyberus.ca>
Cc: "David S. Miller" <davem@davemloft.net>, Patrick McHardy <kaber@trash.net>, Jarek Poplawski <jarkao2@gmail.com>, Eric Dumazet <eric.dumazet@gmail.com>, Stephen Hemminger <shemminger@vyatta.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to check "s".  nla_data() doesn't return NULL.  Also we
already dereferenced "s" at this point so it would have oopsed ealier if
it were NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
index 408eea7..6fb3d41 100644
--- a/net/sched/sch_api.c
+++ b/net/sched/sch_api.c
@@ -360,7 +360,7 @@ static struct qdisc_size_table *qdisc_get_stab(struct nlattr *opt)
 		tsize = nla_len(tb[TCA_STAB_DATA]) / sizeof(u16);
 	}
 
-	if (!s || tsize != s->tsize || (!tab && tsize > 0))
+	if (tsize != s->tsize || (!tab && tsize > 0))
 		return ERR_PTR(-EINVAL);
 
 	spin_lock(&qdisc_stab_lock);
