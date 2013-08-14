From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 09:51:03 +0000
Subject: [patch] bfs: iget_locked() doesn't return an ERR_PTR
Message-Id: <20130814095103.GG521@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tigran A. Aivazian" <tigran@aivazian.fsnet.co.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

iget_locked() returns a NULL on error, it doesn't return an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/bfs/inode.c b/fs/bfs/inode.c
index 5e376bb..8defc6b 100644
--- a/fs/bfs/inode.c
+++ b/fs/bfs/inode.c
@@ -40,7 +40,7 @@ struct inode *bfs_iget(struct super_block *sb, unsigned long ino)
 	int block, off;
 
 	inode = iget_locked(sb, ino);
-	if (IS_ERR(inode))
+	if (!inode)
 		return ERR_PTR(-ENOMEM);
 	if (!(inode->i_state & I_NEW))
 		return inode;
