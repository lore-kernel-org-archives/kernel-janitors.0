From: Dan Carpenter <error27@gmail.com>
Date: Sat, 15 Jan 2011 13:46:05 +0000
Subject: [patch] reiserfs: potential ERR_PTR dereference
Message-Id: <20110115134605.GB2721@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

reiserfs_iget() returns an ERR_PTR on allocation failures.  All the
other callers check for it so we should check here too.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index 0aab04f..6949b98 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -237,7 +237,7 @@ static int finish_unfinished(struct super_block *s)
 		pathrelse(&path);
 
 		inode = reiserfs_iget(s, &obj_key);
-		if (!inode) {
+		if (IS_ERR_OR_NULL(inode)) {
 			/* the unlink almost completed, it just did not manage to remove
 			   "save" link and release objectid */
 			reiserfs_warning(s, "vs-2180", "iget failed for %K",
