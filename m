From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 15:37:59 +0000
Subject: [PATCH 2/3] fs-udf: Improve six size determinations
Message-Id: <338dd742-de63-836c-87f6-0efc4732e7f0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
In-Reply-To: <6eedcf1a-57f0-2ba4-d1b8-47a8da945d87@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 16:45:44 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/udf/inode.c | 6 +++---
 fs/udf/namei.c | 2 +-
 fs/udf/super.c | 5 ++---
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/udf/inode.c b/fs/udf/inode.c
index 7b50afc6e0c3..8dacf4f57414 100644
--- a/fs/udf/inode.c
+++ b/fs/udf/inode.c
@@ -114,7 +114,7 @@ static void udf_update_extent_cache(struct inode *inode, loff_t estart,
 	__udf_clear_extent_cache(inode);
 	if (pos->bh)
 		get_bh(pos->bh);
-	memcpy(&iinfo->cached_extent.epos, pos, sizeof(struct extent_position));
+	memcpy(&iinfo->cached_extent.epos, pos, sizeof(*pos));
 	iinfo->cached_extent.lstart = estart;
 	switch (iinfo->i_alloc_type) {
 	case ICBTAG_FLAG_AD_SHORT:
@@ -1698,7 +1698,7 @@ static int udf_update_inode(struct inode *inode, int do_sync)
 			dsea->impUseLength = cpu_to_le32(sizeof(struct regid));
 		}
 		eid = (struct regid *)dsea->impUse;
-		memset(eid, 0, sizeof(struct regid));
+		memset(eid, 0, sizeof(*eid));
 		strcpy(eid->ident, UDF_ID_DEVELOPER);
 		eid->identSuffix[0] = UDF_OS_CLASS_UNIX;
 		eid->identSuffix[1] = UDF_OS_ID_LINUX;
@@ -1749,7 +1749,7 @@ static int udf_update_inode(struct inode *inode, int do_sync)
 		udf_time_to_disk_stamp(&efe->createTime, iinfo->i_crtime);
 		udf_time_to_disk_stamp(&efe->attrTime, inode->i_ctime);
 
-		memset(&(efe->impIdent), 0, sizeof(struct regid));
+		memset(&(efe->impIdent), 0, sizeof(efe->impIdent));
 		strcpy(efe->impIdent.ident, UDF_ID_DEVELOPER);
 		efe->impIdent.identSuffix[0] = UDF_OS_CLASS_UNIX;
 		efe->impIdent.identSuffix[1] = UDF_OS_ID_LINUX;
diff --git a/fs/udf/namei.c b/fs/udf/namei.c
index 385ee89d5824..885198dfd9f8 100644
--- a/fs/udf/namei.c
+++ b/fs/udf/namei.c
@@ -1184,7 +1184,7 @@ static int udf_rename(struct inode *old_dir, struct dentry *old_dentry,
 	 */
 	ncfi.fileVersionNum = ocfi.fileVersionNum;
 	ncfi.fileCharacteristics = ocfi.fileCharacteristics;
-	memcpy(&(ncfi.icb), &(ocfi.icb), sizeof(struct long_ad));
+	memcpy(&(ncfi.icb), &(ocfi.icb), sizeof(ocfi.icb));
 	udf_write_fi(new_dir, &ncfi, nfi, &nfibh, NULL, NULL);
 
 	/* The old fid may have moved - find it again */
diff --git a/fs/udf/super.c b/fs/udf/super.c
index ca4b4274b524..0dc7c2d9f0fa 100644
--- a/fs/udf/super.c
+++ b/fs/udf/super.c
@@ -266,6 +266,5 @@ static int udf_sb_alloc_partition_maps(struct super_block *sb, u32 count)
 {
 	struct udf_sb_info *sbi = UDF_SB(sb);
 
-	sbi->s_partmaps = kcalloc(count, sizeof(struct udf_part_map),
-				  GFP_KERNEL);
+	sbi->s_partmaps = kcalloc(count, sizeof(*sbi->s_partmaps), GFP_KERNEL);
 	if (!sbi->s_partmaps) {
@@ -2097,7 +2096,7 @@ static int udf_fill_super(struct super_block *sb, void *options, int silent)
 	uopt.fmode = UDF_INVALID_MODE;
 	uopt.dmode = UDF_INVALID_MODE;
 
-	sbi = kzalloc(sizeof(struct udf_sb_info), GFP_KERNEL);
+	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
 		return -ENOMEM;
 
-- 
2.14.0

