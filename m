From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Sep 2019 09:59:08 +0000
Subject: [PATCH] staging: exfat: Fix two missing unlocks on error paths
Message-Id: <20190904095908.GA7007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

These two error paths need to unlock before we can return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/exfat/exfat_super.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5b5c2ca8c9aa..87e66e385e88 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -664,7 +670,7 @@ static int ffsLookupFile(struct inode *inode, char *path, struct file_id_t *fid)
 	dentry = p_fs->fs_func->find_dir_entry(sb, &dir, &uni_name, num_entries,
 					       &dos_name, TYPE_ALL);
 	if (dentry < -1) {
-		return FFS_NOTFOUND;
+		ret = FFS_NOTFOUND;
 		goto out;
 	}
 
@@ -1199,8 +1205,10 @@ static int ffsTruncateFile(struct inode *inode, u64 old_size, u64 new_size)
 		} else {
 			while (num_clusters > 0) {
 				last_clu = clu.dir;
-				if (FAT_read(sb, clu.dir, &clu.dir) = -1)
-					return FFS_MEDIAERR;
+				if (FAT_read(sb, clu.dir, &clu.dir) = -1) {
+					ret = FFS_MEDIAERR;
+					goto out;
+				}
 				num_clusters--;
 			}
 		}
-- 
2.20.1
