From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 20:36:26 +0000
Subject: [PATCH 1/2] net/sched/cls_tcindex: Use common error handling code in tcindex_set_parms()
Message-Id: <06aa98d8-ef38-43b3-abda-c2c6713cda7c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7192a5ea-b712-6bec-5d9d-01906218d404@users.sourceforge.net>
In-Reply-To: <7192a5ea-b712-6bec-5d9d-01906218d404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 21:10:49 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/sched/cls_tcindex.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/sched/cls_tcindex.c b/net/sched/cls_tcindex.c
index d6abfa6757f2..24f05bc09084 100644
--- a/net/sched/cls_tcindex.c
+++ b/net/sched/cls_tcindex.c
@@ -437,10 +437,8 @@ tcindex_set_parms(struct net *net, struct tcf_proto *tp, unsigned long base,
 		f->key = handle;
 		f->next = NULL;
 		err = tcindex_filter_result_init(&f->result);
-		if (err < 0) {
-			kfree(f);
-			goto errout_alloc;
-		}
+		if (err < 0)
+			goto err_free_filter;
 	}
 
 	if (tb[TCA_TCINDEX_CLASSID]) {
@@ -455,10 +453,8 @@ tcindex_set_parms(struct net *net, struct tcf_proto *tp, unsigned long base,
 
 	if (old_r && old_r != r) {
 		err = tcindex_filter_result_init(old_r);
-		if (err < 0) {
-			kfree(f);
-			goto errout_alloc;
-		}
+		if (err < 0)
+			goto err_free_filter;
 	}
 
 	oldp = p;
@@ -484,6 +480,8 @@ tcindex_set_parms(struct net *net, struct tcf_proto *tp, unsigned long base,
 		call_rcu(&oldp->rcu, __tcindex_partial_destroy);
 	return 0;
 
+err_free_filter:
+	kfree(f);
 errout_alloc:
 	if (balloc = 1)
 		tcindex_free_perfect_hash(cp);
-- 
2.15.0

