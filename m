From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:27:26 +0000
Subject: [patch] vfio-mdev: fix some error codes in the sample code
Message-Id: <20161124112726.GN17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirti Wankhede <kwankhede@nvidia.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

This is just sample code.  We forget to set the error codes in a couple
places.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 6b633a4..40ed3c0 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1447,6 +1447,7 @@ static int __init mtty_dev_init(void)
 
 	if (IS_ERR(mtty_dev.vd_class)) {
 		pr_err("Error: failed to register mtty_dev class\n");
+		ret = PTR_ERR(mtty_dev.vd_class);
 		goto failed1;
 	}
 
@@ -1458,7 +1459,8 @@ static int __init mtty_dev_init(void)
 	if (ret)
 		goto failed2;
 
-	if (mdev_register_device(&mtty_dev.dev, &mdev_fops) != 0)
+	ret = mdev_register_device(&mtty_dev.dev, &mdev_fops);
+	if (ret)
 		goto failed3;
 
 	mutex_init(&mdev_list_lock);
