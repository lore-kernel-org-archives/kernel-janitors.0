From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 18:09:09 +0000
Subject: [PATCH] jfs: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026180909.5249-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/jfs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index 14528c0ffe63..fa719a1553b6 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -203,7 +203,7 @@ static int jfs_create(struct inode *dip, struct dentry *dentry, umode_t mode,
  * RETURN:	Errors from subroutines
  *
  * note:
- * EACCESS: user needs search+write permission on the parent directory
+ * EACCES: user needs search+write permission on the parent directory
  */
 static int jfs_mkdir(struct inode *dip, struct dentry *dentry, umode_t mode)
 {
-- 
2.19.1
