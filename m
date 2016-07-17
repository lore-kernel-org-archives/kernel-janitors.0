From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:24:40 +0000
Subject: [PATCH 6/9] staging: ks7010: Delete unnecessary braces
Message-Id: <8b446c29-e32d-b2f8-1fb0-ae79888ca135@users.sourceforge.net>
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
In-Reply-To: <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:39:03 +0200

Do not use curly brackets at some source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 48 ++++++++++++------------------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index b3ca8e2..1e072e3 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -109,9 +109,8 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
 		DPRINTK(3, "sleep_mode=SLP_SLEEP\n");
 		atomic_set(&priv->sleepstatus.status, 1);
 		priv->last_doze = jiffies;
-	} else {
+	} else
 		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
-	}
 
 out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
@@ -140,9 +139,8 @@ void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
 		atomic_set(&priv->sleepstatus.status, 0);
 		priv->last_wakeup = jiffies;
 		++priv->wakeup_count;
-	} else {
+	} else
 		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
-	}
 
 out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
@@ -164,10 +162,9 @@ void ks_wlan_hw_wakeup_request(struct ks_wlan_private *priv)
 		DPRINTK(4, "wake up : WAKEUP=%02X\n", rw_data);
 		priv->last_wakeup = jiffies;
 		++priv->wakeup_count;
-	} else {
+	} else
 		DPRINTK(1, "psstatus=%d\n",
 			atomic_read(&priv->psstatus.status));
-	}
 }
 
 int _ks_wlan_hw_power_save(struct ks_wlan_private *priv)
@@ -380,10 +377,9 @@ int ks_wlan_hw_tx(struct ks_wlan_private *priv, void *p, unsigned long size,
 	result = enqueue_txdev(priv, p, size, complete_handler, arg1, arg2);
 	spin_unlock(&priv->tx_dev.tx_dev_lock);
 
-	if (cnt_txqbody(priv) > 0) {
+	if (cnt_txqbody(priv) > 0)
 		queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
 				   &priv->ks_wlan_hw.rw_wq, 0);
-	}
 	return result;
 }
 
@@ -399,9 +395,8 @@ static void rx_event_task(unsigned long dev)
 		hostif_receive(priv, rp->data, rp->size);
 		inc_rxqhead(priv);
 
-		if (cnt_rxqbody(priv) > 0) {
+		if (cnt_rxqbody(priv) > 0)
 			tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
-		}
 	}
 
 	return;
@@ -463,12 +458,11 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 		DPRINTK(1, " error : READ_STATUS=%02X\n", read_status);
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
@@ -537,13 +531,11 @@ static void ks7010_rw_function(struct work_struct *work)
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
@@ -611,10 +603,9 @@ static void ks_sdio_interrupt(struct sdio_func *func)
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
@@ -625,11 +616,10 @@ static void ks_sdio_interrupt(struct sdio_func *func)
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
@@ -870,13 +860,11 @@ static void ks7010_card_init(struct ks_wlan_private *priv)
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
 
@@ -898,16 +886,14 @@ static void ks7010_card_init(struct ks_wlan_private *priv)
 	hostif_sme_enqueue(priv, SME_START_REQUEST);
 
 	if (!wait_for_completion_interruptible_timeout
-	    (&priv->confirm_wait, 5 * HZ)) {
+	    (&priv->confirm_wait, 5 * HZ))
 		DPRINTK(1, "wait time out!! wireless parameter set\n");
-	}
 
 	if (priv->dev_state >= DEVICE_STATE_PREINIT) {
 		DPRINTK(1, "DEVICE READY!!\n");
 		priv->dev_state = DEVICE_STATE_READY;
-	} else {
+	} else
 		DPRINTK(1, "dev_state=%d\n", priv->dev_state);
-	}
 }
 
 static void ks7010_init_defaults(struct ks_wlan_private *priv)
@@ -1057,9 +1043,8 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	sdio_claim_host(func);
 	ret = ks7010_sdio_write(priv, INT_PENDING, &rw_data, sizeof(rw_data));
 	sdio_release_host(func);
-	if (ret) {
+	if (ret)
 		DPRINTK(1, " error : INT_PENDING=%02X\n", rw_data);
-	}
 	DPRINTK(4, " clear Interrupt : INT_PENDING=%02X\n", rw_data);
 
 	/* enable ks7010sdio interrupt (INT_GCR_B|INT_READ_STATUS|INT_WRITE_STATUS) */
@@ -1067,9 +1052,8 @@ static int ks7010_sdio_probe(struct sdio_func *func,
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
2.9.1

