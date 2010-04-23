From: Dan Carpenter <error27@gmail.com>
Date: Fri, 23 Apr 2010 20:19:13 +0000
Subject: [patch] i2o: trivial: cleanup some exit paths
Message-Id: <20100423201717.GK29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is just a cleanup and doesn't change how the code works.

The original code had a mix of returns and gotos so I changed everything
to just return directly.

Signed-off-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Christoph Lameter <cl@linux-foundation.org>
---
There isn't really a maintainer for this code and Alan Cox suggested
that I just send it through the trivial tree.

diff --git a/drivers/message/i2o/i2o_config.c b/drivers/message/i2o/i2o_config.c
index 11073fa..d33693c 100644
--- a/drivers/message/i2o/i2o_config.c
+++ b/drivers/message/i2o/i2o_config.c
@@ -314,22 +314,22 @@ static int i2o_cfg_swul(unsigned long arg)
 	int ret = 0;
 
 	if (copy_from_user(&kxfer, pxfer, sizeof(struct i2o_sw_xfer)))
-		goto return_fault;
+		return -EFAULT;
 
 	if (get_user(swlen, kxfer.swlen) < 0)
-		goto return_fault;
+		return -EFAULT;
 
 	if (get_user(maxfrag, kxfer.maxfrag) < 0)
-		goto return_fault;
+		return -EFAULT;
 
 	if (get_user(curfrag, kxfer.curfrag) < 0)
-		goto return_fault;
+		return -EFAULT;
 
 	if (curfrag = maxfrag)
 		fragsize = swlen - (maxfrag - 1) * 8192;
 
 	if (!kxfer.buf)
-		goto return_fault;
+		return -EFAULT;
 
 	c = i2o_find_iop(kxfer.iop);
 	if (!c)
@@ -373,12 +373,8 @@ static int i2o_cfg_swul(unsigned long arg)
 
 	i2o_dma_free(&c->pdev->dev, &buffer);
 
-      return_ret:
 	return ret;
-      return_fault:
-	ret = -EFAULT;
-	goto return_ret;
-};
+}
 
 static int i2o_cfg_swdel(unsigned long arg)
 {
