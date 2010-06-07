From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:10:13 +0000
Subject: [patch 6/7] selinux: fix error codes in cond_read_bool()
Message-Id: <20100607211013.GV5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code always returned -1 (-EPERM) on error.  The new code
returns either -ENOMEM, or -EINVAL or it propagates the error codes from
lower level functions next_entry() or hashtab_insert().

next_entry() returns -EINVAL.
hashtab_insert() returns -EINVAL, -EEXIST, or -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
index 7447be0..dc5db55 100644
--- a/security/selinux/ss/conditional.c
+++ b/security/selinux/ss/conditional.c
@@ -223,7 +223,7 @@ int cond_read_bool(struct policydb *p, struct hashtab *h, void *fp)
 
 	booldatum = kzalloc(sizeof(struct cond_bool_datum), GFP_KERNEL);
 	if (!booldatum)
-		return -1;
+		return -ENOMEM;
 
 	rc = next_entry(buf, fp, sizeof buf);
 	if (rc < 0)
@@ -232,11 +232,13 @@ int cond_read_bool(struct policydb *p, struct hashtab *h, void *fp)
 	booldatum->value = le32_to_cpu(buf[0]);
 	booldatum->state = le32_to_cpu(buf[1]);
 
+	rc = -EINVAL;
 	if (!bool_isvalid(booldatum))
 		goto err;
 
 	len = le32_to_cpu(buf[2]);
 
+	rc = -ENOMEM;
 	key = kmalloc(len + 1, GFP_KERNEL);
 	if (!key)
 		goto err;
@@ -244,13 +246,14 @@ int cond_read_bool(struct policydb *p, struct hashtab *h, void *fp)
 	if (rc < 0)
 		goto err;
 	key[len] = '\0';
-	if (hashtab_insert(h, key, booldatum))
+	rc = hashtab_insert(h, key, booldatum);
+	if (rc < 0)
 		goto err;
 
 	return 0;
 err:
 	cond_destroy_bool(key, booldatum, NULL);
-	return -1;
+	return rc;
 }
 
 struct cond_insertf_data {
