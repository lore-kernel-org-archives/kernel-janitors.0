From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 11 Jun 2015 12:02:54 +0000
Subject: [PATCH 3/7] lustre: lov: Replace uses of OBD_{ALLOC,FREE}_LARGE
Message-Id: <1434024178-8785-4-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/staging/lustre/lustre/lov/lov_ea.c     |    7 +++----
 drivers/staging/lustre/lustre/lov/lov_io.c     |   18 ++++++++++--------
 drivers/staging/lustre/lustre/lov/lov_lock.c   |    5 ++---
 drivers/staging/lustre/lustre/lov/lov_obd.c    |    4 ++--
 drivers/staging/lustre/lustre/lov/lov_object.c |    5 +++--
 drivers/staging/lustre/lustre/lov/lov_pack.c   |    8 ++++----
 6 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/lustre/lustre/lov/lov_pack.c b/drivers/staging/lustre/lustre/lov/lov_pack.c
index 92b9ffe..6b1c135 100644
--- a/drivers/staging/lustre/lustre/lov/lov_pack.c
+++ b/drivers/staging/lustre/lustre/lov/lov_pack.c
@@ -192,13 +192,13 @@ int lov_packmd(struct obd_export *exp, struct lov_mds_md **lmmp,
 	if (*lmmp && !lsm) {
 		stripe_count = le16_to_cpu((*lmmp)->lmm_stripe_count);
 		lmm_size = lov_mds_md_size(stripe_count, lmm_magic);
-		OBD_FREE_LARGE(*lmmp, lmm_size);
+		kvfree(*lmmp);
 		*lmmp = NULL;
 		return 0;
 	}
 
 	if (!*lmmp) {
-		OBD_ALLOC_LARGE(*lmmp, lmm_size);
+		*lmmp = libcfs_kvzalloc(lmm_size, GFP_NOFS);
 		if (!*lmmp)
 			return -ENOMEM;
 	}
@@ -285,7 +285,7 @@ static int lov_verify_lmm(void *lmm, int lmm_bytes, __u16 *stripe_count)
 		CERROR("bad disk LOV MAGIC: 0x%08X; dumping LMM (size=%d):\n",
 		       le32_to_cpu(*(__u32 *)lmm), lmm_bytes);
 		sz = lmm_bytes * 2 + 1;
-		OBD_ALLOC_LARGE(buffer, sz);
+		buffer = libcfs_kvzalloc(sz, GFP_NOFS);
 		if (buffer != NULL) {
 			int i;
 
@@ -293,7 +293,7 @@ static int lov_verify_lmm(void *lmm, int lmm_bytes, __u16 *stripe_count)
 				sprintf(buffer+2*i, "%.2X", ((char *)lmm)[i]);
 			buffer[sz - 1] = '\0';
 			CERROR("%s\n", buffer);
-			OBD_FREE_LARGE(buffer, sz);
+			kvfree(buffer);
 		}
 		return -EINVAL;
 	}
diff --git a/drivers/staging/lustre/lustre/lov/lov_object.c b/drivers/staging/lustre/lustre/lov/lov_object.c
index a22342f..4d7cd92 100644
--- a/drivers/staging/lustre/lustre/lov/lov_object.c
+++ b/drivers/staging/lustre/lustre/lov/lov_object.c
@@ -218,7 +218,8 @@ static int lov_init_raid0(const struct lu_env *env,
 	r0->lo_nr  = lsm->lsm_stripe_count;
 	LASSERT(r0->lo_nr <= lov_targets_nr(dev));
 
-	OBD_ALLOC_LARGE(r0->lo_sub, r0->lo_nr * sizeof(r0->lo_sub[0]));
+	r0->lo_sub = libcfs_kvzalloc(r0->lo_nr * sizeof(r0->lo_sub[0]),
+				     GFP_NOFS);
 	if (r0->lo_sub != NULL) {
 		result = 0;
 		subconf->coc_inode = conf->coc_inode;
@@ -375,7 +376,7 @@ static void lov_fini_raid0(const struct lu_env *env, struct lov_object *lov,
 	struct lov_layout_raid0 *r0 = &state->raid0;
 
 	if (r0->lo_sub != NULL) {
-		OBD_FREE_LARGE(r0->lo_sub, r0->lo_nr * sizeof(r0->lo_sub[0]));
+		kvfree(r0->lo_sub);
 		r0->lo_sub = NULL;
 	}
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_obd.c b/drivers/staging/lustre/lustre/lov/lov_obd.c
index ca1caae..96c55ac 100644
--- a/drivers/staging/lustre/lustre/lov/lov_obd.c
+++ b/drivers/staging/lustre/lustre/lov/lov_obd.c
@@ -1737,7 +1737,7 @@ static int lov_fiemap(struct lov_obd *lov, __u32 keylen, void *key,
 	if (fiemap_count_to_size(fm_key->fiemap.fm_extent_count) < buffer_size)
 		buffer_size = fiemap_count_to_size(fm_key->fiemap.fm_extent_count);
 
-	OBD_ALLOC_LARGE(fm_local, buffer_size);
+	fm_local = libcfs_kvzalloc(buffer_size, GFP_NOFS);
 	if (fm_local = NULL) {
 		rc = -ENOMEM;
 		goto out;
@@ -1943,7 +1943,7 @@ skip_last_device_calc:
 	fiemap->fm_mapped_extents = current_extent;
 
 out:
-	OBD_FREE_LARGE(fm_local, buffer_size);
+	kvfree(fm_local);
 	return rc;
 }
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_lock.c b/drivers/staging/lustre/lustre/lov/lov_lock.c
index f2eca56..a6938085 100644
--- a/drivers/staging/lustre/lustre/lov/lov_lock.c
+++ b/drivers/staging/lustre/lustre/lov/lov_lock.c
@@ -314,7 +314,7 @@ static int lov_lock_sub_init(const struct lu_env *env,
 			nr++;
 	}
 	LASSERT(nr > 0);
-	OBD_ALLOC_LARGE(lck->lls_sub, nr * sizeof(lck->lls_sub[0]));
+	lck->lls_sub = libcfs_kvzalloc(nr * sizeof(lck->lls_sub[0]), GFP_NOFS);
 	if (lck->lls_sub = NULL)
 		return -ENOMEM;
 
@@ -441,8 +441,7 @@ static void lov_lock_fini(const struct lu_env *env,
 			 * a reference on its parent.
 			 */
 			LASSERT(lck->lls_sub[i].sub_lock = NULL);
-		OBD_FREE_LARGE(lck->lls_sub,
-			       lck->lls_nr * sizeof(lck->lls_sub[0]));
+		kvfree(lck->lls_sub);
 	}
 	OBD_SLAB_FREE_PTR(lck, lov_lock_kmem);
 }
diff --git a/drivers/staging/lustre/lustre/lov/lov_io.c b/drivers/staging/lustre/lustre/lov/lov_io.c
index a043df0..11c1081 100644
--- a/drivers/staging/lustre/lustre/lov/lov_io.c
+++ b/drivers/staging/lustre/lustre/lov/lov_io.c
@@ -286,8 +286,10 @@ static int lov_io_subio_init(const struct lu_env *env, struct lov_io *lio,
 	 * Need to be optimized, we can't afford to allocate a piece of memory
 	 * when writing a page. -jay
 	 */
-	OBD_ALLOC_LARGE(lio->lis_subs,
-			lsm->lsm_stripe_count * sizeof(lio->lis_subs[0]));
+	lio->lis_subs +		libcfs_kvzalloc(lsm->lsm_stripe_count *
+				sizeof(lio->lis_subs[0]),
+				GFP_NOFS);
 	if (lio->lis_subs != NULL) {
 		lio->lis_nr_subios = lio->lis_stripe_count;
 		lio->lis_single_subio_index = -1;
@@ -360,8 +362,7 @@ static void lov_io_fini(const struct lu_env *env, const struct cl_io_slice *ios)
 	if (lio->lis_subs != NULL) {
 		for (i = 0; i < lio->lis_nr_subios; i++)
 			lov_io_sub_fini(env, lio, &lio->lis_subs[i]);
-		OBD_FREE_LARGE(lio->lis_subs,
-			 lio->lis_nr_subios * sizeof(lio->lis_subs[0]));
+		kvfree(lio->lis_subs);
 		lio->lis_nr_subios = 0;
 	}
 
@@ -604,8 +605,10 @@ static int lov_io_submit(const struct lu_env *env,
 
 	LASSERT(lio->lis_subs != NULL);
 	if (alloc) {
-		OBD_ALLOC_LARGE(stripes_qin,
-				sizeof(*stripes_qin) * lio->lis_nr_subios);
+		stripes_qin +			libcfs_kvzalloc(sizeof(*stripes_qin) *
+					lio->lis_nr_subios,
+					GFP_NOFS);
 		if (stripes_qin = NULL)
 			return -ENOMEM;
 
@@ -658,8 +661,7 @@ static int lov_io_submit(const struct lu_env *env,
 	}
 
 	if (alloc) {
-		OBD_FREE_LARGE(stripes_qin,
-			 sizeof(*stripes_qin) * lio->lis_nr_subios);
+		kvfree(stripes_qin);
 	} else {
 		int i;
 
diff --git a/drivers/staging/lustre/lustre/lov/lov_ea.c b/drivers/staging/lustre/lustre/lov/lov_ea.c
index 2bcfaea..3f51b57 100644
--- a/drivers/staging/lustre/lustre/lov/lov_ea.c
+++ b/drivers/staging/lustre/lustre/lov/lov_ea.c
@@ -95,7 +95,7 @@ struct lov_stripe_md *lsm_alloc_plain(__u16 stripe_count, int *size)
 	oinfo_ptrs_size = sizeof(struct lov_oinfo *) * stripe_count;
 	*size = sizeof(struct lov_stripe_md) + oinfo_ptrs_size;
 
-	OBD_ALLOC_LARGE(lsm, *size);
+	lsm = libcfs_kvzalloc(*size, GFP_NOFS);
 	if (!lsm)
 		return NULL;
 
@@ -111,7 +111,7 @@ struct lov_stripe_md *lsm_alloc_plain(__u16 stripe_count, int *size)
 err:
 	while (--i >= 0)
 		OBD_SLAB_FREE(lsm->lsm_oinfo[i], lov_oinfo_slab, sizeof(*loi));
-	OBD_FREE_LARGE(lsm, *size);
+	kvfree(lsm);
 	return NULL;
 }
 
@@ -123,8 +123,7 @@ void lsm_free_plain(struct lov_stripe_md *lsm)
 	for (i = 0; i < stripe_count; i++)
 		OBD_SLAB_FREE(lsm->lsm_oinfo[i], lov_oinfo_slab,
 			      sizeof(struct lov_oinfo));
-	OBD_FREE_LARGE(lsm, sizeof(struct lov_stripe_md) +
-		       stripe_count * sizeof(struct lov_oinfo *));
+	kvfree(lsm);
 }
 
 static void lsm_unpackmd_common(struct lov_stripe_md *lsm,

