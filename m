From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:53:03 +0000
Subject: [PATCH 14/18] staging: rtl8187se: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124385-13837-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Larry Finger <Larry.Finger@lwfinger.net>, Joe Perches <joe@perches.com>, "Prashant P. Shah" <pshah.mumbai@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if request_mem_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/rtl8187se/r8180_core.c |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8187se/r8180_core.c b/drivers/staging/rtl8187se/r8180_core.c
index ed7457b..abd2d69 100644
--- a/drivers/staging/rtl8187se/r8180_core.c
+++ b/drivers/staging/rtl8187se/r8180_core.c
@@ -3547,6 +3547,8 @@ static int __devinit rtl8180_pci_probe(struct pci_dev *pdev,
 	struct net_device *dev = NULL;
 	struct r8180_priv *priv = NULL;
 	u8 unit = 0;
+	int ret = -ENODEV;
+	int pci_dev_busy = 0;
 
 	unsigned long pmem_start, pmem_len, pmem_flags;
 
@@ -3561,8 +3563,10 @@ static int __devinit rtl8180_pci_probe(struct pci_dev *pdev,
 	pci_set_dma_mask(pdev, 0xffffff00ULL);
 	pci_set_consistent_dma_mask(pdev, 0xffffff00ULL);
 	dev = alloc_ieee80211(sizeof(struct r8180_priv));
-	if (!dev)
-		return -ENOMEM;
+	if (!dev) {
+		ret = -ENOMEM;
+		goto fail_free;
+	}
 	priv = ieee80211_priv(dev);
 	priv->ieee80211 = netdev_priv(dev);
 
@@ -3583,6 +3587,7 @@ static int __devinit rtl8180_pci_probe(struct pci_dev *pdev,
 
 	if (!request_mem_region(pmem_start, pmem_len, RTL8180_MODULE_NAME)) {
 		DMESG("request_mem_region failed!");
+		pci_dev_busy = 1;
 		goto fail;
 	}
 
@@ -3641,11 +3646,13 @@ fail:
 		free_ieee80211(dev);
 	}
 
-	pci_disable_device(pdev);
+fail_free:
+	if (!pci_dev_busy)
+		pci_disable_device(pdev);
 
 	DMESG("wlan driver load failed\n");
 	pci_set_drvdata(pdev, NULL);
-	return -ENODEV;
+	return ret;
 }
 
 static void __devexit rtl8180_pci_remove(struct pci_dev *pdev)
-- 
1.7.0.4

