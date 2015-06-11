From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 08:51:16 +0000
Subject: [patch] Smack: freeing an error pointer in smk_write_revoke_subj()
Message-Id: <20150611085116.GC27393@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This code used to rely on the fact that kfree(NULL) was a no-op, but
then we changed smk_parse_smack() to return error pointers on failure
instead of NULL.  Calling kfree() on an error pointer will oops.

I have re-arranged things a bit so that we only free things if they
have been allocated.

Fixes: e774ad683f42 ('smack: pass error code through pointers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 6beac42..2716d02 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -2253,8 +2253,8 @@ static const struct file_operations smk_access2_ops = {
 static ssize_t smk_write_revoke_subj(struct file *file, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
-	char *data = NULL;
-	const char *cp = NULL;
+	char *data;
+	const char *cp;
 	struct smack_known *skp;
 	struct smack_rule *sp;
 	struct list_head *rule_list;
@@ -2276,18 +2276,18 @@ static ssize_t smk_write_revoke_subj(struct file *file, const char __user *buf,
 
 	if (copy_from_user(data, buf, count) != 0) {
 		rc = -EFAULT;
-		goto free_out;
+		goto out_data;
 	}
 
 	cp = smk_parse_smack(data, count);
 	if (IS_ERR(cp)) {
 		rc = PTR_ERR(cp);
-		goto free_out;
+		goto out_data;
 	}
 
 	skp = smk_find_entry(cp);
 	if (skp = NULL)
-		goto free_out;
+		goto out_cp;
 
 	rule_list = &skp->smk_rules;
 	rule_lock = &skp->smk_rules_lock;
@@ -2299,9 +2299,11 @@ static ssize_t smk_write_revoke_subj(struct file *file, const char __user *buf,
 
 	mutex_unlock(rule_lock);
 
-free_out:
-	kfree(data);
+out_cp:
 	kfree(cp);
+out_data:
+	kfree(data);
+
 	return rc;
 }
 
