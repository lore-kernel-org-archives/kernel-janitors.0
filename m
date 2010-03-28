From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:29:35 +0000
Subject: [patch] video/cx231xx: cleanup. remove unneed null checks
Message-Id: <20100328112935.GQ5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Srinivasa Deevi <srinivasa.deevi@conexant.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"dev" is never NULL here so there is no need to check.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/cx231xx/cx231xx-core.c b/drivers/media/video/cx231xx/cx231xx-core.c
index 4a60dfb..866fb12 100644
--- a/drivers/media/video/cx231xx/cx231xx-core.c
+++ b/drivers/media/video/cx231xx/cx231xx-core.c
@@ -95,10 +95,9 @@ int cx231xx_register_extension(struct cx231xx_ops *ops)
 	mutex_lock(&cx231xx_devlist_mutex);
 	mutex_lock(&cx231xx_extension_devlist_lock);
 	list_add_tail(&ops->next, &cx231xx_extension_devlist);
-	list_for_each_entry(dev, &cx231xx_devlist, devlist) {
-		if (dev)
-			ops->init(dev);
-	}
+	list_for_each_entry(dev, &cx231xx_devlist, devlist)
+		ops->init(dev);
+
 	printk(KERN_INFO DRIVER_NAME ": %s initialized\n", ops->name);
 	mutex_unlock(&cx231xx_extension_devlist_lock);
 	mutex_unlock(&cx231xx_devlist_mutex);
@@ -111,10 +110,8 @@ void cx231xx_unregister_extension(struct cx231xx_ops *ops)
 	struct cx231xx *dev = NULL;
 
 	mutex_lock(&cx231xx_devlist_mutex);
-	list_for_each_entry(dev, &cx231xx_devlist, devlist) {
-		if (dev)
-			ops->fini(dev);
-	}
+	list_for_each_entry(dev, &cx231xx_devlist, devlist)
+		ops->fini(dev);
 
 	mutex_lock(&cx231xx_extension_devlist_lock);
 	printk(KERN_INFO DRIVER_NAME ": %s removed\n", ops->name);
