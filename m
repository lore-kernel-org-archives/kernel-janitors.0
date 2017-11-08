From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 08 Nov 2017 18:43:38 +0000
Subject: [PATCH 3/3] net: sched: cls_fw: Adjust nine checks for null pointers
Message-Id: <00424321-0237-9c10-613a-7bea90c66a7e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
In-Reply-To: <32efa965-896f-f24a-4d30-586e10c54a5b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 8 Nov 2017 19:26:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/sched/cls_fw.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/net/sched/cls_fw.c b/net/sched/cls_fw.c
index 53c1c8ae3e00..2af2627d6f45 100644
--- a/net/sched/cls_fw.c
+++ b/net/sched/cls_fw.c
@@ -68,7 +68,7 @@ static int fw_classify(struct sk_buff *skb, const struct tcf_proto *tp,
 	int r;
 	u32 id = skb->mark;
 
-	if (head != NULL) {
+	if (head) {
 		id &= head->mask;
 
 		for (f = rcu_dereference_bh(head->ht[fw_hash(id)]); f;
@@ -106,7 +106,7 @@ static void *fw_get(struct tcf_proto *tp, u32 handle)
 	struct fw_head *head = rtnl_dereference(tp->root);
 	struct fw_filter *f;
 
-	if (head = NULL)
+	if (!head)
 		return NULL;
 
 	f = rtnl_dereference(head->ht[fw_hash(handle)]);
@@ -149,7 +149,7 @@ static void fw_destroy(struct tcf_proto *tp)
 	struct fw_filter *f;
 	int h;
 
-	if (head = NULL)
+	if (!head)
 		return;
 
 	for (h = 0; h < HTSIZE; h++) {
@@ -172,7 +172,7 @@ static int fw_delete(struct tcf_proto *tp, void *arg, bool *last)
 	int ret = -EINVAL;
 	int h;
 
-	if (head = NULL || f = NULL)
+	if (!head || !f)
 		goto out;
 
 	fp = &head->ht[fw_hash(f->id)];
@@ -324,7 +324,7 @@ static int fw_change(struct net *net, struct sk_buff *in_skb,
 	}
 
 	f = kzalloc(sizeof(*f), GFP_KERNEL);
-	if (f = NULL)
+	if (!f)
 		return -ENOBUFS;
 
 	err = tcf_exts_init(&f->exts, TCA_FW_ACT, TCA_FW_POLICE);
@@ -354,7 +354,7 @@ static void fw_walk(struct tcf_proto *tp, struct tcf_walker *arg)
 	struct fw_head *head = rtnl_dereference(tp->root);
 	int h;
 
-	if (head = NULL)
+	if (!head)
 		arg->stop = 1;
 
 	if (arg->stop)
@@ -385,7 +385,7 @@ static int fw_dump(struct net *net, struct tcf_proto *tp, void *fh,
 	struct fw_filter *f = fh;
 	struct nlattr *nest;
 
-	if (f = NULL)
+	if (!f)
 		return skb->len;
 
 	t->tcm_handle = f->id;
@@ -394,7 +394,7 @@ static int fw_dump(struct net *net, struct tcf_proto *tp, void *fh,
 		return skb->len;
 
 	nest = nla_nest_start(skb, TCA_OPTIONS);
-	if (nest = NULL)
+	if (!nest)
 		goto nla_put_failure;
 
 	if (f->res.classid &&
-- 
2.15.0

