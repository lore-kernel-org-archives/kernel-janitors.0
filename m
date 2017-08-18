From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 13:35:30 +0000
Subject: [PATCH 1/3] jfs: Delete an error message for a failed memory allocation in diMount()
Message-Id: <12f705e1-7ba2-af59-b86d-91134153dca9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
In-Reply-To: <3ce43084-11c3-6fc0-821b-7fa6e67c3e30@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jfs-discussion@lists.sourceforge.net, Dave Kleikamp <shaggy@kernel.org>, Fabian Frederick <fabf@skynet.be>, Jan Kara <jack@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 18 Aug 2017 09:19:24 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/jfs/jfs_imap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index f36ef68905a7..da8051299e47 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -119,7 +119,5 @@ int diMount(struct inode *ipimap)
-	if (imap = NULL) {
-		jfs_err("diMount: kmalloc returned NULL!");
+	if (!imap)
 		return -ENOMEM;
-	}
 
 	/* read the on-disk inode map control structure. */
 
-- 
2.14.0

