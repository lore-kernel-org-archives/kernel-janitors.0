From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 May 2013 06:56:00 +0000
Subject: [patch 1/2] Staging: rtl8192e: delete some dead cruft
Message-Id: <20130529065600.GA25133@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I have removed some unneeded comments, some blank lines and some
unused macros.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index ea91744..5f10e40 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -20,20 +20,7 @@
 #include "rtl_core.h"
 #include "r8192E_hw.h"
 #include "r8192E_cmdpkt.h"
-/*---------------------------Define Local Constant---------------------------*/
-/* Debug constant*/
-#define		CMPK_DEBOUNCE_CNT			1
-#define		CMPK_PRINT(Address)\
-{\
-	unsigned char	i;\
-	u32	temp[10];\
-	\
-	memcpy(temp, Address, 40);\
-	for (i = 0; i < 40; i += 4)\
-		printk(KERN_INFO "\r\n %08x", temp[i]);\
-}
 
-/*---------------------------Define functions---------------------------------*/
 bool cmpk_message_handle_tx(
 	struct net_device *dev,
 	u8	*code_virtual_address,
@@ -100,7 +87,7 @@ bool cmpk_message_handle_tx(
 	write_nic_byte(dev, TPPoll, TPPoll_CQ);
 Failed:
 	return rt_status;
-}	/* CMPK_Message_Handle_Tx */
+}
 
 static	void
 cmpk_count_txstatistic(
@@ -149,23 +136,19 @@ cmpk_count_txstatistic(
 
 	priv->stats.txretrycount += pstx_fb->retry_cnt;
 	priv->stats.txfeedbackretry += pstx_fb->retry_cnt;
-
-}	/* cmpk_CountTxStatistic */
-
-
+}
 
 static void cmpk_handle_tx_feedback(struct net_device *dev, u8 *pmsg)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	struct cmpk_txfb rx_tx_fb;	/* */
+	struct cmpk_txfb rx_tx_fb;
 
 	priv->stats.txfeedback++;
 
 
 	memcpy((u8 *)&rx_tx_fb, pmsg, sizeof(struct cmpk_txfb));
 	cmpk_count_txstatistic(dev, &rx_tx_fb);
-
-}	/* cmpk_Handle_Tx_Feedback */
+}
 
 static void cmdpkt_beacontimerinterrupt_819xusb(struct net_device *dev)
 {
@@ -182,7 +165,6 @@ static void cmdpkt_beacontimerinterrupt_819xusb(struct net_device *dev)
 		tx_rate = 10;
 		DMESG("send beacon frame  tx rate is 1Mbpm\n");
 	}
-
 }
 
 static void cmpk_handle_interrupt_status(struct net_device *dev, u8 *pmsg)
@@ -192,14 +174,12 @@ static void cmpk_handle_interrupt_status(struct net_device *dev, u8 *pmsg)
 
 	DMESG("---> cmpk_Handle_Interrupt_Status()\n");
 
-
 	rx_intr_status.length = pmsg[1];
 	if (rx_intr_status.length != (sizeof(struct cmpk_intr_sta) - 2)) {
 		DMESG("cmpk_Handle_Interrupt_Status: wrong length!\n");
 		return;
 	}
 
-
 	if (priv->rtllib->iw_mode = IW_MODE_ADHOC) {
 		rx_intr_status.interrupt_status = *((u32 *)(pmsg + 4));
 
@@ -220,12 +200,11 @@ static void cmpk_handle_interrupt_status(struct net_device *dev, u8 *pmsg)
 
 	DMESG("<---- cmpk_handle_interrupt_status()\n");
 
-}	/* cmpk_handle_interrupt_status */
-
+}
 
 static	void cmpk_handle_query_config_rx(struct net_device *dev, u8 *pmsg)
 {
-	cmpk_query_cfg_t	rx_query_cfg;	/* */
+	cmpk_query_cfg_t	rx_query_cfg;
 
 
 	rx_query_cfg.cfg_action = (pmsg[4] & 0x80000000)>>31;
@@ -238,8 +217,7 @@ static	void cmpk_handle_query_config_rx(struct net_device *dev, u8 *pmsg)
 	rx_query_cfg.mask = (pmsg[12] << 24) | (pmsg[13] << 16) |
 			    (pmsg[14] << 8) | (pmsg[15] << 0);
 
-}	/* cmpk_Handle_Query_Config_Rx */
-
+}
 
 static void cmpk_count_tx_status(struct net_device *dev,
 				 struct cmpk_tx_status *pstx_status)
@@ -280,13 +258,11 @@ static void cmpk_count_tx_status(struct net_device *dev,
 	priv->stats.txbytesunicast		+= pstx_status->txuclength;
 
 	priv->stats.last_packet_rate		= pstx_status->rate;
-}	/* cmpk_CountTxStatus */
-
-
+}
 
 static	void cmpk_handle_tx_status(struct net_device *dev, u8 *pmsg)
 {
-	struct cmpk_tx_status rx_tx_sts;	/* */
+	struct cmpk_tx_status rx_tx_sts;
 
 	memcpy((void *)&rx_tx_sts, (void *)pmsg, sizeof(struct cmpk_tx_status));
 	cmpk_count_tx_status(dev, &rx_tx_sts);
@@ -300,7 +276,6 @@ static	void cmpk_handle_tx_rate_history(struct net_device *dev, u8 *pmsg)
 	u32 *ptemp;
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-
 #ifdef ENABLE_PS
 	pAdapter->HalFunc.GetHwRegHandler(pAdapter, HW_VAR_RF_STATE,
 					 (pu1Byte)(&rtState));
@@ -335,10 +310,8 @@ static	void cmpk_handle_tx_rate_history(struct net_device *dev, u8 *pmsg)
 			priv->stats.txrate.ht_mcs[j][i] + 							 ptxrate->ht_mcs[j][i];
 	}
-
 }
 
-
 u32 cmpk_message_handle_rx(struct net_device *dev,
 			   struct rtllib_rx_stats *pstats)
 {
@@ -349,12 +322,8 @@ u32 cmpk_message_handle_rx(struct net_device *dev,
 
 	RT_TRACE(COMP_CMDPKT, "---->cmpk_message_handle_rx()\n");
 
-	if (pstats = NULL) {
-		/* Print error message. */
-		/*RT_TRACE(COMP_SEND, DebugLevel,
-				("\n\r[CMPK]-->Err queue id or pointer"));*/
+	if (pstats = NULL)
 		return 0;
-	}
 
 	total_length = pstats->Length;
 
