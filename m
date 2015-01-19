From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jan 2015 14:43:27 +0000
Subject: [patch] NVMe: return an error code if blk_mq_alloc_tag_set() fails
Message-Id: <20150119144327.GE19086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the current code, if blk_mq_alloc_tag_set() fails then it returns
zero (success) instead of preserving the error code.  The caller is not
expecting that and the kernel could be left in an inconsistent state.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis stuff.  Not tested.

diff --git a/drivers/block/nvme-core.c b/drivers/block/nvme-core.c
index cb529e9..2ff5efc 100644
--- a/drivers/block/nvme-core.c
+++ b/drivers/block/nvme-core.c
@@ -2152,7 +2152,8 @@ static int nvme_dev_add(struct nvme_dev *dev)
 	dev->tagset.flags = BLK_MQ_F_SHOULD_MERGE;
 	dev->tagset.driver_data = dev;
 
-	if (blk_mq_alloc_tag_set(&dev->tagset))
+	res = blk_mq_alloc_tag_set(&dev->tagset);
+	if (res)
 		goto out;
 
 	id_ns = mem;
