From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Jul 2017 19:55:04 +0000
Subject: [PATCH] staging: vchiq_arm: fix error codes in probe
Message-Id: <20170711195456.brrzp7rotktte2jq@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If vchiq_debugfs_init() fails, then we accidentally return a valid
pointer casted to int on error.  This code is simpler if we get rid of
the "ptr_err" variable and just use "err" throughout.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 030bec855d86..314ffac50bb8 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -3391,7 +3391,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	struct device_node *fw_node;
 	struct rpi_firmware *fw;
 	int err;
-	void *ptr_err;
 
 	fw_node = of_parse_phandle(pdev->dev.of_node, "firmware", 0);
 	if (!fw_node) {
@@ -3427,14 +3426,14 @@ static int vchiq_probe(struct platform_device *pdev)
 
 	/* create sysfs entries */
 	vchiq_class = class_create(THIS_MODULE, DEVICE_NAME);
-	ptr_err = vchiq_class;
-	if (IS_ERR(ptr_err))
+	err = PTR_ERR(vchiq_class);
+	if (IS_ERR(vchiq_class))
 		goto failed_class_create;
 
 	vchiq_dev = device_create(vchiq_class, NULL,
 		vchiq_devid, NULL, "vchiq");
-	ptr_err = vchiq_dev;
-	if (IS_ERR(ptr_err))
+	err = PTR_ERR(vchiq_dev);
+	if (IS_ERR(vchiq_dev))
 		goto failed_device_create;
 
 	/* create debugfs entries */
@@ -3455,7 +3454,6 @@ static int vchiq_probe(struct platform_device *pdev)
 	class_destroy(vchiq_class);
 failed_class_create:
 	cdev_del(&vchiq_cdev);
-	err = PTR_ERR(ptr_err);
 failed_cdev_add:
 	unregister_chrdev_region(vchiq_devid, 1);
 failed_platform_init:
