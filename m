From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Aug 2015 17:30:09 +0000
Subject: [PATCH 5/8] staging: lustre: llite: put constant on the right of binary operator
Message-Id: <1440869412-4899-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440869412-4899-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Move constants to the right of binary operators.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
constant c;
expression e;
binary operator b = {=,!=,&,|};
@@

(
- c
+ e
b
- e
+ c
|
- c < e
+ e > c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/llite/dir.c       |   10 +++++-----
 drivers/staging/lustre/lustre/llite/file.c      |   10 +++++-----
 drivers/staging/lustre/lustre/llite/llite_lib.c |    2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/llite_lib.c b/drivers/staging/lustre/lustre/llite/llite_lib.c
index b4ed6c8..fcad241 100644
--- a/drivers/staging/lustre/lustre/llite/llite_lib.c
+++ b/drivers/staging/lustre/lustre/llite/llite_lib.c
@@ -2201,7 +2201,7 @@ struct md_op_data *ll_prep_md_op_data(struct md_op_data *op_data,
 	}
 
 	/* When called by ll_setattr_raw, file is i1. */
-	if (LLIF_DATA_MODIFIED & ll_i2info(i1)->lli_flags)
+	if (ll_i2info(i1)->lli_flags & LLIF_DATA_MODIFIED)
 		op_data->op_bias |= MDS_DATA_MODIFIED;
 
 	return op_data;
diff --git a/drivers/staging/lustre/lustre/llite/file.c b/drivers/staging/lustre/lustre/llite/file.c
index dcd0c6d..eaf35e2 100644
--- a/drivers/staging/lustre/lustre/llite/file.c
+++ b/drivers/staging/lustre/lustre/llite/file.c
@@ -94,7 +94,7 @@ void ll_pack_inode2opdata(struct inode *inode, struct md_op_data *op_data,
 		op_data->op_handle = *fh;
 	op_data->op_capa1 = ll_mdscapa_get(inode);
 
-	if (LLIF_DATA_MODIFIED & ll_i2info(inode)->lli_flags)
+	if (ll_i2info(inode)->lli_flags & LLIF_DATA_MODIFIED)
 		op_data->op_bias |= MDS_DATA_MODIFIED;
 }
 
@@ -1433,7 +1433,7 @@ int ll_lov_getstripe_ea_info(struct inode *inode, const char *filename,
 	 * little endian.  We convert it to host endian before
 	 * passing it to userspace.
 	 */
-	if (LOV_MAGIC != cpu_to_le32(LOV_MAGIC)) {
+	if (cpu_to_le32(LOV_MAGIC) != LOV_MAGIC) {
 		int stripe_count;
 
 		stripe_count = le16_to_cpu(lmm->lmm_stripe_count);
@@ -2494,8 +2494,8 @@ ll_file_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	default: {
 		int err;
 
-		if (LLIOC_STOP =
-		     ll_iocontrol_call(inode, file, cmd, arg, &err))
+		if (ll_iocontrol_call(inode, file, cmd, arg, &err) =
+		     LLIOC_STOP)
 			return err;
 
 		return obd_iocontrol(cmd, ll_i2dtexp(inode), 0, NULL,
@@ -2850,7 +2850,7 @@ ldlm_mode_t ll_take_md_lock(struct inode *inode, __u64 bits,
 	fid = &ll_i2info(inode)->lli_fid;
 	CDEBUG(D_INFO, "trying to match res "DFID"\n", PFID(fid));
 
-	rc = md_lock_match(ll_i2mdexp(inode), LDLM_FL_BLOCK_GRANTED|flags,
+	rc = md_lock_match(ll_i2mdexp(inode), flags | LDLM_FL_BLOCK_GRANTED,
 			   fid, LDLM_IBITS, &policy, mode, lockh);
 
 	return rc;
diff --git a/drivers/staging/lustre/lustre/llite/dir.c b/drivers/staging/lustre/lustre/llite/dir.c
index 769b611..d407fcc 100644
--- a/drivers/staging/lustre/lustre/llite/dir.c
+++ b/drivers/staging/lustre/lustre/llite/dir.c
@@ -660,7 +660,7 @@ static int ll_dir_setdirstripe(struct inode *dir, struct lmv_user_md *lump,
 	int mode;
 	int err;
 
-	mode = (0755 & ~current_umask()) | S_IFDIR;
+	mode = (~current_umask() & 0755) | S_IFDIR;
 	op_data = ll_prep_md_op_data(NULL, dir, NULL, filename,
 				     strlen(filename), mode, LUSTRE_OPC_MKDIR,
 				     lump);
@@ -838,11 +838,11 @@ int ll_dir_getstripe(struct inode *inode, struct lov_mds_md **lmmp,
 	/* We don't swab objects for directories */
 	switch (le32_to_cpu(lmm->lmm_magic)) {
 	case LOV_MAGIC_V1:
-		if (LOV_MAGIC != cpu_to_le32(LOV_MAGIC))
+		if (cpu_to_le32(LOV_MAGIC) != LOV_MAGIC)
 			lustre_swab_lov_user_md_v1((struct lov_user_md_v1 *)lmm);
 		break;
 	case LOV_MAGIC_V3:
-		if (LOV_MAGIC != cpu_to_le32(LOV_MAGIC))
+		if (cpu_to_le32(LOV_MAGIC) != LOV_MAGIC)
 			lustre_swab_lov_user_md_v3((struct lov_user_md_v3 *)lmm);
 		break;
 	default:
@@ -1554,7 +1554,7 @@ out_req:
 
 		switch (lmm->lmm_magic) {
 		case LOV_USER_MAGIC_V1:
-			if (LOV_USER_MAGIC_V1 = cpu_to_le32(LOV_USER_MAGIC_V1))
+			if (cpu_to_le32(LOV_USER_MAGIC_V1) = LOV_USER_MAGIC_V1)
 				break;
 			/* swab objects first so that stripes num will be sane */
 			lustre_swab_lov_user_md_objects(
@@ -1563,7 +1563,7 @@ out_req:
 			lustre_swab_lov_user_md_v1((struct lov_user_md_v1 *)lmm);
 			break;
 		case LOV_USER_MAGIC_V3:
-			if (LOV_USER_MAGIC_V3 = cpu_to_le32(LOV_USER_MAGIC_V3))
+			if (cpu_to_le32(LOV_USER_MAGIC_V3) = LOV_USER_MAGIC_V3)
 				break;
 			/* swab objects first so that stripes num will be sane */
 			lustre_swab_lov_user_md_objects(

