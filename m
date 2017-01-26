From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jan 2017 09:01:46 +0000
Subject: [patch] eeprom/idt_89hpesx: freeing devm_ pointer with kfree()
Message-Id: <20170126090145.GA942@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Serge Semin <fancer.lancer@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"pdev->ee_file" was allocated with devm_kmalloc() so freeing it with
kfree() is a double free.  In fact, we don't need to free it at all.

Fixes: cfad6425382e ("eeprom: Add IDT 89HPESx EEPROM/CSR driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/eeprom/idt_89hpesx.c b/drivers/misc/eeprom/idt_89hpesx.c
index 25d47d09e1cb..f5f2c5a8d9b0 100644
--- a/drivers/misc/eeprom/idt_89hpesx.c
+++ b/drivers/misc/eeprom/idt_89hpesx.c
@@ -1359,7 +1359,6 @@ static int idt_create_sysfs_files(struct idt_89hpesx_dev *pdev)
 	pdev->ee_file->size = pdev->eesize;
 	ret = sysfs_create_bin_file(&dev->kobj, pdev->ee_file);
 	if (ret != 0) {
-		kfree(pdev->ee_file);
 		dev_err(dev, "Failed to create EEPROM sysfs-node");
 		return ret;
 	}
@@ -1381,9 +1380,6 @@ static void idt_remove_sysfs_files(struct idt_89hpesx_dev *pdev)
 
 	/* Remove EEPROM sysfs file */
 	sysfs_remove_bin_file(&dev->kobj, pdev->ee_file);
-
-	/* Free memory allocated for bin_attribute structure */
-	kfree(pdev->ee_file);
 }
 
 /*
