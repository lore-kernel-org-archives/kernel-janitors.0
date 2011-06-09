From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Jun 2011 07:18:23 +0000
Subject: [patch] Staging: mei: fix debug code
Message-Id: <20110609071240.GF4069@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


! has higher precedence than !=.  H_RDY is 8 and since neither 0 nor
1 are equal to 8 the original condition was always true.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/mei/init.c b/drivers/staging/mei/init.c
index 2818851..d1ffa32 100644
--- a/drivers/staging/mei/init.c
+++ b/drivers/staging/mei/init.c
@@ -205,10 +205,10 @@ int mei_hw_init(struct mei_device *dev)
 			"host_hw_state = 0x%08x, me_hw_state = 0x%08x.\n",
 			dev->host_hw_state, dev->me_hw_state);
 
-		if (!(dev->host_hw_state & H_RDY) != H_RDY)
+		if (!(dev->host_hw_state & H_RDY))
 			dev_dbg(&dev->pdev->dev, "host turn off H_RDY.\n");
 
-		if (!(dev->me_hw_state & ME_RDY_HRA) != ME_RDY_HRA)
+		if (!(dev->me_hw_state & ME_RDY_HRA))
 			dev_dbg(&dev->pdev->dev, "ME turn off ME_RDY.\n");
 
 		printk(KERN_ERR "mei: link layer initialization failed.\n");
