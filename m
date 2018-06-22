From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jun 2018 11:16:20 +0000
Subject: [PATCH] afs: memory leak in afs_init_fs_context()
Message-Id: <20180622111620.m5n42ezymkdrbyxf@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to free "ctx" before returning on this error path.

Fixes: 1ec2b51af007 ("afs: Add fs_context support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/afs/super.c b/fs/afs/super.c
index 656f810c5234..037f20f5ee90 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -596,8 +596,10 @@ static int afs_init_fs_context(struct fs_context *fc, struct dentry *reference)
 		break;
 
 	case FS_CONTEXT_FOR_SUBMOUNT:
-		if (!reference)
+		if (!reference) {
+			kfree(ctx);
 			return -EINVAL;
+		}
 
 		src_as = AFS_FS_S(reference->d_sb);
 		ASSERT(src_as);
