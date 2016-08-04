From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:37:03 +0000
Subject: [patch] ppc/cell: missing error code in spufs_mkgang()
Message-Id: <20160804053703.GN775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Kerr <jk@ozlabs.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM if alloc_spu_gang() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
index 5be15cf..2975754 100644
--- a/arch/powerpc/platforms/cell/spufs/inode.c
+++ b/arch/powerpc/platforms/cell/spufs/inode.c
@@ -496,8 +496,10 @@ spufs_mkgang(struct inode *dir, struct dentry *dentry, umode_t mode)
 	gang = alloc_spu_gang();
 	SPUFS_I(inode)->i_ctx = NULL;
 	SPUFS_I(inode)->i_gang = gang;
-	if (!gang)
+	if (!gang) {
+		ret = -ENOMEM;
 		goto out_iput;
+	}
 
 	inode->i_op = &simple_dir_inode_operations;
 	inode->i_fop = &simple_dir_operations;
