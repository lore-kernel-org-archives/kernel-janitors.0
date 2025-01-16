Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 670B91990B7;
	Thu, 16 Jan 2025 08:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737017302; cv=none; b=TRg6cKwJccHhrQfnxRfXMPj3faTQ55v3nQ60F4xZ8bGayN3tMkijxmuc9gxCOOQOrGXq9s4yd8q7DB3HN3VwgYVA06GV0YVaoP/GYAvDwqCu//FqWZzJiBJY+mR+2iaYC583cHs9q5C1UWbnrYFRHKUHi7Ivaolkh0i+xlznYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737017302; c=relaxed/simple;
	bh=b0eFl4vIp2MYYwC23o20Nb/wwD7H7OQS4NGmPEQzTUk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e83wKdXwUDqEdMLTwmRBnhpfAD1z1xAHd5+HWeY1eraguHns+Vr9ehdWoeI5z+iulns7fZDSX3TdYVMoOgPofE8AEsUI66b75FQxoTfMg/KsfybRVGPVTP1KzB58LanrsLogw2Pc1Qe1Jw/3rHhOB2Xn3xFiFVKLQUhscij4bFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id D3C8260623CF7;
	Thu, 16 Jan 2025 16:48:11 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: gregkh@linuxfoundation.org,
	tj@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] kernfs: Convert idr to xarray
Date: Thu, 16 Jan 2025 16:48:02 +0800
Message-Id: <20250116084801.260460-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IDR is deprecated. Use xarray instead.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/kernfs/dir.c             | 34 ++++++++++++++--------------------
 fs/kernfs/kernfs-internal.h |  3 ++-
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 458519e416fe..8d0af0ae6c99 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -10,7 +10,7 @@
 #include <linux/sched.h>
 #include <linux/fs.h>
 #include <linux/namei.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/slab.h>
 #include <linux/security.h>
 #include <linux/hash.h>
@@ -27,7 +27,6 @@ static DEFINE_RWLOCK(kernfs_rename_lock);	/* kn->parent and ->name */
  */
 static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
 static char kernfs_pr_cont_buf[PATH_MAX];	/* protected by pr_cont_lock */
-static DEFINE_SPINLOCK(kernfs_idr_lock);	/* root->ino_idr */
 
 #define rb_to_kn(X) rb_entry((X), struct kernfs_node, rb)
 
@@ -571,9 +570,7 @@ void kernfs_put(struct kernfs_node *kn)
 	if (kernfs_type(kn) == KERNFS_LINK)
 		kernfs_put(kn->symlink.target_kn);
 
-	spin_lock(&kernfs_idr_lock);
-	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	xa_erase(&root->ino_xa, (u32)kernfs_ino(kn));
 
 	call_rcu(&kn->rcu, kernfs_free_rcu);
 
@@ -583,7 +580,7 @@ void kernfs_put(struct kernfs_node *kn)
 			goto repeat;
 	} else {
 		/* just released the root kn, free @root too */
-		idr_destroy(&root->ino_idr);
+		xa_destroy(&root->ino_xa);
 		kfree_rcu(root, rcu);
 	}
 }
@@ -616,6 +613,7 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	struct kernfs_node *kn;
 	u32 id_highbits;
 	int ret;
+	u32 id;
 
 	name = kstrdup_const(name, GFP_KERNEL);
 	if (!name)
@@ -625,19 +623,16 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	if (!kn)
 		goto err_out1;
 
-	idr_preload(GFP_KERNEL);
-	spin_lock(&kernfs_idr_lock);
-	ret = idr_alloc_cyclic(&root->ino_idr, kn, 1, 0, GFP_ATOMIC);
-	if (ret >= 0 && ret < root->last_id_lowbits)
+	ret = xa_alloc_cyclic(&root->ino_xa, &id, kn, XA_LIMIT(1, INT_MAX),
+			      &root->ino_xa_next_id, GFP_ATOMIC);
+	if (ret >= 0 && id < root->last_id_lowbits)
 		root->id_highbits++;
 	id_highbits = root->id_highbits;
-	root->last_id_lowbits = ret;
-	spin_unlock(&kernfs_idr_lock);
-	idr_preload_end();
+	root->last_id_lowbits = id;
 	if (ret < 0)
 		goto err_out2;
 
-	kn->id = (u64)id_highbits << 32 | ret;
+	kn->id = (u64)id_highbits << 32 | id;
 
 	atomic_set(&kn->count, 1);
 	atomic_set(&kn->active, KN_DEACTIVATED_BIAS);
@@ -668,9 +663,7 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	return kn;
 
  err_out3:
-	spin_lock(&kernfs_idr_lock);
-	idr_remove(&root->ino_idr, (u32)kernfs_ino(kn));
-	spin_unlock(&kernfs_idr_lock);
+	xa_erase(&root->ino_xa, (u32)kernfs_ino(kn));
  err_out2:
 	kmem_cache_free(kernfs_node_cache, kn);
  err_out1:
@@ -726,7 +719,7 @@ struct kernfs_node *kernfs_find_and_get_node_by_id(struct kernfs_root *root,
 
 	rcu_read_lock();
 
-	kn = idr_find(&root->ino_idr, (u32)ino);
+	kn = xa_load(&root->ino_xa, (u32)ino);
 	if (!kn)
 		goto err_unlock;
 
@@ -968,11 +961,12 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 	if (!root)
 		return ERR_PTR(-ENOMEM);
 
-	idr_init(&root->ino_idr);
+	xa_init_flags(&root->ino_xa, XA_FLAGS_ALLOC1);
 	init_rwsem(&root->kernfs_rwsem);
 	init_rwsem(&root->kernfs_iattr_rwsem);
 	init_rwsem(&root->kernfs_supers_rwsem);
 	INIT_LIST_HEAD(&root->supers);
+	root->ino_xa_next_id = 1;
 
 	/*
 	 * On 64bit ino setups, id is ino.  On 32bit, low 32bits are ino.
@@ -989,7 +983,7 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 			       GLOBAL_ROOT_UID, GLOBAL_ROOT_GID,
 			       KERNFS_DIR);
 	if (!kn) {
-		idr_destroy(&root->ino_idr);
+		xa_destroy(&root->ino_xa);
 		kfree(root);
 		return ERR_PTR(-ENOMEM);
 	}
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index b42ee6547cdc..1b77e1a6e5a1 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -37,7 +37,8 @@ struct kernfs_root {
 	unsigned int		flags;	/* KERNFS_ROOT_* flags */
 
 	/* private fields, do not use outside kernfs proper */
-	struct idr		ino_idr;
+	struct xarray		ino_xa;
+	u32			ino_xa_next_id;
 	u32			last_id_lowbits;
 	u32			id_highbits;
 	struct kernfs_syscall_ops *syscall_ops;
-- 
2.30.2

