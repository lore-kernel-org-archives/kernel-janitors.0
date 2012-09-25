From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Tue, 25 Sep 2012 20:26:48 +0000
Subject: [Patch] Driver: Staging: checkpatch cleanup for drivers/staging/winbond/wb35tx_s.h
Message-Id: <506210B8.7000604@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

checkpatch cleanup for drivers/staging/winbond/wb35tx_s.h

1) Changed c99 comments to c89 comments
2) Removed undesired spaces which were causing checkpatch errors.

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

diff -uprN a/drivers/staging/winbond/wb35tx_s.h b/drivers/staging/winbond/wb35tx_s.h
--- a/drivers/staging/winbond/wb35tx_s.h
+++ b/drivers/staging/winbond/wb35tx_s.h
@@ -3,45 +3,45 @@
 
 #include "mds_s.h"
 
-//==================
-// IS89C35 Tx related definition
-//==================
-#define TX_INTERFACE			0	// Interface 1
-#define TX_PIPE					3	// endpoint 4
-#define TX_INTERRUPT			1	// endpoint 2
-#define MAX_INTERRUPT_LENGTH	64	// It must be 64 for EP2 hardware
+/**********************************
+* IS89C35 Tx related definition
+***********************************/
+#define TX_INTERFACE		0	/* Interface 1 */
+#define TX_PIPE			3	/* Endpoint 4 */
+#define TX_INTERRUPT		1	/* Endpoint 2 */
+#define MAX_INTERRUPT_LENGTH	64	/* It must be 64 for EP2 hardware */
 
 
 
-//==================
-// Internal variable for module
-//==================
+/**********************************
+* Internal variable for module
+***********************************/
 
 
 struct wb35_tx {
-	// For Tx buffer
-	u8	TxBuffer[ MAX_USB_TX_BUFFER_NUMBER ][ MAX_USB_TX_BUFFER ];
+	/* For Tx buffer */
+	u8	TxBuffer[MAX_USB_TX_BUFFER_NUMBER][MAX_USB_TX_BUFFER];
 
-	// For Interrupt pipe
+	/* For Interrupt pipe */
 	u8	EP2_buf[MAX_INTERRUPT_LENGTH];
 
-	atomic_t	TxResultCount;// For thread control of EP2 931130.4.m
-	atomic_t	TxFireCounter;// For thread control of EP4 931130.4.n
-	u32			ByteTransfer;
-
-	u32	    TxSendIndex;// The next index of Mds array to be sent
-	u32	    EP2vm_state; // for EP2vm state
-	u32	    EP4vm_state; // for EP4vm state
-	u32	    tx_halt; // Stopping VM
+	atomic_t	TxResultCount;/* For thread control of EP2 931130.4.m */
+	atomic_t	TxFireCounter;/* For thread control of EP4 931130.4.n */
+	u32		ByteTransfer;
+
+	u32		TxSendIndex;/* The next index of Mds array to be sent */
+	u32		EP2vm_state; /* for EP2vm state */
+	u32		EP4vm_state; /* for EP4vm state */
+	u32		tx_halt; /* Stopping VM */
 
-	struct urb *				Tx4Urb;
-	struct urb *				Tx2Urb;
+	struct urb	*Tx4Urb;
+	struct urb	*Tx2Urb;
 
 	int		EP2VM_status;
 	int		EP4VM_status;
 
-	u32	TxFillCount; // 20060928
-	u32	TxTimer; // 20060928 Add if sending packet not great than 13
+	u32	TxFillCount; /* 20060928 */
+	u32	TxTimer; /* 20060928 Add if sending packet not great than 13 */
 };
 
 #endif

