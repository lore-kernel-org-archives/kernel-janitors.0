From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Jan 2015 07:49:54 +0000
Subject: [patch] staging: lustre: remove the CFS_HOP() macro
Message-Id: <20150122074954.GB11491@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

CFS_HOP() is a terrible macro.  It chops the struct member name in half
so that it's not possible to use tools like grep or to search for how
a function pointer is used.

I removed a couple calls to:

	LASSERT(CFS_HOP(hs, put_locked) != NULL);

because they isn't a need for them.  Anyway dereferencing a NULL pointer
generates a pretty good stack trace already without adding extra debug
code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Btw, the block layer people made a change so lustre fs is BROKEN again
in yesterday's linux-next.

diff --git a/drivers/staging/lustre/include/linux/libcfs/libcfs_hash.h b/drivers/staging/lustre/include/linux/libcfs/libcfs_hash.h
index 375586b..808e494 100644
--- a/drivers/staging/lustre/include/linux/libcfs/libcfs_hash.h
+++ b/drivers/staging/lustre/include/linux/libcfs/libcfs_hash.h
@@ -454,25 +454,23 @@ cfs_hash_bkt_size(struct cfs_hash *hs)
 	       hs->hs_extra_bytes;
 }
 
-#define CFS_HOP(hs, op)	   (hs)->hs_ops->hs_ ## op
-
 static inline unsigned
 cfs_hash_id(struct cfs_hash *hs, const void *key, unsigned mask)
 {
-	return CFS_HOP(hs, hash)(hs, key, mask);
+	return hs->hs_ops->hs_hash(hs, key, mask);
 }
 
 static inline void *
 cfs_hash_key(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	return CFS_HOP(hs, key)(hnode);
+	return hs->hs_ops->hs_key(hnode);
 }
 
 static inline void
 cfs_hash_keycpy(struct cfs_hash *hs, struct hlist_node *hnode, void *key)
 {
-	if (CFS_HOP(hs, keycpy) != NULL)
-		CFS_HOP(hs, keycpy)(hnode, key);
+        if (hs->hs_ops->hs_keycpy)
+		hs->hs_ops->hs_keycpy(hnode, key);
 }
 
 /**
@@ -481,42 +479,38 @@ cfs_hash_keycpy(struct cfs_hash *hs, struct hlist_node *hnode, void *key)
 static inline int
 cfs_hash_keycmp(struct cfs_hash *hs, const void *key, struct hlist_node *hnode)
 {
-	return CFS_HOP(hs, keycmp)(key, hnode);
+	return hs->hs_ops->hs_keycmp(key, hnode);
 }
 
 static inline void *
 cfs_hash_object(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	return CFS_HOP(hs, object)(hnode);
+	return hs->hs_ops->hs_object(hnode);
 }
 
 static inline void
 cfs_hash_get(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	return CFS_HOP(hs, get)(hs, hnode);
+	return hs->hs_ops->hs_get(hs, hnode);
 }
 
 static inline void
 cfs_hash_put_locked(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	LASSERT(CFS_HOP(hs, put_locked) != NULL);
-
-	return CFS_HOP(hs, put_locked)(hs, hnode);
+	return hs->hs_ops->hs_put_locked(hs, hnode);
 }
 
 static inline void
 cfs_hash_put(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	LASSERT(CFS_HOP(hs, put) != NULL);
-
-	return CFS_HOP(hs, put)(hs, hnode);
+	return hs->hs_ops->hs_put(hs, hnode);
 }
 
 static inline void
 cfs_hash_exit(struct cfs_hash *hs, struct hlist_node *hnode)
 {
-	if (CFS_HOP(hs, exit))
-		CFS_HOP(hs, exit)(hs, hnode);
+	if (hs->hs_ops->hs_exit)
+		hs->hs_ops->hs_exit(hs, hnode);
 }
 
 static inline void cfs_hash_lock(struct cfs_hash *hs, int excl)
diff --git a/drivers/staging/lustre/lustre/libcfs/hash.c b/drivers/staging/lustre/lustre/libcfs/hash.c
index 2d1e672..3e9891a 100644
--- a/drivers/staging/lustre/lustre/libcfs/hash.c
+++ b/drivers/staging/lustre/lustre/libcfs/hash.c
@@ -1580,7 +1580,7 @@ cfs_hash_for_each_relax(struct cfs_hash *hs, cfs_hash_for_each_cb_t func,
 
 	stop_on_change = cfs_hash_with_rehash_key(hs) ||
 			 !cfs_hash_with_no_itemref(hs) ||
-			 CFS_HOP(hs, put_locked) = NULL;
+			 hs->hs_ops->hs_put_locked = NULL;
 	cfs_hash_lock(hs, 0);
 	LASSERT(!cfs_hash_is_rehashing(hs));
 
@@ -1635,9 +1635,9 @@ cfs_hash_for_each_nolock(struct cfs_hash *hs,
 	    !cfs_hash_with_no_itemref(hs))
 		return -EOPNOTSUPP;
 
-	if (CFS_HOP(hs, get) = NULL ||
-	    (CFS_HOP(hs, put) = NULL &&
-	     CFS_HOP(hs, put_locked) = NULL))
+	if (hs->hs_ops->hs_get = NULL ||
+	    (hs->hs_ops->hs_put = NULL &&
+	     hs->hs_ops->hs_put_locked = NULL))
 		return -EOPNOTSUPP;
 
 	cfs_hash_for_each_enter(hs);
@@ -1667,9 +1667,9 @@ cfs_hash_for_each_empty(struct cfs_hash *hs,
 	if (cfs_hash_with_no_lock(hs))
 		return -EOPNOTSUPP;
 
-	if (CFS_HOP(hs, get) = NULL ||
-	    (CFS_HOP(hs, put) = NULL &&
-	     CFS_HOP(hs, put_locked) = NULL))
+	if (hs->hs_ops->hs_get = NULL ||
+	    (hs->hs_ops->hs_put = NULL &&
+	     hs->hs_ops->hs_put_locked = NULL))
 		return -EOPNOTSUPP;
 
 	cfs_hash_for_each_enter(hs);
