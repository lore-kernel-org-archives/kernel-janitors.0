From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 15:03:44 +0000
Subject: [PATCH -next] block: fix error return code in mm_pci_probe()
Message-Id: <20200428150344.101399-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENOMEM from the memory alloc failed
error handling case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/block/umem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/block/umem.c b/drivers/block/umem.c
index d84e8a878df2..184cb8f20387 100644
--- a/drivers/block/umem.c
+++ b/drivers/block/umem.c
@@ -875,6 +875,7 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (card->mm_pages[0].desc = NULL ||
 	    card->mm_pages[1].desc = NULL) {
 		dev_printk(KERN_ERR, &card->dev->dev, "alloc failed\n");
+		ret = -ENOMEM;
 		goto failed_alloc;
 	}
 	reset_page(&card->mm_pages[0]);
@@ -886,8 +887,10 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	spin_lock_init(&card->lock);
 
 	card->queue = blk_alloc_queue(mm_make_request, NUMA_NO_NODE);
-	if (!card->queue)
+	if (!card->queue) {
+		ret = -ENOMEM;
 		goto failed_alloc;
+	}
 	card->queue->queuedata = card;
 
 	tasklet_init(&card->tasklet, process_page, (unsigned long)card);
