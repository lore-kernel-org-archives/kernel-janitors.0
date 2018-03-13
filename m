From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 13 Mar 2018 21:01:13 +0000
Subject: [PATCH] staging: vme: vme_user: Fix some error handling paths in 'vme_user_probe()'
Message-Id: <20180313210113.11624-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martyn@welchs.me.uk, manohar.vanga@gmail.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

2 gotos in error handling paths branch to the wrong label.
Fix it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/vme/devices/vme_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
index 3242dee8246f..6a33aaa1a49f 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -558,7 +558,7 @@ static int vme_user_probe(struct vme_dev *vdev)
 	vme_user_cdev->owner = THIS_MODULE;
 	err = cdev_add(vme_user_cdev, MKDEV(VME_MAJOR, 0), VME_DEVS);
 	if (err)
-		goto err_char;
+		goto err_class;
 
 	/* Request slave resources and allocate buffers (128kB wide) */
 	for (i = SLAVE_MINOR; i < (SLAVE_MAX + 1); i++) {
@@ -618,7 +618,7 @@ static int vme_user_probe(struct vme_dev *vdev)
 	if (IS_ERR(vme_user_sysfs_class)) {
 		dev_err(&vdev->dev, "Error creating vme_user class.\n");
 		err = PTR_ERR(vme_user_sysfs_class);
-		goto err_class;
+		goto err_master;
 	}
 
 	/* Add sysfs Entries */
-- 
2.14.1

