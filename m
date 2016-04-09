From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 09 Apr 2016 08:49:22 +0000
Subject: [PATCH] qdisc: constify meta_type_ops structures
Message-Id: <1460191762-10986-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

The meta_type_ops structures are never modified, so declare them as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/sched/em_meta.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/sched/em_meta.c b/net/sched/em_meta.c
index f2aabc0..a309a07 100644
--- a/net/sched/em_meta.c
+++ b/net/sched/em_meta.c
@@ -796,7 +796,7 @@ struct meta_type_ops {
 	int	(*dump)(struct sk_buff *, struct meta_value *, int);
 };
 
-static struct meta_type_ops __meta_type_ops[TCF_META_TYPE_MAX + 1] = {
+static const struct meta_type_ops __meta_type_ops[TCF_META_TYPE_MAX + 1] = {
 	[TCF_META_TYPE_VAR] = {
 		.destroy = meta_var_destroy,
 		.compare = meta_var_compare,
@@ -812,7 +812,7 @@ static struct meta_type_ops __meta_type_ops[TCF_META_TYPE_MAX + 1] = {
 	}
 };
 
-static inline struct meta_type_ops *meta_type_ops(struct meta_value *v)
+static inline const struct meta_type_ops *meta_type_ops(struct meta_value *v)
 {
 	return &__meta_type_ops[meta_type(v)];
 }
@@ -870,7 +870,7 @@ static int em_meta_match(struct sk_buff *skb, struct tcf_ematch *m,
 static void meta_delete(struct meta_match *meta)
 {
 	if (meta) {
-		struct meta_type_ops *ops = meta_type_ops(&meta->lvalue);
+		const struct meta_type_ops *ops = meta_type_ops(&meta->lvalue);
 
 		if (ops && ops->destroy) {
 			ops->destroy(&meta->lvalue);
@@ -964,7 +964,7 @@ static int em_meta_dump(struct sk_buff *skb, struct tcf_ematch *em)
 {
 	struct meta_match *meta = (struct meta_match *) em->data;
 	struct tcf_meta_hdr hdr;
-	struct meta_type_ops *ops;
+	const struct meta_type_ops *ops;
 
 	memset(&hdr, 0, sizeof(hdr));
 	memcpy(&hdr.left, &meta->lvalue.hdr, sizeof(hdr.left));

