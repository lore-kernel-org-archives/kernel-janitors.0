From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jul 2012 08:15:43 +0000
Subject: [patch 1/2] Btrfs: checking for NULL instead of IS_ERR
Message-Id: <20120730081542.GC15702@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <chris.mason@fusionio.com>, Arne Jansen <sensille@gmx.net>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

add_qgroup_rb() never returns NULL, only error pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to linux-next.

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index bc424ae..b650155 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -1364,8 +1364,10 @@ int btrfs_qgroup_inherit(struct btrfs_trans_handle *trans,
 	spin_lock(&fs_info->qgroup_lock);
 
 	dstgroup = add_qgroup_rb(fs_info, objectid);
-	if (!dstgroup)
+	if (IS_ERR(dstgroup)) {
+		ret = PTR_ERR(dstgroup);
 		goto unlock;
+	}
 
 	if (srcid) {
 		srcgroup = find_qgroup_rb(fs_info, srcid);
