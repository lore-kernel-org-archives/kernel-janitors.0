From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 26 Jan 2013 07:49:24 +0000
Subject: [patch] edac: test correct variable in ->store function
Message-Id: <20130126074924.GB14365@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Thompson <dougthompson@xmission.com>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We're testing for ->show but calling ->store().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/edac/edac_pci_sysfs.c b/drivers/edac/edac_pci_sysfs.c
index 7684426..e8658e4 100644
--- a/drivers/edac/edac_pci_sysfs.c
+++ b/drivers/edac/edac_pci_sysfs.c
@@ -256,7 +256,7 @@ static ssize_t edac_pci_dev_store(struct kobject *kobj,
 	struct edac_pci_dev_attribute *edac_pci_dev;
 	edac_pci_dev = (struct edac_pci_dev_attribute *)attr;
 
-	if (edac_pci_dev->show)
+	if (edac_pci_dev->store)
 		return edac_pci_dev->store(edac_pci_dev->value, buffer, count);
 	return -EIO;
 }
