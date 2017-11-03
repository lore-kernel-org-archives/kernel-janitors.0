From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 03 Nov 2017 19:10:17 +0000
Subject: [PATCH] staging/rts5208/rtsx: Improve unlocking of a mutex in rtsx_resume()
Message-Id: <cfaa3d72-4d96-590c-cd69-662476611874@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Colin Ian King <colin.king@canonical.com>, Gaurav Pathak <gauravpathak129@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hannes Reinecke <hare@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 3 Nov 2017 20:02:22 +0100

* Add a jump target so that a call of the function "mutex_unlock" is stored
  only twice in this function implementation.

* Replace two calls by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/rts5208/rtsx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 89e2cfe7d1cc..14022a76ecfb 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -349,9 +349,7 @@ static int rtsx_resume(struct pci_dev *pci)
 		dev_err(&dev->pci->dev,
 			"%s: pci_enable_device failed, disabling device\n",
 			CR_DRIVER_NAME);
-		/* unlock the device pointers */
-		mutex_unlock(&dev->dev_mutex);
-		return -EIO;
+		goto unlock;
 	}
 	pci_set_master(pci);
 
@@ -360,11 +358,8 @@ static int rtsx_resume(struct pci_dev *pci)
 			chip->msi_en = 0;
 	}
 
-	if (rtsx_acquire_irq(dev) < 0) {
-		/* unlock the device pointers */
-		mutex_unlock(&dev->dev_mutex);
-		return -EIO;
-	}
+	if (rtsx_acquire_irq(dev) < 0)
+		goto unlock;
 
 	rtsx_write_register(chip, HOST_SLEEP_STATE, 0x03, 0x00);
 	rtsx_init_chip(chip);
@@ -373,6 +368,10 @@ static int rtsx_resume(struct pci_dev *pci)
 	mutex_unlock(&dev->dev_mutex);
 
 	return 0;
+
+unlock:
+	mutex_unlock(&dev->dev_mutex);
+	return -EIO;
 }
 #endif /* CONFIG_PM */
 
-- 
2.15.0

