From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 09 Aug 2010 19:49:27 +0000
Subject: [PATCH 02/18 v2] char: mxser: call disable_pci_device() if pci_probe() failed
Message-Id: <1281383369-13613-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jiri Slaby <jirislaby@gmail.com>, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Kulikov Vasiliy <segooon@gmail.com>, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/mxser.c |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/char/mxser.c b/drivers/char/mxser.c
index 3fc89da..79009e2 100644
--- a/drivers/char/mxser.c
+++ b/drivers/char/mxser.c
@@ -2555,7 +2555,7 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
 	ioaddress = pci_resource_start(pdev, 2);
 	retval = pci_request_region(pdev, 2, "mxser(IO)");
 	if (retval)
-		goto err;
+		goto err_disable;
 
 	brd->info = &mxser_cards[ent->driver_data];
 	for (i = 0; i < brd->info->nports; i++)
@@ -2564,8 +2564,11 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
 	/* vector */
 	ioaddress = pci_resource_start(pdev, 3);
 	retval = pci_request_region(pdev, 3, "mxser(vector)");
-	if (retval)
-		goto err_relio;
+	if (retval) {
+		pci_release_region(pdev, 2);
+		brd->info = NULL;
+		goto err_release;
+	}
 	brd->vector = ioaddress;
 
 	/* irq */
@@ -2616,10 +2619,13 @@ static int __devinit mxser_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, brd);
 
 	return 0;
-err_relio:
-	pci_release_region(pdev, 2);
 err_null:
 	brd->info = NULL;
+	pci_release_region(pdev, 2);
+err_release:
+	pci_release_region(pdev, 3);
+err_disable:
+	pci_disable_device(pdev);
 err:
 	return retval;
 #else
-- 
1.7.0.4

