From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Fri, 29 Jun 2007 16:01:07 +0000
Subject: [KJ] [PATCH] jfs: Remove unnecessary cast of return value of kmalloc
Message-Id: <46857A1B020000F40000AA42@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc in jfs/jfs_dtree.c

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 6d62f32..e1197eb 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -592,9 +592,7 @@ int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
 	struct component_name ciKey;
 	struct super_block *sb = ip->i_sb;
 
-	ciKey.name -	    (wchar_t *) kmalloc((JFS_NAME_MAX + 1) * sizeof(wchar_t),
-				GFP_NOFS);
+	ciKey.name = kmalloc((JFS_NAME_MAX + 1) * sizeof(wchar_t), GFP_NOFS);
 	if (ciKey.name = 0) {
 		rc = -ENOMEM;
 		goto dtSearch_Exit2;
@@ -957,9 +955,7 @@ static int dtSplitUp(tid_t tid,
 	smp = split->mp;
 	sp = DT_PAGE(ip, smp);
 
-	key.name -	    (wchar_t *) kmalloc((JFS_NAME_MAX + 2) * sizeof(wchar_t),
-				GFP_NOFS);
+	key.name = kmalloc((JFS_NAME_MAX + 2) * sizeof(wchar_t), GFP_NOFS);
 	if (key.name = 0) {
 		DT_PUTPAGE(smp);
 		rc = -ENOMEM;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
