From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Jul 2016 18:20:12 +0000
Subject: [PATCH 4/9] staging: ks7010: Rename jump labels
Message-Id: <5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
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
Date: Sun, 17 Jul 2016 16:26:18 +0200

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/ks7010/ks7010_sdio.c | 81 +++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index 9b954cb..eea18fb 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -113,7 +113,7 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
 		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
 	}
 
- out:
+out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
 	return;
 }
@@ -144,7 +144,7 @@ void ks_wlan_hw_sleep_wakeup_request(struct ks_wlan_private *priv)
 		DPRINTK(1, "sleep_mode=%d\n", priv->sleep_mode);
 	}
 
- out:
+out:
 	priv->sleep_mode = atomic_read(&priv->sleepstatus.status);
 	return;
 }
@@ -480,7 +480,7 @@ static void ks_wlan_hw_rx(void *dev, uint16_t size)
 	/* rx_event_task((void *)priv); */
 	tasklet_schedule(&priv->ks_wlan_hw.rx_bh_task);
 
- error_out:
+error_out:
 	return;
 }
 
@@ -523,18 +523,18 @@ static void ks7010_rw_function(struct work_struct *work)
 			queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
 					   &priv->ks_wlan_hw.rw_wq, 1);
 		}
-		goto err_out;
+		goto release_host;
 	}
 
 	/* sleep mode doze */
 	if (atomic_read(&priv->sleepstatus.doze_request) = 1) {
 		ks_wlan_hw_sleep_doze_request(priv);
-		goto err_out;
+		goto release_host;
 	}
 	/* sleep mode wakeup */
 	if (atomic_read(&priv->sleepstatus.wakeup_request) = 1) {
 		ks_wlan_hw_sleep_wakeup_request(priv);
-		goto err_out;
+		goto release_host;
 	}
 
 	/* read (WriteStatus/ReadDataSize FN1:00_0014) */
@@ -543,7 +543,7 @@ static void ks7010_rw_function(struct work_struct *work)
 	if (retval) {
 		DPRINTK(1, " error : WSTATUS_RSIZE=%02X psstatus=%d\n", rw_data,
 			atomic_read(&priv->psstatus.status));
-		goto err_out;
+		goto release_host;
 	}
 	DPRINTK(4, "WSTATUS_RSIZE=%02X\n", rw_data);
 
@@ -555,8 +555,7 @@ static void ks7010_rw_function(struct work_struct *work)
 		tx_device_task((void *)priv);
 	}
 	_ks_wlan_hw_power_save(priv);
-
- err_out:
+release_host:
 	sdio_release_host(priv->ks_wlan_hw.sdio_card->func);
 
 	return;
@@ -664,7 +663,7 @@ static void ks_sdio_interrupt(struct sdio_func *func)
 		} while (rsize);
 	}
 
- intr_out:
+intr_out:
 	queue_delayed_work(priv->ks_wlan_hw.ks7010sdio_wq,
 			   &priv->ks_wlan_hw.rw_wq, 0);
 	return;
@@ -720,15 +719,13 @@ static int ks7010_sdio_update_index(struct ks_wlan_private *priv, u32 index)
 	retval = ks7010_sdio_write(priv, WRITE_INDEX, data_buf, sizeof(index));
 	if (retval) {
 		rc = 2;
-		goto error_out;
+		goto free_buf;
 	}
 
 	retval = ks7010_sdio_write(priv, READ_INDEX, data_buf, sizeof(index));
-	if (retval) {
+	if (retval)
 		rc = 3;
-		goto error_out;
-	}
- error_out:
+free_buf:
 	kfree(data_buf);
 	return rc;
 }
@@ -748,16 +745,15 @@ static int ks7010_sdio_data_compare(struct ks_wlan_private *priv, u32 address,
 	retval = ks7010_sdio_read(priv, address, read_buf, size);
 	if (retval) {
 		rc = 2;
-		goto error_out;
+		goto free_buf;
 	}
 	retval = memcmp(data, read_buf, size);
 
 	if (retval) {
 		DPRINTK(0, "data compare error (%d) \n", retval);
 		rc = 3;
-		goto error_out;
 	}
- error_out:
+free_buf:
 	kfree(read_buf);
 	return rc;
 }
@@ -784,7 +780,7 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 	if (rw_data = GCR_A_RUN) {
 		DPRINTK(0, "MAC firmware running ...\n");
 		rc = 0;
-		goto error_out0;
+		goto release_host;
 	}
 
 	retval = request_firmware(&fw_entry, ROM_FILE, &priv->ks_wlan_hw.sdio_card->func->dev);
@@ -814,14 +810,14 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 					     KS7010_IRAM_ADDRESS + offset);
 		if (retval) {
 			rc = 6;
-			goto error_out1;
+			goto release_fw;
 		}
 
 		/* Write data */
 		retval = ks7010_sdio_write(priv, DATA_WINDOW, rom_buf, size);
 		if (retval) {
 			rc = 8;
-			goto error_out1;
+			goto release_fw;
 		}
 
 		/* compare */
@@ -829,7 +825,7 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 		    ks7010_sdio_data_compare(priv, DATA_WINDOW, rom_buf, size);
 		if (retval) {
 			rc = 9;
-			goto error_out1;
+			goto release_fw;
 		}
 		n += size;
 
@@ -840,7 +836,7 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 	retval = ks7010_sdio_write(priv, GCR_A, &rw_data, sizeof(rw_data));
 	if (retval) {
 		rc = 11;
-		goto error_out1;
+		goto release_fw;
 	}
 	DPRINTK(4, " REMAP Request : GCR_A=%02X\n", rw_data);
 
@@ -851,7 +847,7 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 		    ks7010_sdio_read(priv, GCR_A, &rw_data, sizeof(rw_data));
 		if (retval) {
 			rc = 11;
-			goto error_out1;
+			goto release_fw;
 		}
 		if (rw_data = GCR_A_RUN)
 			break;
@@ -860,14 +856,13 @@ static int ks7010_upload_firmware(struct ks_wlan_private *priv,
 	if ((50) <= n) {
 		DPRINTK(1, "firmware can't start\n");
 		rc = 12;
-		goto error_out1;
+		goto release_fw;
 	}
 
 	rc = 0;
-
- error_out1:
+release_fw:
 	release_firmware(fw_entry);
- error_out0:
+release_host:
 	sdio_release_host(card->func);
 	kfree(rom_buf);
 	return rc;
@@ -994,20 +989,20 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	ret = sdio_enable_func(func);
 	DPRINTK(5, "sdio_enable_func() %d\n", ret);
 	if (ret)
-		goto error_free_card;
+		goto free_card;
 
 	/* interrupt disable */
 	sdio_writeb(func, 0, INT_ENABLE, &ret);
 	if (ret)
-		goto error_free_card;
+		goto free_card;
 	sdio_writeb(func, 0xff, INT_PENDING, &ret);
 	if (ret)
-		goto error_disable_func;
+		goto disable_func;
 
 	/* setup interrupt handler */
 	ret = sdio_claim_irq(func, ks_sdio_interrupt);
 	if (ret)
-		goto error_disable_func;
+		goto disable_func;
 
 	sdio_release_host(func);
 
@@ -1020,11 +1015,11 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	netdev = alloc_etherdev(sizeof(*priv));
 	if (netdev = NULL) {
 		printk(KERN_ERR "ks7010 : Unable to alloc new net device\n");
-		goto error_release_irq;
+		goto release_irq;
 	}
 	if (dev_alloc_name(netdev, "wlan%d") < 0) {
 		printk(KERN_ERR "ks7010 :  Couldn't get name!\n");
-		goto error_free_netdev;
+		goto free_dev;
 	}
 
 	priv = netdev_priv(netdev);
@@ -1038,7 +1033,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	priv->ks_wlan_hw.read_buf = NULL;
 	priv->ks_wlan_hw.read_buf = kmalloc(RX_DATA_SIZE, GFP_KERNEL);
 	if (!priv->ks_wlan_hw.read_buf) {
-		goto error_free_netdev;
+		goto free_dev;
 	}
 	priv->dev_state = DEVICE_STATE_PREBOOT;
 	priv->net_dev = netdev;
@@ -1066,7 +1061,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 		printk(KERN_ERR
 		       "ks7010: firmware load failed !! retern code = %d\n",
 		       ret);
-		goto error_free_read_buf;
+		goto free_buf;
 	}
 
 	/* interrupt setting */
@@ -1094,7 +1089,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 	priv->ks_wlan_hw.ks7010sdio_wq = create_workqueue("ks7010sdio_wq");
 	if (!priv->ks_wlan_hw.ks7010sdio_wq) {
 		DPRINTK(1, "create_workqueue failed !!\n");
-		goto error_free_read_buf;
+		goto free_buf;
 	}
 
 	INIT_DELAYED_WORK(&priv->ks_wlan_hw.rw_wq, ks7010_rw_function);
@@ -1102,22 +1097,22 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 
 	ret = register_netdev(priv->net_dev);
 	if (ret)
-		goto error_free_read_buf;
+		goto free_buf;
 
 	return 0;
 
- error_free_read_buf:
+free_buf:
 	kfree(priv->ks_wlan_hw.read_buf);
 	priv->ks_wlan_hw.read_buf = NULL;
- error_free_netdev:
+free_dev:
 	free_netdev(priv->net_dev);
 	card->priv = NULL;
- error_release_irq:
+release_irq:
 	sdio_claim_host(func);
 	sdio_release_irq(func);
- error_disable_func:
+disable_func:
 	sdio_disable_func(func);
- error_free_card:
+free_card:
 	sdio_release_host(func);
 	sdio_set_drvdata(func, NULL);
 	kfree(card);
-- 
2.9.1

