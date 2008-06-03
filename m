From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Tue, 03 Jun 2008 12:37:08 +0000
Subject: [PATCH] ext2 : correct comments in fs/ext2/balloc.c
Message-Id: <ea11fea30806030525j3112c599ra1ce6429906c7a69@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30805311115t72773c4u66999762bb53d157@mail.gmail.com>
In-Reply-To: <ea11fea30805311115t72773c4u66999762bb53d157@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Resending with Mark's comment incorporated.

This patch corrects the wrong function name mentioned in the comments
of ext2_free_blocks()  function

=============================

Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
Reviewed-by: Mark Asselstine <mark.asselstine@windriver.com>

diff --git a/fs/ext2/balloc.c b/fs/ext2/balloc.c
index 10bb02c..12a24c0 100644
--- a/fs/ext2/balloc.c
+++ b/fs/ext2/balloc.c
@@ -478,7 +478,7 @@ void ext2_discard_reservation(struct inode *inode)
 }

 /**
- * ext2_free_blocks_sb() -- Free given blocks and update quota and i_blocks
+ * ext2_free_blocks() -- Free given blocks and update quota and i_blocks
  * @inode:             inode
  * @block:             start physcial block to free
  * @count:             number of blocks to free


==============================
-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
