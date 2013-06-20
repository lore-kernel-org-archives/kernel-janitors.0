From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Jun 2013 08:10:18 +0000
Subject: [patch] FMC: fix error handling in probe() function
Message-Id: <20130620081018.GB15095@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The call to kzalloc() wasn't checked.
The dev_info() message dereferenced freed memory on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/fmc/fmc-chardev.c b/drivers/fmc/fmc-chardev.c
index b071039..cc031db 100644
--- a/drivers/fmc/fmc-chardev.c
+++ b/drivers/fmc/fmc-chardev.c
@@ -136,6 +136,8 @@ static int fc_probe(struct fmc_device *fmc)
 
 	/* Create a char device: we want to create it anew */
 	fc = kzalloc(sizeof(*fc), GFP_KERNEL);
+	if (!fc)
+		return -ENOMEM;
 	fc->fmc = fmc;
 	fc->misc.minor = MISC_DYNAMIC_MINOR;
 	fc->misc.fops = &fc_fops;
@@ -143,15 +145,18 @@ static int fc_probe(struct fmc_device *fmc)
 
 	spin_lock(&fc_lock);
 	ret = misc_register(&fc->misc);
-	if (ret < 0) {
-		kfree(fc->misc.name);
-		kfree(fc);
-	} else {
-		list_add(&fc->list, &fc_devices);
-	}
+	if (ret < 0)
+		goto err_unlock;
+	list_add(&fc->list, &fc_devices);
 	spin_unlock(&fc_lock);
 	dev_info(&fc->fmc->dev, "Created misc device \"%s\"\n",
 		 fc->misc.name);
+	return 0;
+
+err_unlock:
+	spin_unlock(&fc_lock);
+	kfree(fc->misc.name);
+	kfree(fc);
 	return ret;
 }
 
