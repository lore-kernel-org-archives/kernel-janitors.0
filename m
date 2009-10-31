From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 31 Oct 2009 05:25:15 +0000
Subject: [PATCH] fs/freevxfs/vxfs_lookup: Fix compile warning
Message-Id: <1256966715.4278.10.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On linux-next 20091030 I got this compile warning:

fs/freevxfs/vxfs_lookup.c: In function ‘vxfs_lookup’:
fs/freevxfs/vxfs_lookup.c:177: warning: ‘pp’ may be used uninitialized in this function
fs/freevxfs/vxfs_lookup.c:177: note: ‘pp’ was declared here

This patch solves the issue.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 fs/freevxfs/vxfs_lookup.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/freevxfs/vxfs_lookup.c b/fs/freevxfs/vxfs_lookup.c
index aee049c..151b5e9 100644
--- a/fs/freevxfs/vxfs_lookup.c
+++ b/fs/freevxfs/vxfs_lookup.c
@@ -174,7 +174,7 @@ static ino_t
 vxfs_inode_by_name(struct inode *dip, struct dentry *dp)
 {
 	struct vxfs_direct		*de;
-	struct page			*pp;
+	struct page			*pp = NULL;
 	ino_t				ino = 0;
 
 	de = vxfs_find_entry(dip, dp, &pp);
-- 
1.6.0.4

	


