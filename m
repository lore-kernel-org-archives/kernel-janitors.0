From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Apr 2012 06:59:29 +0000
Subject: [patch 2/2] Btrfs: cleanup: use consistent lock naming
Message-Id: <20120418065928.GF12831@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@oracle.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

It confuses Smatch that we use two names for the same lock.  Plus the
shorter name is nicer.  This doesn't change how the code works, it's
just a cleanup.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index a0bb9dc..29c0445 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -3578,7 +3578,7 @@ again:
 	space_info->chunk_alloc = 0;
 	spin_unlock(&space_info->lock);
 out:
-	mutex_unlock(&extent_root->fs_info->chunk_mutex);
+	mutex_unlock(&fs_info->chunk_mutex);
 	return ret;
 }
 
