From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 18:15:23 +0000
Subject: [PATCH] staging: exfat: remove redundant goto
Message-Id: <20190830181523.13356-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The goto after a return is never executed, so it is redundant and can
be removed.

Addresses-Coverity: ("Structurally dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/exfat/exfat_super.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/exfat/exfat_super.c b/drivers/staging/exfat/exfat_super.c
index 5b5c2ca8c9aa..5b3c4dfe0ecc 100644
--- a/drivers/staging/exfat/exfat_super.c
+++ b/drivers/staging/exfat/exfat_super.c
@@ -663,10 +663,8 @@ static int ffsLookupFile(struct inode *inode, char *path, struct file_id_t *fid)
 	/* search the file name for directories */
 	dentry = p_fs->fs_func->find_dir_entry(sb, &dir, &uni_name, num_entries,
 					       &dos_name, TYPE_ALL);
-	if (dentry < -1) {
+	if (dentry < -1)
 		return FFS_NOTFOUND;
-		goto out;
-	}
 
 	fid->dir.dir = dir.dir;
 	fid->dir.size = dir.size;
-- 
2.20.1
