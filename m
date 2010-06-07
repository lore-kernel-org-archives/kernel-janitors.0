From: Dan Carpenter <error27@gmail.com>
Date: Mon, 07 Jun 2010 21:02:17 +0000
Subject: [patch 1/7] selinux: cleanup return codes in avtab_read_item()
Message-Id: <20100607210217.GQ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The avtab_read_item() function tends to return -1 as a default error
code which is wrong (-1 means -EPERM).  I modified it to return
appropriate error codes which is -EINVAL or the error code from
next_entry() or insertf().

next_entry() returns -EINVAL.
insertf() is a function pointer to either avtab_insert() or
cond_insertf().
avtab_insert() returns -EINVAL, -ENOMEM, and -EEXIST.
cond_insertf() currently returns -1, but I will fix it in a later patch.

There is code in avtab_read() which translates the -1 returns from 
avtab_read_item() to -EINVAL. The translation is no longer needed, so I
removed it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
index 1215b8e..fe62d82 100644
--- a/security/selinux/ss/avtab.c
+++ b/security/selinux/ss/avtab.c
@@ -344,18 +344,18 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 		rc = next_entry(buf32, fp, sizeof(u32));
 		if (rc < 0) {
 			printk(KERN_ERR "SELinux: avtab: truncated entry\n");
-			return -1;
+			return rc;
 		}
 		items2 = le32_to_cpu(buf32[0]);
 		if (items2 > ARRAY_SIZE(buf32)) {
 			printk(KERN_ERR "SELinux: avtab: entry overflow\n");
-			return -1;
+			return -EINVAL;
 
 		}
 		rc = next_entry(buf32, fp, sizeof(u32)*items2);
 		if (rc < 0) {
 			printk(KERN_ERR "SELinux: avtab: truncated entry\n");
-			return -1;
+			return rc;
 		}
 		items = 0;
 
@@ -363,19 +363,19 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 		key.source_type = (u16)val;
 		if (key.source_type != val) {
 			printk(KERN_ERR "SELinux: avtab: truncated source type\n");
-			return -1;
+			return -EINVAL;
 		}
 		val = le32_to_cpu(buf32[items++]);
 		key.target_type = (u16)val;
 		if (key.target_type != val) {
 			printk(KERN_ERR "SELinux: avtab: truncated target type\n");
-			return -1;
+			return -EINVAL;
 		}
 		val = le32_to_cpu(buf32[items++]);
 		key.target_class = (u16)val;
 		if (key.target_class != val) {
 			printk(KERN_ERR "SELinux: avtab: truncated target class\n");
-			return -1;
+			return -EINVAL;
 		}
 
 		val = le32_to_cpu(buf32[items++]);
@@ -383,12 +383,12 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 
 		if (!(val & (AVTAB_AV | AVTAB_TYPE))) {
 			printk(KERN_ERR "SELinux: avtab: null entry\n");
-			return -1;
+			return -EINVAL;
 		}
 		if ((val & AVTAB_AV) &&
 		    (val & AVTAB_TYPE)) {
 			printk(KERN_ERR "SELinux: avtab: entry has both access vectors and types\n");
-			return -1;
+			return -EINVAL;
 		}
 
 		for (i = 0; i < ARRAY_SIZE(spec_order); i++) {
@@ -403,7 +403,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 
 		if (items != items2) {
 			printk(KERN_ERR "SELinux: avtab: entry only had %d items, expected %d\n", items2, items);
-			return -1;
+			return -EINVAL;
 		}
 		return 0;
 	}
@@ -411,7 +411,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 	rc = next_entry(buf16, fp, sizeof(u16)*4);
 	if (rc < 0) {
 		printk(KERN_ERR "SELinux: avtab: truncated entry\n");
-		return -1;
+		return rc;
 	}
 
 	items = 0;
@@ -424,7 +424,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 	    !policydb_type_isvalid(pol, key.target_type) ||
 	    !policydb_class_isvalid(pol, key.target_class)) {
 		printk(KERN_ERR "SELinux: avtab: invalid type or class\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	set = 0;
@@ -434,19 +434,19 @@ int avtab_read_item(struct avtab *a, void *fp, struct policydb *pol,
 	}
 	if (!set || set > 1) {
 		printk(KERN_ERR "SELinux:  avtab:  more than one specifier\n");
-		return -1;
+		return -EINVAL;
 	}
 
 	rc = next_entry(buf32, fp, sizeof(u32));
 	if (rc < 0) {
 		printk(KERN_ERR "SELinux: avtab: truncated entry\n");
-		return -1;
+		return rc;
 	}
 	datum.data = le32_to_cpu(*buf32);
 	if ((key.specified & AVTAB_TYPE) &&
 	    !policydb_type_isvalid(pol, datum.data)) {
 		printk(KERN_ERR "SELinux: avtab: invalid type\n");
-		return -1;
+		return -EINVAL;
 	}
 	return insertf(a, &key, &datum, p);
 }
@@ -487,8 +487,7 @@ int avtab_read(struct avtab *a, void *fp, struct policydb *pol)
 				printk(KERN_ERR "SELinux: avtab: out of memory\n");
 			else if (rc = -EEXIST)
 				printk(KERN_ERR "SELinux: avtab: duplicate entry\n");
-			else
-				rc = -EINVAL;
+
 			goto bad;
 		}
 	}
