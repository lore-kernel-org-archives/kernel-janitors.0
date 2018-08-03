From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Aug 2018 19:31:01 +0000
Subject: [PATCH] vfs: potential deadlock in insert_inode_locked()
Message-Id: <20180803193101.e422aso76vzbo3ko@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

We added a new error path to insert_inode_locked() but we need to drop
the inode_hash_lock spin_lock before we return.

Fixes: 397127e49ff5 ("new primitive: discard_new_inode()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/inode.c b/fs/inode.c
index 593d0cfce27c..ed7c18495cd9 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1462,6 +1462,7 @@ int insert_inode_locked(struct inode *inode)
 		}
 		if (unlikely(old->i_state & I_CREATING)) {
 			spin_unlock(&old->i_lock);
+			spin_unlock(&inode_hash_lock);
 			return -EBUSY;
 		}
 		__iget(old);
