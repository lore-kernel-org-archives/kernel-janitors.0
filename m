From: Dan Carpenter <error27@gmail.com>
Date: Wed, 07 Apr 2010 09:21:05 +0000
Subject: [patch] davinci: don't return under lock on error path
Message-Id: <20100407092105.GC5157@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Vaibhav Hiremath <hvaibhav@ti.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Muralidharan Karicheri <m-karicheri2@ti.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If the kmalloc() failed for "ccdc_cfg = kmalloc(...);" then we would exit
with the lock held.  I moved the mutex_lock() below the allocation
because it isn't protecting anything in that block and allocations are 
allocations are sometimes slow.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/davinci/vpfe_capture.c b/drivers/media/video/davinci/vpfe_capture.c
index 7cf042f..5c83f90 100644
--- a/drivers/media/video/davinci/vpfe_capture.c
+++ b/drivers/media/video/davinci/vpfe_capture.c
@@ -1824,7 +1824,6 @@ static __init int vpfe_probe(struct platform_device *pdev)
 		goto probe_free_dev_mem;
 	}
 
-	mutex_lock(&ccdc_lock);
 	/* Allocate memory for ccdc configuration */
 	ccdc_cfg = kmalloc(sizeof(struct ccdc_config), GFP_KERNEL);
 	if (NULL = ccdc_cfg) {
@@ -1833,6 +1832,8 @@ static __init int vpfe_probe(struct platform_device *pdev)
 		goto probe_free_dev_mem;
 	}
 
+	mutex_lock(&ccdc_lock);
+
 	strncpy(ccdc_cfg->name, vpfe_cfg->ccdc, 32);
 	/* Get VINT0 irq resource */
 	res1 = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
