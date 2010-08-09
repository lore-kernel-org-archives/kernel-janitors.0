From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 09 Aug 2010 19:49:20 +0000
Subject: [PATCH 01/18 v2] char: moxa: call disable_pci_device() if pci_probe() failed
Message-Id: <1281383362-13573-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/moxa.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/char/moxa.c b/drivers/char/moxa.c
index 107b0bd..4d81c2b 100644
--- a/drivers/char/moxa.c
+++ b/drivers/char/moxa.c
@@ -939,11 +939,6 @@ static int __devinit moxa_pci_probe(struct pci_dev *pdev,
 	int board_type = ent->driver_data;
 	int retval;
 
-	retval = pci_enable_device(pdev);
-	if (retval) {
-		dev_err(&pdev->dev, "can't enable pci device\n");
-		goto err;
-	}
 
 	for (i = 0; i < MAX_BOARDS; i++)
 		if (moxa_boards[i].basemem = NULL)
@@ -956,16 +951,23 @@ static int __devinit moxa_pci_probe(struct pci_dev *pdev,
 		goto err;
 	}
 
+	retval = pci_enable_device(pdev);
+	if (retval) {
+		dev_err(&pdev->dev, "can't enable pci device\n");
+		goto err;
+	}
+
 	board = &moxa_boards[i];
 
 	retval = pci_request_region(pdev, 2, "moxa-base");
 	if (retval) {
 		dev_err(&pdev->dev, "can't request pci region 2\n");
-		goto err;
+		goto err_disable;
 	}
 
 	board->basemem = ioremap_nocache(pci_resource_start(pdev, 2), 0x4000);
 	if (board->basemem = NULL) {
+		retval = -ENOMEM;
 		dev_err(&pdev->dev, "can't remap io space 2\n");
 		goto err_reg;
 	}
@@ -1001,6 +1003,8 @@ err_base:
 	board->basemem = NULL;
 err_reg:
 	pci_release_region(pdev, 2);
+err_disable:
+	pci_disable_device(pdev);
 err:
 	return retval;
 }
-- 
1.7.0.4

