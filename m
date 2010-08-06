From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:49:10 +0000
Subject: [PATCH 01/18] char: moxa: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124152-12630-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if pci_request_region() fails as
it means that somebody uses device resources and rules the device.

Move pci_enable_device() after checking moxa_boards[] to remove senseless
pci_enable_device()/pci_disable_device().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/moxa.c |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/char/moxa.c b/drivers/char/moxa.c
index 107b0bd..0ea5aeb 100644
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
@@ -956,6 +951,12 @@ static int __devinit moxa_pci_probe(struct pci_dev *pdev,
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
@@ -1001,6 +1002,7 @@ err_base:
 	board->basemem = NULL;
 err_reg:
 	pci_release_region(pdev, 2);
+	pci_disable_device(pdev);
 err:
 	return retval;
 }
-- 
1.7.0.4

