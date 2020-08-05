From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Aug 2020 09:51:47 +0000
Subject: [PATCH] btrfs: Fix an error pointer vs NULL check
Message-Id: <20200805095147.GB483832@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The btrfs_get_subvol_name_from_objectid() function never
returns NULL, it returns error pointers.  Update the check
accordinglingly to prevent an Oops.

Fixes: ca346708eb17 ("btrfs: don't show full path of bind mounts in subvol=")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/btrfs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 53639de3a064..e529ddb35b87 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -1475,7 +1475,7 @@ static int btrfs_show_options(struct seq_file *seq, struct dentry *dentry)
 		  BTRFS_I(d_inode(dentry))->root->root_key.objectid);
 	subvol_name = btrfs_get_subvol_name_from_objectid(info,
 			BTRFS_I(d_inode(dentry))->root->root_key.objectid);
-	if (subvol_name) {
+	if (!IS_ERR(subvol_name)) {
 		seq_puts(seq, ",subvol=");
 		seq_escape(seq, subvol_name, " \t\n\\");
 		kfree(subvol_name);
-- 
2.27.0
