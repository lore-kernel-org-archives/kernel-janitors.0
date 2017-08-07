From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 09:23:53 +0000
Subject: [PATCH] paride: Delete an error message for a failed memory allocation in two functions
Message-Id: <46377d4f-aaab-a91f-9f39-f67ea98ba8ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tim Waugh <tim@cyberelk.net>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 11:11:34 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/paride/pg.c | 1 -
 drivers/block/paride/pt.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/paride/pg.c b/drivers/block/paride/pg.c
index 3b5882bfb736..9b036c79c49e 100644
--- a/drivers/block/paride/pg.c
+++ b/drivers/block/paride/pg.c
@@ -550,7 +550,6 @@ static int pg_open(struct inode *inode, struct file *file)
 	dev->bufptr = kmalloc(PG_MAX_DATA, GFP_KERNEL);
 	if (dev->bufptr = NULL) {
 		clear_bit(0, &dev->access);
-		printk("%s: buffer allocation failed\n", dev->name);
 		ret = -ENOMEM;
 		goto out;
 	}
diff --git a/drivers/block/paride/pt.c b/drivers/block/paride/pt.c
index e815312a00ad..33347853b7d4 100644
--- a/drivers/block/paride/pt.c
+++ b/drivers/block/paride/pt.c
@@ -687,10 +687,8 @@ static int pt_open(struct inode *inode, struct file *file)
 
 	err = -ENOMEM;
 	tape->bufptr = kmalloc(PT_BUFSIZE, GFP_KERNEL);
-	if (tape->bufptr = NULL) {
-		printk("%s: buffer allocation failed\n", tape->name);
+	if (!tape->bufptr)
 		goto out;
-	}
 
 	file->private_data = tape;
 	mutex_unlock(&pt_mutex);
-- 
2.13.4

