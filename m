From: Bas Peters <baspeters93@gmail.com>
Date: Wed, 11 Feb 2015 11:24:08 +0000
Subject: [PATCH] fs: ufs: super.c: remove unnecessary casting of value.
Message-Id: <1423653848-6684-1-git-send-email-baspeters93@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dushistov@mail.ru
Cc: Bas Peters <baspeters93@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It is not necessary to cast the value returned by kmem_cache_alloc(),
thus it can be deleted.

This issue was detected using Coccinelle.

Signed-off-by: Bas Peters <baspeters93@gmail.com>
---
 fs/ufs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index da73801..1e4fbf7 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -1415,7 +1415,7 @@ static struct kmem_cache * ufs_inode_cachep;
 static struct inode *ufs_alloc_inode(struct super_block *sb)
 {
 	struct ufs_inode_info *ei;
-	ei = (struct ufs_inode_info *)kmem_cache_alloc(ufs_inode_cachep, GFP_NOFS);
+	ei = kmem_cache_alloc(ufs_inode_cachep, GFP_NOFS);
 	if (!ei)
 		return NULL;
 	ei->vfs_inode.i_version = 1;
-- 
2.1.0

