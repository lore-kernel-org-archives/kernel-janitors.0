From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jan 2014 13:34:11 +0000
Subject: [patch v2] usb: gadget: gr_udc: remove some unneeded error handling
Message-Id: <20140117133411.GA28699@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Debugfs function return an ERR_PTR if they compiled out.  We don't need
to test for that here because if the debugfs file are compiled out then
it is ok to pass an ERR_PTR to debugfs_create_file() since it will just
be a no-op stub.

Debugfs return NULLs on error, but we don't need to test for that either
because debugfs_create_file() will accept NULL pointers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: remove the error handling.  It's not needed

diff --git a/drivers/usb/gadget/gr_udc.c b/drivers/usb/gadget/gr_udc.c
index 914cbd84ee40..f984ee75324d 100644
--- a/drivers/usb/gadget/gr_udc.c
+++ b/drivers/usb/gadget/gr_udc.c
@@ -225,14 +225,8 @@ static void gr_dfs_create(struct gr_udc *dev)
 	const char *name = "gr_udc_state";
 
 	dev->dfs_root = debugfs_create_dir(dev_name(dev->dev), NULL);
-	if (IS_ERR(dev->dfs_root)) {
-		dev_err(dev->dev, "Failed to create debugfs directory\n");
-		return;
-	}
-	dev->dfs_state = debugfs_create_file(name, 0444, dev->dfs_root,
-					     dev, &gr_dfs_fops);
-	if (IS_ERR(dev->dfs_state))
-		dev_err(dev->dev, "Failed to create debugfs file %s\n", name);
+	dev->dfs_state = debugfs_create_file(name, 0444, dev->dfs_root, dev,
+					     &gr_dfs_fops);
 }
 
 static void gr_dfs_delete(struct gr_udc *dev)
