From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 20:38:18 +0000
Subject: [PATCH 2/2] net/sched/cls_tcindex: Improve a size determination in two functions
Message-Id: <a039fc85-62a0-1da9-dc32-fe2294bf8991@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7192a5ea-b712-6bec-5d9d-01906218d404@users.sourceforge.net>
In-Reply-To: <7192a5ea-b712-6bec-5d9d-01906218d404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 21:17:26 +0100

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/sched/cls_tcindex.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/sched/cls_tcindex.c b/net/sched/cls_tcindex.c
index 24f05bc09084..0f1909c6545d 100644
--- a/net/sched/cls_tcindex.c
+++ b/net/sched/cls_tcindex.c
@@ -130,7 +130,7 @@ static int tcindex_init(struct tcf_proto *tp)
 	struct tcindex_data *p;
 
 	pr_debug("tcindex_init(tp %p)\n", tp);
-	p = kzalloc(sizeof(struct tcindex_data), GFP_KERNEL);
+	p = kzalloc(sizeof(*p), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -413,10 +413,7 @@ tcindex_set_parms(struct net *net, struct tcf_proto *tp, unsigned long base,
 		} else {
 			struct tcindex_filter __rcu **hash;
 
-			hash = kcalloc(cp->hash,
-				       sizeof(struct tcindex_filter *),
-				       GFP_KERNEL);
-
+			hash = kcalloc(cp->hash, sizeof(*hash), GFP_KERNEL);
 			if (!hash)
 				goto errout_alloc;
 
-- 
2.15.0

