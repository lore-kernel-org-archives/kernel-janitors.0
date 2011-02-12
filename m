From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 12 Feb 2011 03:38:25 +0000
Subject: [PATCH 4/4] Staging: bcm: Bcmchar: Fix some checkpatch errors
Message-Id: <1297481905-22331-5-git-send-email-martinez.javier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/bcm/Bcmchar.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/bcm/Bcmchar.c b/drivers/staging/bcm/Bcmchar.c
index 2064c2e..3d9055a 100644
--- a/drivers/staging/bcm/Bcmchar.c
+++ b/drivers/staging/bcm/Bcmchar.c
@@ -2100,7 +2100,7 @@ static long bcm_char_ioctl(struct file *filp, UINT cmd, ULONG arg)
 }
 
 
-static struct file_operations bcm_fops = {
+static const struct file_operations bcm_fops = {
 	.owner    = THIS_MODULE,
 	.open     = bcm_char_open,
 	.release  = bcm_char_release,
@@ -2114,32 +2114,32 @@ extern struct class *bcm_class;
 int register_control_device_interface(PMINI_ADAPTER Adapter)
 {
 
-	if(Adapter->major>0)
+	if (Adapter->major > 0)
 		return Adapter->major;
 
 	Adapter->major = register_chrdev(0, DEV_NAME, &bcm_fops);
-	if(Adapter->major < 0) {
+	if (Adapter->major < 0) {
 		pr_err(DRV_NAME ": could not created character device\n");
 		return Adapter->major;
 	}
 
-	Adapter->pstCreatedClassDevice = device_create (bcm_class, NULL,
-							MKDEV(Adapter->major, 0), Adapter,
-							DEV_NAME);
+	Adapter->pstCreatedClassDevice = device_create(bcm_class, NULL,
+						       MKDEV(Adapter->major, 0),
+						       Adapter, DEV_NAME);
 
-	if(IS_ERR(Adapter->pstCreatedClassDevice)) {
+	if (IS_ERR(Adapter->pstCreatedClassDevice)) {
 		pr_err(DRV_NAME ": class device create failed\n");
 		unregister_chrdev(Adapter->major, DEV_NAME);
 		return PTR_ERR(Adapter->pstCreatedClassDevice);
 	}
-			
+
 	return 0;
 }
 
 void unregister_control_device_interface(PMINI_ADAPTER Adapter)
 {
-	if(Adapter->major > 0) {
-		device_destroy (bcm_class, MKDEV(Adapter->major, 0));
+	if (Adapter->major > 0) {
+		device_destroy(bcm_class, MKDEV(Adapter->major, 0));
 		unregister_chrdev(Adapter->major, DEV_NAME);
 	}
 }
-- 
1.7.0.4

