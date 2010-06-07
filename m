From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:08:16 +0000
Subject: [patch 5/7] selinux: fix error codes in cond_policydb_init()
Message-Id: <20100607210816.GU5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

It's better to propagate the error code from avtab_init() instead of
returning -1 (-EPERM).  It turns out that avtab_init() never fails so
this patch doesn't change how the code runs but it's still a clean up.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index f0de637..7447be0 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -117,10 +117,14 @@ int evaluate_cond_node(struct policydb *p, struct cond_node *node)
 
 int cond_policydb_init(struct policydb *p)
 {
+	int ret;
+
 	p->bool_val_to_struct = NULL;
 	p->cond_list = NULL;
-	if (avtab_init(&p->te_cond_avtab))
-		return -1;
+
+	ret = avtab_init(&p->te_cond_avtab);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
