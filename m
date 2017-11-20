From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Nov 2017 13:58:20 +0000
Subject: [PATCH] afs: remove redundant assignment of dvnode to itself
Message-Id: <20171120135820.32596-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of dvnode to itself is redundant and can be removed.
Cleans up warning detected by cppcheck:

fs/afs/dir.c:975: (warning) Redundant assignment of 'dvnode' to itself.

Fixes: d2ddc776a458 ("afs: Overhaul volume and server record caching and fileserver rotation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index ab618d32554c..a5e121e55e57 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -972,7 +972,7 @@ static int afs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 	struct afs_fs_cursor fc;
 	struct afs_file_status newstatus;
 	struct afs_callback newcb;
-	struct afs_vnode *dvnode = dvnode = AFS_FS_I(dir);
+	struct afs_vnode *dvnode = AFS_FS_I(dir);
 	struct afs_fid newfid;
 	struct key *key;
 	int ret;
-- 
2.14.1

