From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Mar 2017 05:22:37 +0000
Subject: [PATCH] NFC: nfcmrvl: double free on error path
Message-Id: <20170308052237.GA14542@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>, Vincent Cuissard <cuissard@marvell.com>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The nci_spi_send() function calls kfree_skb(skb) on both error and
success so this extra kfree_skb() is a double free.

Fixes: caf6e49bf6d0 ("NFC: nfcmrvl: add spi driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

diff --git a/drivers/nfc/nfcmrvl/spi.c b/drivers/nfc/nfcmrvl/spi.c
index a7faa0bcc01e..fc8e78a29d77 100644
--- a/drivers/nfc/nfcmrvl/spi.c
+++ b/drivers/nfc/nfcmrvl/spi.c
@@ -96,10 +96,9 @@ static int nfcmrvl_spi_nci_send(struct nfcmrvl_private *priv,
 	/* Send the SPI packet */
 	err = nci_spi_send(drv_data->nci_spi, &drv_data->handshake_completion,
 			   skb);
-	if (err != 0) {
+	if (err)
 		nfc_err(priv->dev, "spi_send failed %d", err);
-		kfree_skb(skb);
-	}
+
 	return err;
 }
 
