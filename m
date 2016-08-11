From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 05:42:17 +0000
Subject: [PATCH v2 06/10] staging: ks7010: Delete unnecessary braces
Message-Id: <bc389dc0-e137-4f7d-9d70-6f3996007684@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
In-Reply-To: <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Joe Perches <joe@perches.com>, Jean Delvare <jdelvare@suse.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Aug 2016 19:57:01 +0200

Do not use curly brackets at some source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
v2: Rebased on the source files from Linux next-20160809.

    Touched less source code places.

 drivers/staging/ks7010/ks7010_sdio.c | 46 +++++++++++++-----------------------
 1 file changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 0f7ea76..2094a07 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -383,10 +383,9 @@ int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 	result = enqueue_txdev(priv, p, size, complete_handler, arg1, arg2);
 	spin_unlock(&priv->tx_dev.tx_dev_lock);
 
-	if (cnt_txqbody(priv) > 0) {
+	if (cnt_txqbody(priv) > 0)
 		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
 				   &priv->ks_wlan_hw.rw_wq, 0);
-	}
 	return result;
 }
 
@@ -402,9 +401,8 @@ static void rx_event_task(unsigned long dev)
 		hostif_receive(priv, rp->data, rp->size);
 		inc_rxqhead(priv);
 
-		if (cnt_rxqbody(priv) > 0) {
+		if (cnt_rxqbody(priv) > 0)
 			tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
-		}
 	}
 
 	return;
@@ -432,9 +430,8 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 	retval  	    ks7010_sdio_read(priv, DATA_WINDOW, &rx_buffer->data[0],
 			     hif_align_size(size));
-	if (retval) {
+	if (retval)
 		goto error_out;
-	}
 
 	/* length check */
 	if (size > 2046 || size = 0) {
@@ -449,9 +446,8 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 		retval  		    ks7010_sdio_write(priv, READ_STATUS, &read_status,
 				      sizeof(read_status));
-		if (retval) {
+		if (retval)
 			DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
-		}
 		goto error_out;
 	}
 
@@ -470,12 +466,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 	}
 	DPRINTK(4, "READ_STATUS=%02X\n", read_status);
 
-	if (atomic_read(&priv->psstatus.confirm_wait)) {
+	if (atomic_read(&priv->psstatus.confirm_wait))
 		if (IS_HIF_CONF(event)) {
 			DPRINTK(4, "IS_HIF_CONF true !!\n");
 			atomic_dec(&priv->psstatus.confirm_wait);
 		}
-	}
 
 	/* rx_event_task((void *)priv); */
 	tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
@@ -544,13 +539,11 @@ static void ks7010_rw_function(struct work_struct *work)
 	}
 	DPRINTK(4, "WSTATUS_RSIZE=%02X\n", rw_data);
 
-	if (rw_data & RSIZE_MASK) {	/* Read schedule */
+	if (rw_data & RSIZE_MASK)	/* Read schedule */
 		ks_wlan_hw_rx((void *)priv,
 			      (uint16_t) (((rw_data & RSIZE_MASK) << 4)));
-	}
-	if ((rw_data & WSTATUS_MASK)) {
+	if (rw_data & WSTATUS_MASK)
 		tx_device_task((void *)priv);
-	}
 	_ks_wlan_hw_power_save(priv);
  release_host:
 	sdio_release_host(priv->ks_wlan_hw.sdio_card->func);
@@ -618,10 +611,9 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 			}
 			DPRINTK(4, "WSTATUS_RSIZE=%02X\n", rw_data);
 			rsize = rw_data & RSIZE_MASK;
-			if (rsize) {	/* Read schedule */
+			if (rsize)	/* Read schedule */
 				ks_wlan_hw_rx((void *)priv,
 					      (uint16_t) (((rsize) << 4)));
-			}
 			if (rw_data & WSTATUS_MASK) {
 #if 0
 				if (status & INT_WRITE_STATUS
@@ -632,11 +624,10 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 					    ks7010_sdio_write(priv, DATA_WINDOW,
 							      &rw_data,
 							      sizeof(rw_data));
-					if (retval) {
+					if (retval)
 						DPRINTK(1,
 							"write DATA_WINDOW Failed!!(%d)\n",
 							retval);
-					}
 					status &= ~INT_WRITE_STATUS;
 				} else {
 #endif
@@ -877,13 +868,11 @@ static void ks7010_card_init(struct ks_wlan_private *priv)
 	DPRINTK(5, "hostif_sme_enqueu()\n");
 
 	if (!wait_for_completion_interruptible_timeout
-	    (&priv->confirm_wait, 5 * HZ)) {
+	    (&priv->confirm_wait, 5 * HZ))
 		DPRINTK(1, "wait time out!! SME_START\n");
-	}
 
-	if (priv->mac_address_valid && priv->version_size) {
+	if (priv->mac_address_valid && priv->version_size)
 		priv->dev_state = DEVICE_STATE_PREINIT;
-	}
 
 	hostif_sme_enqueue(priv, SME_GET_EEPROM_CKSUM);
 
@@ -905,9 +894,8 @@ static void ks7010_card_init(struct ks_wlan_private *priv)
 	hostif_sme_enqueue(priv, SME_START_REQUEST);
 
 	if (!wait_for_completion_interruptible_timeout
-	    (&priv->confirm_wait, 5 * HZ)) {
+	    (&priv->confirm_wait, 5 * HZ))
 		DPRINTK(1, "wait time out!! wireless parameter set\n");
-	}
 
 	if (priv->dev_state >= DEVICE_STATE_PREINIT) {
 		DPRINTK(1, "DEVICE READY!!\n");
@@ -1026,9 +1014,9 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	init_completion(&priv->ks_wlan_hw.ks7010_sdio_wait);
 	priv->ks_wlan_hw.read_buf = NULL;
 	priv->ks_wlan_hw.read_buf = kmalloc(RX_DATA_SIZE, GFP_KERNEL);
-	if (!priv->ks_wlan_hw.read_buf) {
+	if (!priv->ks_wlan_hw.read_buf)
 		goto free_dev;
-	}
+
 	priv->dev_state = DEVICE_STATE_PREBOOT;
 	priv->net_dev = netdev;
 	priv->firmware_version[0] = '\0';
@@ -1064,9 +1052,8 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	sdio_claim_host(func);
 	ret = ks7010_sdio_write(priv, INT_PENDING, &rw_data, sizeof(rw_data));
 	sdio_release_host(func);
-	if (ret) {
+	if (ret)
 		DPRINTK(1, " error : INT_PENDING=%02X\n", rw_data);
-	}
 	DPRINTK(4, " clear Interrupt : INT_PENDING=%02X\n", rw_data);
 
 	/* enable ks7010sdio interrupt (INT_GCR_B|INT_READ_STATUS|INT_WRITE_STATUS) */
@@ -1074,9 +1061,8 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	sdio_claim_host(func);
 	ret = ks7010_sdio_write(priv, INT_ENABLE, &rw_data, sizeof(rw_data));
 	sdio_release_host(func);
-	if (ret) {
+	if (ret)
 		DPRINTK(1, " error : INT_ENABLE=%02X\n", rw_data);
-	}
 	DPRINTK(4, " enable Interrupt : INT_ENABLE=%02X\n", rw_data);
 	priv->dev_state = DEVICE_STATE_BOOT;
 
-- 
2.9.2

