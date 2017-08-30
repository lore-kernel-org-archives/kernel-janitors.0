From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Aug 2017 14:04:56 +0000
Subject: [PATCH] kernfs: checking for IS_ERR() instead of NULL
Message-Id: <20170830140456.7n6sfogqb7mvjmrm@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shli@fb.com>, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

The kernfs_get_inode() returns NULL on error, it never returns error
pointers.

Fixes: aa8188253474 ("kernfs: add exportfs operations")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
index 7c452f4d83e9..95a7c88baed9 100644
--- a/fs/kernfs/mount.c
+++ b/fs/kernfs/mount.c
@@ -99,8 +99,8 @@ static struct inode *kernfs_fh_get_inode(struct super_block *sb,
 		return ERR_PTR(-ESTALE);
 	inode = kernfs_get_inode(sb, kn);
 	kernfs_put(kn);
-	if (IS_ERR(inode))
-		return ERR_CAST(inode);
+	if (!inode)
+		return ERR_PTR(-ESTALE);
 
 	if (generation && inode->i_generation != generation) {
 		/* we didn't find the right inode.. */
