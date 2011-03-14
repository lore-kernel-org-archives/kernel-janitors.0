From: Dan Carpenter <error27@gmail.com>
Date: Mon, 14 Mar 2011 09:33:37 +0000
Subject: [patch 1/2] Staging: crystalhd: change GFP_ATOMIC to GFP_KERNEL
Message-Id: <20110314093125.GL2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These two allocations are only called from the probe() path and there
aren't any locks held for probe().

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
These apply on top of Alexander Beregalov's patches. 

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index 2b47ef9..4197111 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -393,8 +393,7 @@ static int __devinit chd_dec_init_chdev(struct crystalhd_adp *adp)
 
 	/* Allocate general purpose ioctl pool. */
 	for (i = 0; i < CHD_IODATA_POOL_SZ; i++) {
-		/* FIXME: jarod: why atomic? */
-		temp = kzalloc(sizeof(struct crystalhd_ioctl_data), GFP_ATOMIC);
+		temp = kzalloc(sizeof(struct crystalhd_ioctl_data), GFP_KERNEL);
 		if (!temp) {
 			BCMLOG_ERR("ioctl data pool kzalloc failed\n");
 			rc = -ENOMEM;
@@ -549,8 +548,7 @@ static int __devinit chd_dec_pci_probe(struct pci_dev *pdev,
 	       pdev->vendor, pdev->device, pdev->subsystem_vendor,
 	       pdev->subsystem_device);
 
-	/* FIXME: jarod: why atomic? */
-	pinfo = kzalloc(sizeof(struct crystalhd_adp), GFP_ATOMIC);
+	pinfo = kzalloc(sizeof(struct crystalhd_adp), GFP_KERNEL);
 	if (!pinfo) {
 		BCMLOG_ERR("Failed to allocate memory\n");
 		return -ENOMEM;
