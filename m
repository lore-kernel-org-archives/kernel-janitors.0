From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 13:52:19 +0000
Subject: [PATCH] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling
Message-Id: <20190905135219.GA29629@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The problem is that we dereference "privdata->pci_dev" when we print
the error messages in amd_mp2_pci_init():

	dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
                ^^^^^^^^^^^^^^^^^

Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 5e4800d72e00..6bbc89d0bb27 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -349,13 +349,13 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 	if (!privdata)
 		return -ENOMEM;
 
+	mutex_init(&privdata->c2p_lock);
+	privdata->pci_dev = pci_dev;
+
 	rc = amd_mp2_pci_init(privdata, pci_dev);
 	if (rc)
 		return rc;
 
-	mutex_init(&privdata->c2p_lock);
-	privdata->pci_dev = pci_dev;
-
 	pm_runtime_set_autosuspend_delay(&pci_dev->dev, 1000);
 	pm_runtime_use_autosuspend(&pci_dev->dev);
 	pm_runtime_put_autosuspend(&pci_dev->dev);
-- 
2.20.1
