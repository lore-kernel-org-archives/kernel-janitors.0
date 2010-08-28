From: "Prashant P. Shah" <pshah.mumbai@gmail.com>
Date: Sat, 28 Aug 2010 16:41:46 +0000
Subject: [PATCH] Staging: solo6x10: fixed assignments in if conditions in solo6010-core.c
Message-Id: <1283012986-3708-1-git-send-email-pshah.mumbai@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: pshah.mumbai@gmail.com, bcollins@bluecherry.net, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a patch to the solo6010-core.c file that fixes the assignments
in if condition style issues found by the checkpatch.pl tool.

Signed-off-by: Prashant P. Shah <pshah.mumbai@gmail.com>
---
 drivers/staging/solo6x10/solo6010-core.c |   40 +++++++++++++++++++----------
 1 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/solo6x10/solo6010-core.c b/drivers/staging/solo6x10/solo6010-core.c
index 98c6739..4a051cd 100644
--- a/drivers/staging/solo6x10/solo6010-core.c
+++ b/drivers/staging/solo6x10/solo6010-core.c
@@ -136,23 +136,26 @@ static int __devinit solo6010_pci_probe(struct pci_dev *pdev,
 	int ret;
 	int sdram;
 	u8 chip_id;
-
-	if ((solo_dev = kzalloc(sizeof(*solo_dev), GFP_KERNEL)) = NULL)
+	solo_dev = kzalloc(sizeof(*solo_dev), GFP_KERNEL);
+	if (solo_dev = NULL)
 		return -ENOMEM;
 
 	solo_dev->pdev = pdev;
 	spin_lock_init(&solo_dev->reg_io_lock);
 	pci_set_drvdata(pdev, solo_dev);
 
-	if ((ret = pci_enable_device(pdev)))
+	ret = pci_enable_device(pdev);
+	if (ret)
 		goto fail_probe;
 
 	pci_set_master(pdev);
 
-	if ((ret = pci_request_regions(pdev, SOLO6010_NAME)))
+	ret = pci_request_regions(pdev, SOLO6010_NAME);
+	if (ret)
 		goto fail_probe;
 
-	if ((solo_dev->reg_base = pci_ioremap_bar(pdev, 0)) = NULL) {
+	solo_dev->reg_base = pci_ioremap_bar(pdev, 0);
+	if (solo_dev->reg_base = NULL) {
 		ret = -ENOMEM;
 		goto fail_probe;
 	}
@@ -198,7 +201,8 @@ static int __devinit solo6010_pci_probe(struct pci_dev *pdev,
 	/* Handle this from the start */
 	solo6010_irq_on(solo_dev, SOLO_IRQ_PCI_ERR);
 
-	if ((ret = solo_i2c_init(solo_dev)))
+	ret = solo_i2c_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
 	/* Setup the DMA engine */
@@ -210,28 +214,36 @@ static int __devinit solo6010_pci_probe(struct pci_dev *pdev,
 		       SOLO_DMA_CTRL_READ_CLK_SELECT |
 		       SOLO_DMA_CTRL_LATENCY(1));
 
-	if ((ret = solo_p2m_init(solo_dev)))
+	ret = solo_p2m_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_disp_init(solo_dev)))
+	ret = solo_disp_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_gpio_init(solo_dev)))
+	ret = solo_gpio_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_tw28_init(solo_dev)))
+	ret = solo_tw28_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_v4l2_init(solo_dev)))
+	ret = solo_v4l2_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_enc_init(solo_dev)))
+	ret = solo_enc_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_enc_v4l2_init(solo_dev)))
+	ret = solo_enc_v4l2_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
-	if ((ret = solo_g723_init(solo_dev)))
+	ret = solo_g723_init(solo_dev);
+	if (ret)
 		goto fail_probe;
 
 	return 0;
-- 
1.6.0.4

