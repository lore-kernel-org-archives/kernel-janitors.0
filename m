From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 17:55:13 +0000
Subject: [Patch 1/5] Staging: winbond: Changed c99 comments to c89 comments
Message-Id: <50634165.3010701@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

checkpatch cleanup: Changed c99 comments to c89 comments

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35tx.c |   89 +++++++++++++++++++++++++++++++--------------------------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff -uprN a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
--- a/drivers/staging/winbond/wb35tx.c
+++ b/drivers/staging/winbond/wb35tx.c
@@ -1,13 +1,13 @@
-//======================================
-//  Copyright (c) 1996-2002 Winbond Electronic Corporation
-//
-//  Module Name:
-//    Wb35Tx.c
-//
-//  Abstract:
-//    Processing the Tx message and put into down layer
-//
-//======================================
+/*
+ *  Copyright (c) 1996-2002 Winbond Electronic Corporation
+ *
+ *  Module Name:
+ *    Wb35Tx.c
+ *
+ *  Abstract:
+ *    Processing the Tx message and put into down layer
+ *
+ */
 #include <linux/usb.h>
 #include <linux/gfp.h>
 
@@ -33,20 +33,21 @@ static void Wb35Tx_complete(struct urb *
 	struct wb35_mds *pMds = &adapter->Mds;
 
 	printk("wb35: tx complete\n");
-	// Variable setting
+	/* Variable setting */
 	pWb35Tx->EP4vm_state = VM_COMPLETED;
-	pWb35Tx->EP4VM_status = pUrb->status; //Store the last result of Irp
-	pMds->TxOwner[ pWb35Tx->TxSendIndex ] = 0;// Set the owner. Free the owner bit always.
+	pWb35Tx->EP4VM_status = pUrb->status; /* Store the last result of Irp */
+	/* Set the owner. Free the owner bit always. */
+	pMds->TxOwner[ pWb35Tx->TxSendIndex ] = 0;
 	pWb35Tx->TxSendIndex++;
 	pWb35Tx->TxSendIndex %= MAX_USB_TX_BUFFER_NUMBER;
 
-	if (pHwData->SurpriseRemove) // Let WbWlanHalt to handle surprise remove
+	if (pHwData->SurpriseRemove) /* Let WbWlanHalt to handle surprise remove */
 		goto error;
 
 	if (pWb35Tx->tx_halt)
 		goto error;
 
-	// The URB is completed, check the result
+	/* The URB is completed, check the result */
 	if (pWb35Tx->EP4VM_status != 0) {
 		printk("URB submission failed\n");
 		pWb35Tx->EP4vm_state = VM_STOP;
@@ -79,15 +80,15 @@ static void Wb35Tx(struct wbsoft_priv *a
 	if (pWb35Tx->tx_halt)
 		goto cleanup;
 
-	// Ownership checking
+	/* Ownership checking */
 	SendIndex = pWb35Tx->TxSendIndex;
-	if (!pMds->TxOwner[SendIndex]) //No more data need to be sent, return immediately
+	/* No more data need to be sent, return immediately */
+	if (!pMds->TxOwner[SendIndex])
 		goto cleanup;
 
 	pTxBufferAddress = pWb35Tx->TxBuffer[SendIndex];
-	//
-	// Issuing URB
-	//
+
+	/* Issuing URB */
 	usb_fill_bulk_urb(pUrb, pHwData->udev,
 			  usb_sndbulkpipe(pHwData->udev, 4),
 			  pTxBufferAddress, pMds->TxBufferSize[ SendIndex ],
@@ -100,7 +101,7 @@ static void Wb35Tx(struct wbsoft_priv *a
 		goto cleanup;
 	}
 
-	// Check if driver needs issue Irp for EP2
+	/* Check if driver needs issue Irp for EP2 */
 	pWb35Tx->TxFillCount += pMds->TxCountInBuffer[SendIndex];
 	if (pWb35Tx->TxFillCount > 12)
 		Wb35Tx_EP2VM_start(adapter);
@@ -118,7 +119,7 @@ void Wb35Tx_start(struct wbsoft_priv *ad
 	struct hw_data * pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
-	// Allow only one thread to run into function
+	/* Allow only one thread to run into function */
 	if (atomic_inc_return(&pWb35Tx->TxFireCounter) = 1) {
 		pWb35Tx->EP4vm_state = VM_RUNNING;
 		Wb35Tx(adapter);
@@ -144,32 +145,32 @@ unsigned char Wb35Tx_initial(struct hw_d
 	return true;
 }
 
-//===========================
 void Wb35Tx_stop(struct hw_data * pHwData)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
-	// Try to cancel the Trp of EP2
+	/* Try to cancel the Trp of EP2 */
 	if (pWb35Tx->EP2vm_state = VM_RUNNING)
-		usb_unlink_urb( pWb35Tx->Tx2Urb ); // Only use unlink, let Wb35Tx_destroy to free them
+		/* Only use unlink, let Wb35Tx_destroy to free them */
+		usb_unlink_urb( pWb35Tx->Tx2Urb );
 	pr_debug("EP2 Tx stop\n");
 
-	// Try to cancel the Irp of EP4
+	/* Try to cancel the Irp of EP4 */
 	if (pWb35Tx->EP4vm_state = VM_RUNNING)
-		usb_unlink_urb( pWb35Tx->Tx4Urb ); // Only use unlink, let Wb35Tx_destroy to free them
+		/* Only use unlink, let Wb35Tx_destroy to free them */
+		usb_unlink_urb( pWb35Tx->Tx4Urb );
 	pr_debug("EP4 Tx stop\n");
 }
 
-//===========================
 void Wb35Tx_destroy(struct hw_data * pHwData)
 {
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
-	// Wait for VM stop
+	/* Wait for VM stop */
 	do {
-		msleep(10);  // Delay for waiting function enter 940623.1.a
+		msleep(10); /* Delay for waiting function enter 940623.1.a */
 	} while( (pWb35Tx->EP2vm_state != VM_STOP) && (pWb35Tx->EP4vm_state != VM_STOP) );
-	msleep(10);  // Delay for waiting function enter 940623.1.b
+	msleep(10); /* Delay for waiting function enter 940623.1.b */
 
 	if (pWb35Tx->Tx4Urb)
 		usb_free_urb( pWb35Tx->Tx4Urb );
@@ -210,34 +211,34 @@ static void Wb35Tx_EP2VM_complete(struct
 	u16		InterruptInLength;
 
 
-	// Variable setting
+	/* Variable setting */
 	pWb35Tx->EP2vm_state = VM_COMPLETED;
 	pWb35Tx->EP2VM_status = pUrb->status;
 
-	// For Linux 2.4. Interrupt will always trigger
-	if (pHwData->SurpriseRemove) // Let WbWlanHalt to handle surprise remove
+	/* For Linux 2.4. Interrupt will always trigger */
+	if (pHwData->SurpriseRemove) /* Let WbWlanHalt to handle surprise remove */
 		goto error;
 
 	if (pWb35Tx->tx_halt)
 		goto error;
 
-	//The Urb is completed, check the result
+	/* The Urb is completed, check the result */
 	if (pWb35Tx->EP2VM_status != 0) {
 		printk("EP2 IoCompleteRoutine return error\n");
 		pWb35Tx->EP2vm_state= VM_STOP;
 		goto error;
 	}
 
-	// Update the Tx result
+	/* Update the Tx result */
 	InterruptInLength = pUrb->actual_length;
-	// Modify for minimum memory access and DWORD alignment.
-	T02.value = cpu_to_le32(pltmp[0]) >> 8; // [31:8] -> [24:0]
-	InterruptInLength -= 1;// 20051221.1.c Modify the follow for more stable
-	InterruptInLength >>= 2; // InterruptInLength/4
+	/* Modify for minimum memory access and DWORD alignment. */
+	T02.value = cpu_to_le32(pltmp[0]) >> 8; /* [31:8] -> [24:0] */
+	InterruptInLength -= 1; /* 20051221.1.c Modify the follow for more stable */
+	InterruptInLength >>= 2; /* InterruptInLength/4 */
 	for (i = 1; i <= InterruptInLength; i++) {
 		T02.value |= ((cpu_to_le32(pltmp[i]) & 0xff) << 24);
 
-		TSTATUS.value = T02.value;  //20061009 anson's endian
+		TSTATUS.value = T02.value;  /* 20061009 anson's endian */
 		Mds_SendComplete( adapter, &TSTATUS );
 		T02.value = cpu_to_le32(pltmp[i]) >> 8;
 	}
@@ -262,9 +263,7 @@ static void Wb35Tx_EP2VM(struct wbsoft_p
 	if (pWb35Tx->tx_halt)
 		goto error;
 
-	//
-	// Issuing URB
-	//
+	/* Issuing URB */
 	usb_fill_int_urb( pUrb, pHwData->udev, usb_rcvintpipe(pHwData->udev,2),
 			  pltmp, MAX_INTERRUPT_LENGTH, Wb35Tx_EP2VM_complete, adapter, 32);
 
@@ -287,7 +286,7 @@ void Wb35Tx_EP2VM_start(struct wbsoft_pr
 	struct hw_data * pHwData = &adapter->sHwData;
 	struct wb35_tx *pWb35Tx = &pHwData->Wb35Tx;
 
-	// Allow only one thread to run into function
+	/* Allow only one thread to run into function */
 	if (atomic_inc_return(&pWb35Tx->TxResultCount) = 1) {
 		pWb35Tx->EP2vm_state = VM_RUNNING;
 		Wb35Tx_EP2VM(adapter);Changed c99 comments to c89 comments

