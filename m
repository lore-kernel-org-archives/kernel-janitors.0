From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 07:18:42 +0000
Subject: [PATCH 3/4] isofs: One check less in isofs_read_inode() after error detection
Message-Id: <157aa252-0edb-1462-cb6e-44369e8f1645@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
In-Reply-To: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Jan Kara <jack@suse.cz>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Aug 2017 08:10:40 +0200

* Adjust jump targets.

* Avoid a repeated check for the local variable "bh" after
  a memory allocation failure in this function.

* Delete an initialisation for the local variable "ret"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/isofs/inode.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index db43f52f2268..f6d6c2ca8723 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1304,7 +1304,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 	unsigned int de_len;
 	unsigned long offset;
 	struct iso_inode_info *ei = ISOFS_I(inode);
-	int ret = -EIO;
+	int ret;
 
 	block = ei->i_iget5_block;
 	bh = sb_bread(inode->i_sb, block);
@@ -1322,7 +1322,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 		tmpde = kmalloc(de_len, GFP_KERNEL);
 		if (!tmpde) {
 			ret = -ENOMEM;
-			goto fail;
+			goto release_bh;
 		}
 		memcpy(tmpde, bh->b_data + offset, frag1);
 		brelse(bh);
@@ -1377,7 +1377,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 	if (de->flags[-high_sierra] & 0x80) {
 		ret = isofs_read_level3_size(inode);
 		if (ret < 0)
-			goto fail;
+			goto free_tmp;
 		ret = -EIO;
 	} else {
 		ei->i_next_section_block = 0;
@@ -1475,16 +1475,17 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 		init_special_inode(inode, inode->i_mode, inode->i_rdev);
 
 	ret = 0;
-out:
+free_tmp:
 	kfree(tmpde);
 	if (bh)
+release_bh:
 		brelse(bh);
 	return ret;
 
 out_badread:
 	printk(KERN_WARNING "ISOFS: unable to read i-node block\n");
-fail:
-	goto out;
+	ret = -EIO;
+	goto free_tmp;
 }
 
 struct isofs_iget5_callback_data {
-- 
2.14.0

