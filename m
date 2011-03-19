From: Dan Carpenter <error27@gmail.com>
Date: Sat, 19 Mar 2011 04:38:13 +0000
Subject: [patch] vlynq: fix resource size calculation
Message-Id: <20110319043813.GA2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code had an off-by-one error so we didn't release the
entire memory region on remove().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
index f885c86..1d37553 100644
--- a/drivers/vlynq/vlynq.c
+++ b/drivers/vlynq/vlynq.c
@@ -764,7 +764,7 @@ static int vlynq_remove(struct platform_device *pdev)
 
 	device_unregister(&dev->dev);
 	iounmap(dev->local);
-	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start);
+	release_mem_region(dev->regs_start, dev->regs_end - dev->regs_start + 1);
 
 	kfree(dev);
 
