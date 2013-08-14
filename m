From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 09:49:40 +0000
Subject: [patch] efs: iget_locked() doesn't return an ERR_PTR()
Message-Id: <20130814094940.GF521@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Serge Hallyn <serge.hallyn@canonical.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The iget_locked() function returns NULL on error and never an ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/efs/inode.c b/fs/efs/inode.c
index f3913eb..d15ccf2 100644
--- a/fs/efs/inode.c
+++ b/fs/efs/inode.c
@@ -57,7 +57,7 @@ struct inode *efs_iget(struct super_block *super, unsigned long ino)
 	struct inode *inode;
 
 	inode = iget_locked(super, ino);
-	if (IS_ERR(inode))
+	if (!inode)
 		return ERR_PTR(-ENOMEM);
 	if (!(inode->i_state & I_NEW))
 		return inode;
