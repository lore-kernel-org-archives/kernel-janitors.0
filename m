From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Aug 2018 19:27:55 +0000
Subject: [PATCH net-next] net: sched: cls_flower: Fix an error code in fl_tmplt_create()
Message-Id: <20180803192754.vggls5m46jw6ynfc@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@mellanox.com>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We forgot to set the error code on this path, so we return NULL instead
of an error pointer.  In the current code kzalloc() won't fail for small
allocations so this doesn't really affect runtime.

Fixes: b95ec7eb3b4d ("net: sched: cls_flower: implement chain templates")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/sched/cls_flower.c b/net/sched/cls_flower.c
index e8bd08ba998a..a3b69bb6f4b0 100644
--- a/net/sched/cls_flower.c
+++ b/net/sched/cls_flower.c
@@ -1250,8 +1250,10 @@ static void *fl_tmplt_create(struct net *net, struct tcf_chain *chain,
 		goto errout_tb;
 
 	tmplt = kzalloc(sizeof(*tmplt), GFP_KERNEL);
-	if (!tmplt)
+	if (!tmplt) {
+		err = -ENOMEM;
 		goto errout_tb;
+	}
 	tmplt->chain = chain;
 	err = fl_set_key(net, tb, &tmplt->dummy_key, &tmplt->mask, extack);
 	if (err)
