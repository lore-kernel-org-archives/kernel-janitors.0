From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 18:16:42 +0000
Subject: [Patch 3/5] Staging: winbond: Removed undesired spaces, lines and tabs
Message-Id: <506343BA.6010900@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

checkpatch cleanup: Removed some undesired spaces, lines and tabs to comply with coding style.

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35tx.c |   62 ++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff -uprN a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
--- a/drivers/staging/winbond/wb35tx.c
+++ b/drivers/staging/winbond/wb35tx.c
@@ -15,7 +15,7 @@
 #include "mds_f.h"
 
 unsigned char
-Wb35Tx_get_tx_buffer(struct hw_data * pHwData, u8 **pBuffer)
+Wb35Tx_get_tx_buffer(struct hw_data *pHwData, u8 **pBuffer)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
@@ -25,10 +25,10 @@ Wb35Tx_get_tx_buffer(struct hw_data * pH
 
 static void Wb35Tx(struct wbsoft_priv *adapter);
 
-static void Wb35Tx_complete(struct urb * pUrb)
+static void Wb35Tx_complete(struct urb *pUrb)
 {
 	struct wbsoft_priv *adapter = pUrb->context;
-	struct hw_data *	pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 	struct wb35_mds *pMds = &adapter->Mds;
 
@@ -37,7 +37,7 @@ static void Wb35Tx_complete(struct urb *
 	pWb35Tx->EP4vm_state = VM_COMPLETED;
 	pWb35Tx->EP4VM_status = pUrb->status; /* Store the last result of Irp */
 	/* Set the owner. Free the owner bit always. */
-	pMds->TxOwner[ pWb35Tx->TxSendIndex ] = 0;
+	pMds->TxOwner[pWb35Tx->TxSendIndex] = 0;
 	pWb35Tx->TxSendIndex++;
 	pWb35Tx->TxSendIndex %= MAX_USB_TX_BUFFER_NUMBER;
 
@@ -65,15 +65,14 @@ error:
 
 static void Wb35Tx(struct wbsoft_priv *adapter)
 {
-	struct hw_data *	pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 	u8		*pTxBufferAddress;
 	struct wb35_mds *pMds = &adapter->Mds;
-	struct urb *	pUrb = (struct urb *)pWb35Tx->Tx4Urb;
-	int         	retv;
+	struct urb *pUrb = (struct urb *)pWb35Tx->Tx4Urb;
+	int		retv;
 	u32		SendIndex;
 
-
 	if (pHwData->SurpriseRemove)
 		goto cleanup;
 
@@ -91,12 +90,12 @@ static void Wb35Tx(struct wbsoft_priv *a
 	/* Issuing URB */
 	usb_fill_bulk_urb(pUrb, pHwData->udev,
 			  usb_sndbulkpipe(pHwData->udev, 4),
-			  pTxBufferAddress, pMds->TxBufferSize[ SendIndex ],
+			  pTxBufferAddress, pMds->TxBufferSize[SendIndex],
 			  Wb35Tx_complete, adapter);
 
 	pWb35Tx->EP4vm_state = VM_RUNNING;
 	retv = usb_submit_urb(pUrb, GFP_ATOMIC);
-	if (retv<0) {
+	if (retv < 0) {
 		printk("EP4 Tx Irp sending error\n");
 		goto cleanup;
 	}
@@ -116,7 +115,7 @@ static void Wb35Tx(struct wbsoft_priv *a
 
 void Wb35Tx_start(struct wbsoft_priv *adapter)
 {
-	struct hw_data * pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
 	/* Allow only one thread to run into function */
@@ -127,7 +126,7 @@ void Wb35Tx_start(struct wbsoft_priv *ad
 		atomic_dec(&pWb35Tx->TxFireCounter);
 }
 
-unsigned char Wb35Tx_initial(struct hw_data * pHwData)
+unsigned char Wb35Tx_initial(struct hw_data *pHwData)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
@@ -138,52 +137,52 @@ unsigned char Wb35Tx_initial(struct hw_d
 	pWb35Tx->Tx2Urb = usb_alloc_urb(0, GFP_ATOMIC);
 	if (!pWb35Tx->Tx2Urb)
 	{
-		usb_free_urb( pWb35Tx->Tx4Urb );
+		usb_free_urb(pWb35Tx->Tx4Urb);
 		return false;
 	}
 
 	return true;
 }
 
-void Wb35Tx_stop(struct hw_data * pHwData)
+void Wb35Tx_stop(struct hw_data *pHwData)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
 	/* Try to cancel the Trp of EP2 */
 	if (pWb35Tx->EP2vm_state = VM_RUNNING)
 		/* Only use unlink, let Wb35Tx_destroy free them */
-		usb_unlink_urb( pWb35Tx->Tx2Urb );
+		usb_unlink_urb(pWb35Tx->Tx2Urb);
 	pr_debug("EP2 Tx stop\n");
 
 	/* Try to cancel the Irp of EP4 */
 	if (pWb35Tx->EP4vm_state = VM_RUNNING)
 		/* Only use unlink, let Wb35Tx_destroy free them */
-		usb_unlink_urb( pWb35Tx->Tx4Urb );
+		usb_unlink_urb(pWb35Tx->Tx4Urb);
 	pr_debug("EP4 Tx stop\n");
 }
 
-void Wb35Tx_destroy(struct hw_data * pHwData)
+void Wb35Tx_destroy(struct hw_data *pHwData)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
 	/* Wait for VM stop */
 	do {
 		msleep(10); /* Delay for waiting function enter 940623.1.a */
-	} while( (pWb35Tx->EP2vm_state != VM_STOP) && (pWb35Tx->EP4vm_state != VM_STOP) );
+	} while ((pWb35Tx->EP2vm_state != VM_STOP) && (pWb35Tx->EP4vm_state != VM_STOP));
 	msleep(10); /* Delay for waiting function enter 940623.1.b */
 
 	if (pWb35Tx->Tx4Urb)
-		usb_free_urb( pWb35Tx->Tx4Urb );
+		usb_free_urb(pWb35Tx->Tx4Urb);
 
 	if (pWb35Tx->Tx2Urb)
-		usb_free_urb( pWb35Tx->Tx2Urb );
+		usb_free_urb(pWb35Tx->Tx2Urb);
 
 	pr_debug("Wb35Tx_destroy OK\n");
 }
 
 void Wb35Tx_CurrentTime(struct wbsoft_priv *adapter, u32 TimeCount)
 {
-	struct hw_data * pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 	unsigned char Trigger = false;
 
@@ -200,17 +199,16 @@ void Wb35Tx_CurrentTime(struct wbsoft_pr
 
 static void Wb35Tx_EP2VM(struct wbsoft_priv *adapter);
 
-static void Wb35Tx_EP2VM_complete(struct urb * pUrb)
+static void Wb35Tx_EP2VM_complete(struct urb *pUrb)
 {
 	struct wbsoft_priv *adapter = pUrb->context;
-	struct hw_data *	pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct T02_descriptor	T02, TSTATUS;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
-	u32 *		pltmp = (u32 *)pWb35Tx->EP2_buf;
+	u32 *pltmp = (u32 *)pWb35Tx->EP2_buf;
 	u32		i;
 	u16		InterruptInLength;
 
-
 	/* Variable setting */
 	pWb35Tx->EP2vm_state = VM_COMPLETED;
 	pWb35Tx->EP2VM_status = pUrb->status;
@@ -225,7 +223,7 @@ static void Wb35Tx_EP2VM_complete(struct
 	/* The Urb is completed, check the result */
 	if (pWb35Tx->EP2VM_status != 0) {
 		printk("EP2 IoCompleteRoutine return error\n");
-		pWb35Tx->EP2vm_state= VM_STOP;
+		pWb35Tx->EP2vm_state = VM_STOP;
 		goto error;
 	}
 
@@ -239,7 +237,7 @@ static void Wb35Tx_EP2VM_complete(struct
 		T02.value |= ((cpu_to_le32(pltmp[i]) & 0xff) << 24);
 
 		TSTATUS.value = T02.value;  /* 20061009 anson's endian */
-		Mds_SendComplete( adapter, &TSTATUS );
+		Mds_SendComplete(adapter, &TSTATUS);
 		T02.value = cpu_to_le32(pltmp[i]) >> 8;
 	}
 
@@ -251,10 +249,10 @@ error:
 
 static void Wb35Tx_EP2VM(struct wbsoft_priv *adapter)
 {
-	struct hw_data *	pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
-	struct urb *	pUrb = (struct urb *)pWb35Tx->Tx2Urb;
-	u32 *	pltmp = (u32 *)pWb35Tx->EP2_buf;
+	struct urb *pUrb = (struct urb *)pWb35Tx->Tx2Urb;
+	u32 *pltmp = (u32 *)pWb35Tx->EP2_buf;
 	int		retv;
 
 	if (pHwData->SurpriseRemove)
@@ -264,7 +262,7 @@ static void Wb35Tx_EP2VM(struct wbsoft_p
 		goto error;
 
 	/* Issuing URB */
-	usb_fill_int_urb( pUrb, pHwData->udev, usb_rcvintpipe(pHwData->udev,2),
+	usb_fill_int_urb(pUrb, pHwData->udev, usb_rcvintpipe(pHwData->udev, 2),
 			  pltmp, MAX_INTERRUPT_LENGTH, Wb35Tx_EP2VM_complete, adapter, 32);
 
 	pWb35Tx->EP2vm_state = VM_RUNNING;
@@ -283,7 +281,7 @@ error:
 
 void Wb35Tx_EP2VM_start(struct wbsoft_priv *adapter)
 {
-	struct hw_data * pHwData = &adapter->sHwData;
+	struct hw_data *pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
 	/* Allow only one thread to run into function */
