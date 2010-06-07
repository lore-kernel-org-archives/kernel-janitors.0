From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:07:03 +0000
Subject: [patch 4/7] selinux: fix error codes in cond_read_node()
Message-Id: <20100607210703.GT5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Originally cond_read_node() returned -1 (-EPERM) on errors which was
incorrect.  Now it either propagates the error codes from lower level
functions next_entry() or cond_read_av_list() or it returns -ENOMEM or
-EINVAL.

next_entry() returns -EINVAL.
cond_read_av_list() returns -EINVAL or -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 4c39f19..f0de637 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -392,14 +392,14 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc < 0)
-		return -1;
+		return rc;
 
 	node->cur_state = le32_to_cpu(buf[0]);
 
 	len = 0;
 	rc = next_entry(buf, fp, sizeof(u32));
 	if (rc < 0)
-		return -1;
+		return rc;
 
 	/* expr */
 	len = le32_to_cpu(buf[0]);
@@ -409,6 +409,7 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 		if (rc < 0)
 			goto err;
 
+		rc = -ENOMEM;
 		expr = kzalloc(sizeof(struct cond_expr), GFP_KERNEL);
 		if (!expr)
 			goto err;
@@ -417,6 +418,7 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 		expr->bool = le32_to_cpu(buf[1]);
 
 		if (!expr_isvalid(p, expr)) {
+			rc = -EINVAL;
 			kfree(expr);
 			goto err;
 		}
@@ -428,14 +430,16 @@ static int cond_read_node(struct policydb *p, struct cond_node *node, void *fp)
 		last = expr;
 	}
 
-	if (cond_read_av_list(p, fp, &node->true_list, NULL) != 0)
+	rc = cond_read_av_list(p, fp, &node->true_list, NULL);
+	if (rc < 0)
 		goto err;
-	if (cond_read_av_list(p, fp, &node->false_list, node->true_list) != 0)
+	rc = cond_read_av_list(p, fp, &node->false_list, node->true_list);
+	if (rc < 0)
 		goto err;
 	return 0;
 err:
 	cond_node_destroy(node);
-	return -1;
+	return rc;
 }
 
 int cond_read_list(struct policydb *p, void *fp)
