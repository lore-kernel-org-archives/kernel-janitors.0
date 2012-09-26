From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 18:15:39 +0000
Subject: [Patch 2/5] Staging: winbond: Typo corrections in comments
Message-Id: <5063437B.70808@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Few typo corrections in comments

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35tx.c |   10 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -uprN a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
--- a/drivers/staging/winbond/wb35tx.c
+++ b/drivers/staging/winbond/wb35tx.c
@@ -41,7 +41,7 @@ static void Wb35Tx_complete(struct urb *
 	pWb35Tx->TxSendIndex++;
 	pWb35Tx->TxSendIndex %= MAX_USB_TX_BUFFER_NUMBER;
 
-	if (pHwData->SurpriseRemove) /* Let WbWlanHalt to handle surprise remove */
+	if (pHwData->SurpriseRemove) /* Let WbWlanHalt handle surprise remove */
 		goto error;
 
 	if (pWb35Tx->tx_halt)
@@ -151,13 +151,13 @@ void Wb35Tx_stop(struct hw_data * pHwDat
 
 	/* Try to cancel the Trp of EP2 */
 	if (pWb35Tx->EP2vm_state = VM_RUNNING)
-		/* Only use unlink, let Wb35Tx_destroy to free them */
+		/* Only use unlink, let Wb35Tx_destroy free them */
 		usb_unlink_urb( pWb35Tx->Tx2Urb );
 	pr_debug("EP2 Tx stop\n");
 
 	/* Try to cancel the Irp of EP4 */
 	if (pWb35Tx->EP4vm_state = VM_RUNNING)
-		/* Only use unlink, let Wb35Tx_destroy to free them */
+		/* Only use unlink, let Wb35Tx_destroy free them */
 		usb_unlink_urb( pWb35Tx->Tx4Urb );
 	pr_debug("EP4 Tx stop\n");
 }
@@ -216,7 +216,7 @@ static void Wb35Tx_EP2VM_complete(struct
 	pWb35Tx->EP2VM_status = pUrb->status;
 
 	/* For Linux 2.4. Interrupt will always trigger */
-	if (pHwData->SurpriseRemove) /* Let WbWlanHalt to handle surprise remove */
+	if (pHwData->SurpriseRemove) /* Let WbWlanHalt handle surprise remove */
 		goto error;
 
 	if (pWb35Tx->tx_halt)
