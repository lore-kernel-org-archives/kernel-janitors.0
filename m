From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:03:20 +0000
Subject: [patch 2/7] selinux: propagate error codes in cond_read_list()
Message-Id: <20100607210319.GR5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These are passed back when the security module gets loaded.

The original code always returned -1 (-EPERM) on error but after this
patch it can return -EINVAL, or -ENOMEM or propagate the error code from
cond_read_node().  cond_read_node() still returns -1 all the time, but I
fix that in a later patch.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 4a4e35c..acaa6cd 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -446,7 +446,7 @@ int cond_read_list(struct policydb *p, void *fp)
 
 	rc = next_entry(buf, fp, sizeof buf);
 	if (rc < 0)
-		return -1;
+		return rc;
 
 	len = le32_to_cpu(buf[0]);
 
@@ -455,11 +455,13 @@ int cond_read_list(struct policydb *p, void *fp)
 		goto err;
 
 	for (i = 0; i < len; i++) {
+		rc = -ENOMEM;
 		node = kzalloc(sizeof(struct cond_node), GFP_KERNEL);
 		if (!node)
 			goto err;
 
-		if (cond_read_node(p, node, fp) != 0)
+		rc = cond_read_node(p, node, fp);
+		if (rc < 0)
 			goto err;
 
 		if (i = 0)
@@ -472,7 +474,7 @@ int cond_read_list(struct policydb *p, void *fp)
 err:
 	cond_list_destroy(p->cond_list);
 	p->cond_list = NULL;
-	return -1;
+	return rc;
 }
 
 /* Determine whether additional permissions are granted by the conditional
