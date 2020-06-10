From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jun 2020 17:23:59 +0000
Subject: [PATCH 1/2] rsxx: Fix potential NULL dereference setting up debugfs
Message-Id: <20200610172359.GB90634@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joshua Morris <josh.h.morris@us.ibm.com>, Philip Kelleher <pjk1939@linux.ibm.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "card->gendisk" pointer is allocated in rsxx_setup_dev() but there
is a module option "enable_blkdev" which lets people disable the block
device.  In that situation the "card->gendisk" pointer is NULL and it
would lead to a NULL dereference here.

Fixes: 36f988e978f8 ("rsxx: Adding in debugfs entries.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This patch is from static analysis.  The patch is obviously harmless.
So far as I can tell, the bug is real.  But maybe a different solution
is prefered?

 drivers/block/rsxx/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index 10f6368117d81..6207449fa716f 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -228,6 +228,9 @@ static void rsxx_debugfs_dev_new(struct rsxx_cardinfo *card)
 	struct dentry *debugfs_pci_regs;
 	struct dentry *debugfs_cram;
 
+	if (!card->gendisk)
+		return;
+
 	card->debugfs_dir = debugfs_create_dir(card->gendisk->disk_name, NULL);
 	if (IS_ERR_OR_NULL(card->debugfs_dir))
 		goto failed_debugfs_dir;
-- 
2.26.2
