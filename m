From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:52 +0000
Subject: [PATCH 1/7] lustre: llite: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434024178-8785-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Replace uses of OBD_ALLOC_LARGE by libcfs_kvzalloc and OBD_FREE_LARGE by
kvfree.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,size;
@@

- OBD_ALLOC_LARGE(ptr,size)
+ ptr = libcfs_kvzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_FREE_LARGE(ptr, size);
+ kvfree(ptr);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/dir.c  |   10 +++++-----
 drivers/staging/lustre/lustre/llite/file.c |   22 +++++++++++-----------
 drivers/staging/lustre/lustre/llite/rw26.c |    4 ++--
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/rw26.c b/drivers/staging/lustre/lustre/llite/rw26.c
index 7c64313..b17b7ce 100644
--- a/drivers/staging/lustre/lustre/llite/rw26.c
+++ b/drivers/staging/lustre/lustre/llite/rw26.c
@@ -200,12 +200,12 @@ static inline int ll_get_user_pages(int rw, unsigned long user_addr,
 	*max_pages = (user_addr + size + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
 	*max_pages -= user_addr >> PAGE_CACHE_SHIFT;
 
-	OBD_ALLOC_LARGE(*pages, *max_pages * sizeof(**pages));
+	*pages = libcfs_kvzalloc(*max_pages * sizeof(**pages), GFP_NOFS);
 	if (*pages) {
 		result = get_user_pages_fast(user_addr, *max_pages,
 					     (rw = READ), *pages);
 		if (unlikely(result <= 0))
-			OBD_FREE_LARGE(*pages, *max_pages * sizeof(**pages));
+			kvfree(*pages);
 	}
 
 	return result;
diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index 5c05f41..4f9b1c7 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -1282,7 +1282,7 @@ static int ll_lov_recreate(struct inode *inode, struct ost_id *oi, u32 ost_idx)
 	lsm_size = sizeof(*lsm) + (sizeof(struct lov_oinfo) *
 		   (lsm->lsm_stripe_count));
 
-	OBD_ALLOC_LARGE(lsm2, lsm_size);
+	lsm2 = libcfs_kvzalloc(lsm_size, GFP_NOFS);
 	if (lsm2 = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1300,7 +1300,7 @@ static int ll_lov_recreate(struct inode *inode, struct ost_id *oi, u32 ost_idx)
 	rc = obd_create(NULL, exp, oa, &lsm2, &oti);
 	ll_inode_size_unlock(inode);
 
-	OBD_FREE_LARGE(lsm2, lsm_size);
+	kvfree(lsm2);
 	goto out;
 out:
 	ccc_inode_lsm_put(inode, lsm);
@@ -1477,12 +1477,12 @@ static int ll_lov_setea(struct inode *inode, struct file *file,
 	if (!capable(CFS_CAP_SYS_ADMIN))
 		return -EPERM;
 
-	OBD_ALLOC_LARGE(lump, lum_size);
+	lump = libcfs_kvzalloc(lum_size, GFP_NOFS);
 	if (lump = NULL)
 		return -ENOMEM;
 
 	if (copy_from_user(lump, (struct lov_user_md *)arg, lum_size)) {
-		OBD_FREE_LARGE(lump, lum_size);
+		kvfree(lump);
 		return -EFAULT;
 	}
 
@@ -1490,7 +1490,7 @@ static int ll_lov_setea(struct inode *inode, struct file *file,
 				     lum_size);
 	cl_lov_delay_create_clear(&file->f_flags);
 
-	OBD_FREE_LARGE(lump, lum_size);
+	kvfree(lump);
 	return rc;
 }
 
@@ -1802,7 +1802,7 @@ static int ll_ioctl_fiemap(struct inode *inode, unsigned long arg)
 	num_bytes = sizeof(*fiemap_s) + (extent_count *
 					 sizeof(struct ll_fiemap_extent));
 
-	OBD_ALLOC_LARGE(fiemap_s, num_bytes);
+	fiemap_s = libcfs_kvzalloc(num_bytes, GFP_NOFS);
 	if (fiemap_s = NULL)
 		return -ENOMEM;
 
@@ -1839,7 +1839,7 @@ static int ll_ioctl_fiemap(struct inode *inode, unsigned long arg)
 		rc = -EFAULT;
 
 error:
-	OBD_FREE_LARGE(fiemap_s, num_bytes);
+	kvfree(fiemap_s);
 	return rc;
 }
 
@@ -3055,7 +3055,7 @@ static int ll_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	num_bytes = sizeof(*fiemap) + (extent_count *
 				       sizeof(struct ll_fiemap_extent));
-	OBD_ALLOC_LARGE(fiemap, num_bytes);
+	fiemap = libcfs_kvzalloc(num_bytes, GFP_NOFS);
 
 	if (fiemap = NULL)
 		return -ENOMEM;
@@ -3077,7 +3077,7 @@ static int ll_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		       fiemap->fm_mapped_extents *
 		       sizeof(struct ll_fiemap_extent));
 
-	OBD_FREE_LARGE(fiemap, num_bytes);
+	kvfree(fiemap);
 	return rc;
 }
 
@@ -3366,7 +3366,7 @@ static int ll_layout_fetch(struct inode *inode, struct ldlm_lock *lock)
 		goto out;
 	}
 
-	OBD_ALLOC_LARGE(lvbdata, lmmsize);
+	lvbdata = libcfs_kvzalloc(lmmsize, GFP_NOFS);
 	if (lvbdata = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -3375,7 +3375,7 @@ static int ll_layout_fetch(struct inode *inode, struct ldlm_lock *lock)
 	memcpy(lvbdata, lmm, lmmsize);
 	lock_res_and_lock(lock);
 	if (lock->l_lvb_data != NULL)
-		OBD_FREE_LARGE(lock->l_lvb_data, lock->l_lvb_len);
+		kvfree(lock->l_lvb_data);
 
 	lock->l_lvb_data = lvbdata;
 	lock->l_lvb_len = lmmsize;
diff --git a/drivers/staging/lustre/lustre/llite/dir.c b/drivers/staging/lustre/lustre/llite/dir.c
index 4b0de8d..9016f48 100644
--- a/drivers/staging/lustre/lustre/llite/dir.c
+++ b/drivers/staging/lustre/lustre/llite/dir.c
@@ -1572,7 +1572,7 @@ out_req:
 		if (rc)
 			return rc;
 
-		OBD_ALLOC_LARGE(lmm, lmmsize);
+		lmm = libcfs_kvzalloc(lmmsize, GFP_NOFS);
 		if (lmm = NULL)
 			return -ENOMEM;
 		if (copy_from_user(lmm, lum, lmmsize)) {
@@ -1625,7 +1625,7 @@ out_req:
 free_lsm:
 		obd_free_memmd(sbi->ll_dt_exp, &lsm);
 free_lmm:
-		OBD_FREE_LARGE(lmm, lmmsize);
+		kvfree(lmm);
 		return rc;
 	}
 	case OBD_IOC_LLOG_CATINFO: {
@@ -1791,13 +1791,13 @@ out_quotactl:
 		if (totalsize >= MDS_MAXREQSIZE / 3)
 			return -E2BIG;
 
-		OBD_ALLOC_LARGE(hur, totalsize);
+		hur = libcfs_kvzalloc(totalsize, GFP_NOFS);
 		if (hur = NULL)
 			return -ENOMEM;
 
 		/* Copy the whole struct */
 		if (copy_from_user(hur, (void *)arg, totalsize)) {
-			OBD_FREE_LARGE(hur, totalsize);
+			kvfree(hur);
 			return -EFAULT;
 		}
 
@@ -1824,7 +1824,7 @@ out_quotactl:
 					   hur, NULL);
 		}
 
-		OBD_FREE_LARGE(hur, totalsize);
+		kvfree(hur);
 
 		return rc;
 	}

